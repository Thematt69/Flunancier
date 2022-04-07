import 'package:firebase_core/firebase_core.dart';
import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/crashlytics_bloc.dart';
import 'package:flunancier/blocs/store_bloc.dart';
import 'package:flunancier/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/intl.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _init() async {
    await Firebase.initializeApp();

    FlutterNativeSplash.remove();

    Intl.defaultLocale = 'fr_FR';
  }

  static const _supportedLocales = [Locale('fr', 'FR')];
  static const _locale = Locale('fr', 'FR');

  static const _localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeData(primarySwatch: Colors.orange);
    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            title: 'Flunancier',
            theme: _theme,
            locale: _locale,
            supportedLocales: _supportedLocales,
            localizationsDelegates: _localizationsDelegates,
            home: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return BlocProvider(
          key: GlobalKey(),
          blocs: [
            AuthenticationBloc(),
            AnalyticsBloc(),
            CrashlyticsBloc(),
            StoreBloc(),
          ],
          child: MaterialApp(
            title: 'Flunancier',
            theme: _theme,
            locale: _locale,
            supportedLocales: _supportedLocales,
            localizationsDelegates: _localizationsDelegates,
            initialRoute: RouteGenerator.initialRoute,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
          ),
        );
      },
    );
  }
}
