import 'package:firebase_auth/firebase_auth.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/crashlytics_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationBloc extends BlocBase {
  late final _crashlyticsBloc = BlocProvider.master<CrashlyticsBloc>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _exceptionController.close();
  }

  @override
  void initState() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
        debugPrint('user => $user');
      }
    });
  }

  final _exceptionController =
      BehaviorSubject<FirebaseAuthException?>.seeded(null);
  Stream<FirebaseAuthException?> get onExceptionChange =>
      _exceptionController.stream;

  void clearException() => _exceptionController.sink.add(null);
  void _setException(FirebaseAuthException exception) =>
      _exceptionController.sink.add(exception);

  User? get currentUser => _auth.currentUser;

  Future<void> _checkEmailVerification(UserCredential userCredential) async {
    if (userCredential.user != null && !userCredential.user!.emailVerified) {
      await userCredential.user!.sendEmailVerification();
    }
  }

  Future<UserCredential?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _checkEmailVerification(userCredential);
      return userCredential;
    } on FirebaseAuthException catch (e, s) {
      _setException(e);
      _crashlyticsBloc.error(
        reason: e.code,
        exception: e,
        stackTrace: s,
      );
      return null;
    } catch (e, s) {
      _crashlyticsBloc.error(
        reason: "Erreur lors de la création de l'utilisateur",
        exception: e,
        stackTrace: s,
      );
      return null;
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _checkEmailVerification(userCredential);
      return userCredential;
    } on FirebaseAuthException catch (e, s) {
      _setException(e);
      _crashlyticsBloc.error(
        reason: e.code,
        exception: e,
        stackTrace: s,
      );
      return null;
    } catch (e, s) {
      _crashlyticsBloc.error(
        reason: "Erreur lors de la connexion par l'utilisateur",
        exception: e,
        stackTrace: s,
      );
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e, s) {
      _setException(e);
      _crashlyticsBloc.error(
        reason: e.code,
        exception: e,
        stackTrace: s,
      );
    } catch (e, s) {
      _crashlyticsBloc.error(
        reason: "Erreur lors de la déconnexion de l'utilisateur",
        exception: e,
        stackTrace: s,
      );
    }
  }

  Future<void> deleteUser() async {
    try {
      await currentUser?.delete();
    } on FirebaseAuthException catch (e, s) {
      _setException(e);
      _crashlyticsBloc.error(
        reason: e.code,
        exception: e,
        stackTrace: s,
      );
    } catch (e, s) {
      _crashlyticsBloc.error(
        reason: "Erreur lors de la suppression de l'utilisateur",
        exception: e,
        stackTrace: s,
      );
    }
  }
}
