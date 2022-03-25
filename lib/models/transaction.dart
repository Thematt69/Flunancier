import 'package:equatable/equatable.dart';

import 'package:flunancier/models/transaction_category.dart';

class Transaction extends Equatable {
  static const entryUuid = "uuid";
  static const entryName = "name";
  static const entryMontant = "montant";
  static const entryCategory = "category";
  static const entryAccountUuid = "accountUuid";

  final String uuid;
  final String name;
  final double montant;
  final TransactionCategory category;
  final String accountUuid;

  const Transaction({
    required this.uuid,
    required this.name,
    required this.montant,
    required this.category,
    required this.accountUuid,
  });

  factory Transaction.fromFireStore(Map<String, dynamic> json) => Transaction(
        uuid: json[entryUuid] as String,
        name: json[entryName] as String,
        montant: json[entryMontant] as double,
        category: TransactionCategory.fromFireStore(
          json[entryCategory] as Map<String, dynamic>,
        ),
        accountUuid: json[entryAccountUuid] as String,
      );

  Map<String, dynamic> toFirestore() => {
        entryUuid: uuid,
        entryName: name,
        entryMontant: montant,
        entryCategory: category.toFirestore(),
        entryAccountUuid: accountUuid,
      };

  @override
  List<Object> get props {
    return [
      uuid,
      name,
      montant,
      category,
      accountUuid,
    ];
  }

  @override
  String toString() {
    return 'Transaction(uuid: $uuid, name: $name, montant: $montant, category: $category, accountUuid: $accountUuid)';
  }
}
