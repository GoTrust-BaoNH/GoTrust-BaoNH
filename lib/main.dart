import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart' as repository_data;
import 'package:gotrust_auth_data/gotrust_auth_data.dart' as auth_data;

import 'base/di.dart';
import 'main_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DependencyInjection.init(DEV_ENVIRONMENT);
  await auth_data.GoTrustAuthData.init(environment: DEV_ENVIRONMENT);
  await repository_data.init(environment: DEV_ENVIRONMENT);

  runApp(App());
  configLoading();
}
