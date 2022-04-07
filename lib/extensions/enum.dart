import 'package:flunancier/models/transaction.dart';
import 'package:flutter/material.dart';

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

  IconData get icon {
    switch (this) {
      case PaymentMethod.check:
        return Icons.note_outlined;
      case PaymentMethod.card:
        return Icons.credit_card_outlined;
      case PaymentMethod.transfer:
        return Icons.swap_horiz_outlined;
      case PaymentMethod.cash:
        return Icons.payments_outlined;
      case PaymentMethod.directDebit:
        return Icons.account_balance_outlined;
      case PaymentMethod.interests:
        return Icons.account_balance_wallet_outlined;
      case PaymentMethod.undefined:
        return Icons.help_outline_outlined;
    }
  }
}
