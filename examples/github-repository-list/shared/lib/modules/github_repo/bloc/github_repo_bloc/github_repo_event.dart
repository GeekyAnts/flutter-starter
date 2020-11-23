import 'package:equatable/equatable.dart';

abstract class GithubRepoEvent extends Equatable {
  const GithubRepoEvent();

  @override
  List<Object> get props => [];
}

class GithubRepoDataLoadingEvent extends GithubRepoEvent {}
