import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_export.dart';

final repoProvider = Provider<AuthenticationRepository>((ref) {
  return AuthenticationRepository();
});
