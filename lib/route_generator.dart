import 'package:firebase_auth/firebase_auth.dart';
import 'package:flunancier/pages/account_detail_page.dart';
import 'package:flunancier/pages/add_account_page.dart';
import 'package:flunancier/pages/add_transaction_page.dart';
import 'package:flunancier/pages/login_page.dart';
import 'package:flunancier/pages/my_account_page.dart';
import 'package:flunancier/pages/register_page.dart';
import 'package:flutter/material.dart';

mixin RouteGenerator {
  static String get initialRoute {
    if (FirebaseAuth.instance.currentUser != null) {
      return MyAccountPage.routeName;
    }
    return LoginPage.routeName;
  }

  static Widget _transitionsBuilderRightToLeft(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1, 0);
    const end = Offset.zero;
    const curve = Curves.easeOut;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  static Widget _transitionsBuilderLeftToRight(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(-1, 0);
    const end = Offset.zero;
    const curve = Curves.easeOut;

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final settingsUri = Uri.parse(settings.name!);
    switch (settingsUri.path) {
      case LoginPage.routeName:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionsBuilder: _transitionsBuilderLeftToRight,
        );
      case RegisterPage.routeName:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const RegisterPage(),
          transitionsBuilder: _transitionsBuilderLeftToRight,
        );
      case MyAccountPage.routeName:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const MyAccountPage(),
          transitionsBuilder: _transitionsBuilderRightToLeft,
        );
      case AccountDetailPage.routeName:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const AccountDetailPage(),
          transitionsBuilder: _transitionsBuilderRightToLeft,
        );
      case AddTransactionPage.routeName:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const AddTransactionPage(),
          transitionsBuilder: _transitionsBuilderRightToLeft,
        );
      case AddAccountPage.routeName:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const AddAccountPage(),
          transitionsBuilder: _transitionsBuilderRightToLeft,
        );
      default:
        return null;
    }
  }
}
