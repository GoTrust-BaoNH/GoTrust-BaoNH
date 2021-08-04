import 'package:flutter/material.dart';

import 'package:gotrust_repository_data/gotrust_repository_data.dart' as repository_data;
import 'package:gotrust_auth_data/gotrust_auth_data.dart' as auth_data;
import 'base/di.dart';
import 'main_app.dart';
import 'shared/constants/common.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init(UAT_ENVIRONMENT);
  await auth_data.GoTrustAuthData.init(environment: UAT_ENVIRONMENT);
  await repository_data.init(environment: UAT_ENVIRONMENT);

  runApp(App());
  configLoading();
}
