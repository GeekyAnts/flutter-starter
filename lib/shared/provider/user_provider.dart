import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_export.dart';

final userProvider = FutureProvider<CurrentUserData>((ref) async {
  final currentUserId = SharedPrefs.instance.getUserId();
  final data = await ref.watch(repoProvider).getUserData(currentUserId ?? 4);
  return CurrentUserData.fromJson(data);
});
