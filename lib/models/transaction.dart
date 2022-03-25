import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:flunancier/models/transaction_category.dart';

enum PaymentMethod {
  undefined,
  check,
  card,
  transfer,
  cash,
  directDebit,
  interests,
}

class Transaction extends Equatable {
  static const collectionName = "transactions";
  static const entryUuid = "uuid";
  static const entryName = "name";
  static const entryMontant = "montant";
  static const entryDateTime = "dateTime";
  static const entryCategory = "category";
  static const entryPaymentMethod = "paymentMethod";
  static const entryAccountUuid = "accountUuid";

  final String uuid;
  final String name;
  final double montant;
  final DateTime dateTime;
  final TransactionCategory category;
  final PaymentMethod paymentMethod;
  final String accountUuid;

  const Transaction({
    required this.uuid,
    required this.name,
    required this.montant,
    required this.dateTime,
    required this.category,
    required this.paymentMethod,
    required this.accountUuid,
  });

  factory Transaction.fromFireStore(Map<String, dynamic> json) => Transaction(
        uuid: json[entryUuid] as String,
        name: json[entryName] as String,
        montant: json[entryMontant] as double,
        dateTime: (json[entryDateTime] as Timestamp).toDate(),
        category: TransactionCategory.fromFireStore(
          json[entryCategory] as Map<String, dynamic>,
        ),
        paymentMethod: PaymentMethod.values[json[entryAccountUuid] as int],
        accountUuid: json[entryAccountUuid] as String,
      );

  Map<String, dynamic> toFirestore() => {
        entryUuid: uuid,
        entryName: name,
        entryMontant: montant,
        entryDateTime: Timestamp.fromDate(dateTime),
        entryCategory: category.toFirestore(),
        entryPaymentMethod: paymentMethod.index,
        entryAccountUuid: accountUuid,
      };

  @override
  List<Object> get props {
    return [
      uuid,
      name,
      montant,
      dateTime,
      category,
      paymentMethod,
      accountUuid,
    ];
  }

  @override
  String toString() {
    return 'Transaction(uuid: $uuid, name: $name, montant: $montant, dateTime: $dateTime, category: $category, paymentMethod: $paymentMethod, accountUuid: $accountUuid)';
  }
}
