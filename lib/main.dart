import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/config/config_service.dart';
import 'package:flutter_application_5/featureDocView/data/datasource/user_remote_data_source.dart';
import 'package:flutter_application_5/featureDocView/data/repository/user_repository_impl.dart';
import 'package:flutter_application_5/featureDocView/domain/useCases/fetch_users.dart';
import 'package:flutter_application_5/featureDocView/presentation/pages/Login.dart';
import 'package:flutter_application_5/featureDocView/presentation/provider/language.dart';
import 'package:flutter_application_5/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigService.loadConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    final remoteDataSource = UserRemoteDataSource(client: httpClient);
    final userRepository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
    final fetchUsers = FetchUsers(userRepository);

    return ChangeNotifierProvider(
      create: (context) => Language(),
      child: Consumer<Language>(
        builder: (context, language, child) {
          return MaterialApp(
            locale:  Locale(language.currentLanguage),
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
        },
      ),
    );
  }
}
