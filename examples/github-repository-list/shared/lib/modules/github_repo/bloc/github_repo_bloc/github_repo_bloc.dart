import 'package:bloc/bloc.dart';
import 'package:shared/main.dart';

class GithubRepoBloc extends Bloc<GithubRepoEvent, GithubRepoState> {
  GithubRepoBloc() : super(GithubRepoStateInitial());

  @override
  Stream<GithubRepoState> mapEventToState(GithubRepoEvent event) async* {
    if (event is GithubRepoDataLoadingEvent) {
      yield GithubRepoStateLoading();
      var fetchedData = await GithubRepoResources.getData();
      yield GithubRepoDataLoadedState(repositoryData: fetchedData);
    }
  }
}
