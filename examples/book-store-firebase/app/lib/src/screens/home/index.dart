// home screen contents
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;
import 'package:app/src/screens/bookstore/book_card.dart';
import 'package:app/src/utils/app_state_notifier.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;

  @override
  Widget build(BuildContext context) {
    print("Home Screen");
    final bookstoreProvider = Provider.of<FirebaseCRUDoperations>(context);
    authenticationBloc.add(GetUserData());
    List<BookStore> bookstore;
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                return Scaffold(
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addBooks');
                    },
                    child: Icon(
                      Icons.add,
                      size: 24,
                    ),
                  ),
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                      string_constants.app_bar_title,
                      style: Theme.of(context).appBarTheme.textTheme.bodyText1,
                    ),
                    actions: [
                      IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () {
                            authenticationBloc.add(UserLogOut());
                          }),
                    ],
                  ),
                  body: Container(
                    child: FutureBuilder<List<BookStore>>(
                      future: bookstoreProvider.fetchBookStores(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<BookStore>> snapshot) {
                        if (snapshot.hasData) {
                          print('hello ${snapshot.data}');
                          bookstore = snapshot.data;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.5, crossAxisCount: 2),
                            itemCount: bookstore.length,
                            itemBuilder: (buildContext, index) =>
                                BookCard(bookStoreDetails: bookstore[index]),
                          );
                        } else {
                          return Text('fetching');
                        }
                      },
                    ),
                  ),
                  drawer: Drawer(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white),
                                    child: CachedImage(
                                      imageUrl: state.avatar,
                                      fit: BoxFit.fitWidth,
                                      errorWidget: Image.network(
                                        AllImages().kDefaultImage,
                                      ),
                                      width: 80,
                                      height: 80,
                                      placeholder: CircularProgressIndicator(),
                                    ),
                                  ),
                                  Switch(
                                    value:
                                        Provider.of<AppStateNotifier>(context)
                                            .isDarkMode,
                                    onChanged: (value) {
                                      Provider.of<AppStateNotifier>(context,
                                              listen: false)
                                          .updateTheme(value);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        ListTile(
                          title: Text(state.email,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }));
  }
}
