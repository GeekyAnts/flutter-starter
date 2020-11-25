// home screen contents
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/screens/products/product_card.dart';

import 'package:app/src/utils/app_state_notifier.dart';
import 'package:app/src/widgets/cache_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared/main.dart';
import 'package:app/src/config/string_constants.dart' as string_constants;
import 'package:shared/modules/products/models/product_model.dart';

class HomeScreen extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;
  List<Product> products;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<FirebaseCRUDoperations>(context);
    authenticationBloc.add(GetUserData());
    return WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            cubit: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                return Scaffold(
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
                            productProvider.fetchProducts();
                            // authenticationBloc.add(UserLogOut());
                          }),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.pushNamed(context, '/addProduct');
                          }),
                    ],
                  ),
                  body: Container(
                    child: FutureBuilder<List<Product>>(
                      future: productProvider.fetchProducts(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Product>> snapshot) {
                        if (snapshot.hasData) {
                          print('hello ${snapshot.data}');
                          products = snapshot.data;
                          return ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (buildContext, index) =>
                                ProductCard(productDetails: products[index]),
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
                                      imageUrl:
                                          state.currentUserData.data.avatar,
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
                          title: Text(
                              '${state.currentUserData.data.firstName} ${state.currentUserData.data.lastName}',
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                        ListTile(
                          title: Text(state.currentUserData.data.email,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                        ListTile(
                          title: Text(state.currentUserData.ad.company,
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
