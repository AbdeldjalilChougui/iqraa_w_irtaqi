import 'package:easy_localization/easy_localization.dart';
import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:iqraa_w_irtaqi/app/app.router.dart';
import 'package:iqraa_w_irtaqi/ui/setup_bottomsheet_ui.dart';
import 'package:iqraa_w_irtaqi/ui/setup_dialogui.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'UK'), Locale('ar', 'DZ'),],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'DZ'),
      saveLocale: true,
      startLocale: const Locale('ar', 'DZ'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إقرأ و ارتقي',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'ExpoArabic',
      ),
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}