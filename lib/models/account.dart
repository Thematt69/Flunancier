import 'package:equatable/equatable.dart';

class Account extends Equatable {
  static const collectionName = 'accounts';
  static const entryUuid = 'uuid';
  static const entryName = 'name';
  static const entryTotal = 'total';
  static const entryPlafond = 'plafond';
  static const entryUserId = 'userId';

  final String uuid;
  final String name;
  final num total;
  final num? plafond;
  final String userId;

  const Account({
    required this.uuid,
    required this.name,
    required this.total,
    required this.plafond,
    required this.userId,
  });

  factory Account.fromFireStore(Map<String, dynamic> json) => Account(
        uuid: json[entryUuid] as String,
        name: json[entryName] as String,
        total: json[entryTotal] as num,
        plafond: json[entryPlafond] as num?,
        userId: json[entryUserId] as String,
      );

  Map<String, dynamic> toFirestore() => {
        entryUuid: uuid,
        entryName: name,
        entryTotal: total,
        entryPlafond: plafond,
        entryUserId: userId,
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      name,
      total,
      plafond,
      userId,
    ];
  }

  @override
  String toString() {
    return 'Account(uuid: $uuid, name: $name, total: $total, totalMax: $plafond, userId: $userId)';
  }
}
