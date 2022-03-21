import 'package:bloc/bloc.dart';
import 'package:shared/modules/github_repo/bloc/github_repo_bloc/github_repo_public.dart';

class GithubRepoBloc extends Bloc<GithubRepoEvent, GithubRepoState> {
  GithubRepoBloc() : super(GithubRepoStateInitial()) {
    on<GithubRepoDataLoadingEvent>(onGithubRepoDataLoadingEvent);
  }

  onGithubRepoDataLoadingEvent(
      GithubRepoDataLoadingEvent event, Emitter<GithubRepoState> emit) async {
    if (event is GithubRepoDataLoadingEvent) {
      emit(GithubRepoStateLoading());
      var fetchedData = await GithubRepoResources.getData();
      emit(GithubRepoDataLoadedState(repositoryData: fetchedData));
    }
  }
}
