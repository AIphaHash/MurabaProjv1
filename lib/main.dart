import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/config/config_service.dart';
import 'package:flutter_application_5/featureDocView/presentation/bloc/language_bloc.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/Login.dart';
import 'package:flutter_application_5/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigService.loadConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LanguageBloc(),
        child:
            BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
          String locale = 'ar';
          if (state is LanguageChange) {
            locale = state.language;
          }
          return MaterialApp(
            navigatorKey: Get.key, //  Allows using GetX navigatior
            locale: Locale(locale),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: Login(),
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
