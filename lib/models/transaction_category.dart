import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TypeTransaction { expenses, income }

class TransactionCategory extends Equatable {
  static const entryName = "name";
  static const entryColor = "color";
  static const entryType = "type";
  static const entrySubCategory = "subCategory";

  final String name;
  final Color color;
  final TypeTransaction type;
  final List<TransactionCategory> subCategory;

  const TransactionCategory({
    required this.name,
    required this.color,
    required this.type,
    required this.subCategory,
  });

  factory TransactionCategory.fromFireStore(Map<String, dynamic> json) =>
      TransactionCategory(
        name: json[entryName] as String,
        color: Color(json[entryColor] as int),
        type: TypeTransaction.values[json[entryType] as int],
        subCategory: json[entrySubCategory] is List
            ? (json[entrySubCategory] as List)
                .map(
                  (e) => TransactionCategory.fromFireStore(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList()
            : <TransactionCategory>[],
      );

  Map<String, dynamic> toFirestore() => {
        entryName: name,
        entryColor: color.value,
        entryType: type.index,
        entrySubCategory: subCategory.map((e) => e.toFirestore()), // TODO
      };

  @override
  List<Object?> get props {
    return [
      name,
      color,
      type,
      subCategory,
    ];
  }

  @override
  String toString() {
    return 'TransactionCategory(name: $name, color: $color, type: $type, subCategory: $subCategory)';
  }
}
