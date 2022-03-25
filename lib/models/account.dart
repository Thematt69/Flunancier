import 'package:equatable/equatable.dart';

class Account extends Equatable {
  static const collectionName = "accounts";
  static const entryUuid = "uuid";
  static const entryName = "name";
  static const entryTotal = "total";
  static const entryTotalMax = "totalMax";
  static const entryUserId = "userId";

  final String uuid;
  final String name;
  final double total;
  final double? totalMax;
  final String userId;

  const Account({
    required this.uuid,
    required this.name,
    required this.total,
    required this.totalMax,
    required this.userId,
  });

  factory Account.fromFireStore(Map<String, dynamic> json) => Account(
        uuid: json[entryUuid] as String,
        name: json[entryName] as String,
        total: json[entryTotal] as double,
        totalMax: json[entryTotalMax] as double?,
        userId: json[entryUserId] as String,
      );

  Map<String, dynamic> toFirestore() => {
        entryUuid: uuid,
        entryName: name,
        entryTotal: total,
        entryTotalMax: totalMax,
        entryUserId: userId,
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      name,
      total,
      totalMax,
      userId,
    ];
  }

  @override
  String toString() {
    return 'Account(uuid: $uuid, name: $name, total: $total, totalMax: $totalMax, userId: $userId)';
  }
}
