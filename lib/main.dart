import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inner_spark_app/app.dart';
import 'package:inner_spark_app/models/user.dart';
import 'package:inner_spark_app/router.dart';

void main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();

  /* Initialize current user */
  final container = ProviderContainer();
  final user = await container.read(userNotifierProvider.future);
  if (user != null) {
    router.go('/');
  }

  FlutterNativeSplash.remove();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('en'), Locale('ru')],
        fallbackLocale: const Locale('en'),
        assetLoader: const YamlAssetLoader(),
        child: const App(),
      ),
    ),
  );
}
