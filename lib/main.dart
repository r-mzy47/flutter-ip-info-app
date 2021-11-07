import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:get_ip_info/features/ip_info/data/repos/ip_info_repository_impl.dart';
import 'package:get_ip_info/features/ip_info/domain/repos/ip_info_repository.dart';
import 'package:get_ip_info/features/ip_info/domain/use_cases/get_ip_info_usecase.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/ip_data_provider.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/lang_theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/dependancy_injection.dart';
import 'features/ip_info/presentation/pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await init();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LangThemeProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContextcontext) {
    return Consumer<LangThemeProvider>(builder: (context, model, __) {
      return MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: model.lang,
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('fa', ''), // Spanish, no country code
        ],
        theme: model.themeData,
        home: HomePage(),
      );
    });
  }
}
