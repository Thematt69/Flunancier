import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/crashlytics_bloc.dart';
import 'package:flunancier/blocs/store_bloc.dart';
import 'package:flunancier/pages/account_detail_page.dart';
import 'package:flunancier/pages/add_transaction_page.dart';
import 'package:flunancier/pages/login_page.dart';
import 'package:flunancier/pages/my_account_page.dart';
import 'package:flunancier/pages/register_page.dart';
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

  @override
  Widget build(BuildContext context) {
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
        String _initialRoute = LoginPage.routeName;
        if (FirebaseAuth.instance.currentUser != null) {
          _initialRoute = MyAccountPage.routeName;
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
            title: 'Flutter Demo',
            theme: _theme,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: const Locale('fr', 'FR'),
            initialRoute: _initialRoute,
            routes: {
              MyAccountPage.routeName: (context) => const MyAccountPage(),
              LoginPage.routeName: (context) => const LoginPage(),
              RegisterPage.routeName: (context) => const RegisterPage(),
              AccountDetailPage.routeName: (context) =>
                  const AccountDetailPage(),
              AddTransactionPage.routeName: (context) =>
                  const AddTransactionPage(),
            },
          ),
        );
      },
    );
  }
}
