import 'package:flunancier/models/transaction.dart';

extension PaymentMethodExtension on PaymentMethod {
  String get label {
    switch (this) {
      case PaymentMethod.check:
        return 'Chèque';
      case PaymentMethod.card:
        return 'Carte';
      case PaymentMethod.transfer:
        return 'Virement';
      case PaymentMethod.cash:
        return 'Espèces';
      case PaymentMethod.directDebit:
        return 'Prélèvement';
      case PaymentMethod.interests:
        return 'Intérêts';
      case PaymentMethod.undefined:
        return 'Indéfinie';
    }
  }
}
