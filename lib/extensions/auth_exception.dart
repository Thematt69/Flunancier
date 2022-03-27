import 'package:firebase_auth/firebase_auth.dart';

extension AuthExceptionExtension on FirebaseAuthException {
  String get messageException {
    switch (code) {
      case 'user-not-found':
        return 'Aucun utilisateur trouvé pour cet e-mail.';
      case 'wrong-password':
        return 'Mauvais mot de passe fourni pour cet utilisateur.';
      case 'invalid-email':
        return "L'adresse e-mail n'est pas valide.";
      case 'user-disabled':
        return "L'utilisateur correspondant à l'e-mail donné a été désactivé.";
      case 'unauthorized-continue-uri':
        return "Le domaine de l'URL d'origine n'est pas sur la liste blanche. Ajoutez le domaine à la liste blanche dans la console Firebase.";
      default:
        return 'Exception inconnue';
    }
  }
}
