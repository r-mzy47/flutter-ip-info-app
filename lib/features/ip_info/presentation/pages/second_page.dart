import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/ip_data_provider.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/lang_theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
        ),
        body: Consumer<IpDataProvider>(builder: (context, data, __) {
          if (data.state is LoadedIpDateState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text((data.state as LoadedIpDateState ).ipDataModel.country ),
                  Text((data.state as LoadedIpDateState ).ipDataModel.ip ),
                  Text((data.state as LoadedIpDateState ).ipDataModel.cc ),
                ],
              ),
            );
          }
          if (data.state is ErrorIpDataState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text((data.state as ErrorIpDataState).message),
                  ElevatedButton(onPressed: () {
                    context.read<IpDataProvider>().load();
                  }, child: Text(AppLocalizations.of(context)!.retry)),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
