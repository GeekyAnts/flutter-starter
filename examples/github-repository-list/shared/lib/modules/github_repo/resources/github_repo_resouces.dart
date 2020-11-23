import 'package:api_sdk/main.dart';
import 'package:shared/modules/github_repo/models/repo.dart';

class GithubRepoResources {
  static Future<List<Repo>> getData() async {
    final response = await ApiSdk.fetchGithubRepoGraphQl(10);
    final List<dynamic> repos =
        response.data['viewer']['repositories']['nodes'] as List<dynamic>;

    final List<Repo> listOfRepos = repos
        .map((dynamic e) => Repo(
              id: e['id'] as String,
              name: e['name'] as String,
              viewerHasStarred: e['viewerHasStarred'] as bool,
            ))
        .toList();

    return listOfRepos;
  }
}
