import 'package:equatable/equatable.dart';
import 'package:flunancier/models/transaction_sub_category.dart';
import 'package:flutter/material.dart';

class TransactionCategory extends Equatable {
  static const entryName = 'name';
  static const entryIcon = 'icon';
  static const entryColor = 'color';
  static const entrySubCategory = 'subCategory';

  final String name;
  final IconData icon;
  final Color color;
  final List<TransactionSubCategory> subCategory;

  const TransactionCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.subCategory,
  });

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
