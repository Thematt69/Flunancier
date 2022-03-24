import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flunancier/blocs/bloc_provider.dart';

class AnalyticsBloc extends BlocBase {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  Future<void> logLogin() async {
    await _analytics.logLogin(
      loginMethod: "email",
    );
  }

  Future<void> logRegister() async {
    await _analytics.logSignUp(
      signUpMethod: "email",
    );
  }

  Future<void> setScreenName(String routeName) async {
    await _analytics.setCurrentScreen(
      screenName: routeName,
    );
  }

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(
      id: userId,
    );
  }
}
