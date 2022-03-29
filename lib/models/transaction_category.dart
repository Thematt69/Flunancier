import 'package:flunancier/models/transaction_sub_category.dart';
import 'package:flutter/material.dart';

class TransactionCategory extends TransactionSubCategory {
  static const entryName = 'name';
  static const entryIcon = 'icon';
  static const entryColor = 'color';
  static const entrySubCategory = 'subCategory';

  final List<TransactionSubCategory> subCategory;

  const TransactionCategory({
    required String name,
    required IconData icon,
    required Color color,
    required this.subCategory,
  }) : super(name: name, icon: icon, color: color);

  factory TransactionCategory.fromFireStore(Map<String, dynamic> json) =>
      TransactionCategory(
        name: json[entryName] as String,
        icon: IconData(json[entryIcon] as int, fontFamily: 'MaterialIcons'),
        color: Color(json[entryColor] as int),
        subCategory: json[entrySubCategory] is List
            ? (json[entrySubCategory] as List)
                .map(
                  (e) => TransactionSubCategory.fromFireStore(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList()
            : <TransactionSubCategory>[],
      );

  @override
  Map<String, dynamic> toFirestore() => {
        entryName: name,
        entryIcon: icon.codePoint,
        entryColor: color.value,
        entrySubCategory: subCategory.map((e) => e.toFirestore()).toList(),
      };

  @override
  List<Object> get props {
    return [
      name,
      icon,
      color,
      subCategory,
    ];
  }

  @override
  String toString() {
    return 'TransactionCategory(name: $name, icon: $icon, color: $color, subCategory: $subCategory)';
  }
}
