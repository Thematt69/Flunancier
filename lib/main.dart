import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/crashlytics_bloc.dart';
import 'package:flunancier/pages/login_page.dart';
import 'package:flunancier/pages/my_home_page.dart';
import 'package:flunancier/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _init() async {
    await Firebase.initializeApp();

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    String _initialRoute = LoginPage.routeName;
    final _theme = ThemeData(primarySwatch: Colors.orange);
    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: _theme,
            locale: const Locale('fr', 'FR'),
            home: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (FirebaseAuth.instance.currentUser != null) {
          _initialRoute = MyHomePage.routeName;
        }
        return BlocProvider(
          key: GlobalKey(),
          blocs: [
            AuthenticationBloc(),
            AnalyticsBloc(),
            CrashlyticsBloc(),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: _theme,
            locale: const Locale('fr', 'FR'),
            initialRoute: _initialRoute,
            routes: {
              MyHomePage.routeName: (context) =>
                  const MyHomePage(title: 'Flutter Demo Home Page'),
              LoginPage.routeName: (context) => const LoginPage(),
              RegisterPage.routeName: (context) => const RegisterPage(),
            },
          ),
        );
      },
    );
  }
}
