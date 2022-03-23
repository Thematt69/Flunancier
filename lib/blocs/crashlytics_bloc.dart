import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsBloc extends BlocBase {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initState() {
    if (!kIsWeb) {
      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = _crashlytics.recordFlutterError;
    }
  }

  void error({
    required String? reason,
    required Object exception,
    StackTrace? stackTrace,
  }) {
    if (!kIsWeb) {
      _crashlytics.recordError(
        exception,
        stackTrace,
        reason: reason ?? 'A non-fatal error has occurred',
      );
    }
  }

  void setUserIdentifier(String userIdentifier) {
    if (!kIsWeb) _crashlytics.setUserIdentifier(userIdentifier);
  }
}
