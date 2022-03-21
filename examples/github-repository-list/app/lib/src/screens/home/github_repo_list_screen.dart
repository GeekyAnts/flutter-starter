import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';

class GithubRepoListScreen extends StatefulWidget {
  @override
  _GithubRepoListScreenState createState() => _GithubRepoListScreenState();
}

class _GithubRepoListScreenState extends State<GithubRepoListScreen> {
  GithubRepoBloc githubRepoBloc;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubRepoBloc, GithubRepoState>(
        bloc: githubRepoBloc,
        builder: (BuildContext context, GithubRepoState state) {
          if (state is GithubRepoStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GithubRepoDataLoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.repositoryData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        state.repositoryData[index].name.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      trailing: state.repositoryData[index].viewerHasStarred
                          ? Icon(Icons.star)
                          : SizedBox(),
                    ),
                    Divider(
                      height: 10.0,
                    )
                  ],
                );
              },
            );
          }
          return SizedBox();
        });
  }

  @override
  void initState() {
    githubRepoBloc = GithubRepoBlocController().authenticationBloc;
    githubRepoBloc.add(GithubRepoDataLoadingEvent());
    super.initState();
  }
}
