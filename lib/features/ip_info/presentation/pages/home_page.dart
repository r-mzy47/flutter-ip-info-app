import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:get_ip_info/features/ip_info/data/repos/ip_info_repository_impl.dart';
import 'package:get_ip_info/features/ip_info/presentation/pages/second_page.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/ip_data_provider.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/lang_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_ip_info/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<LangThemeProvider>().toggleLang();
                },
                child: Text(AppLocalizations.of(context)!.toggleLang),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LangThemeProvider>().toggleTheme();
                },
                child: Text(AppLocalizations.of(context)!.toggleTheme),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (contex) {
                        return MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                                create: (_) =>
                                    GetIt.I<IpDataProvider>()..load())
                          ],
                          child: SecondPage(),
                        );
                      },
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.loadData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
