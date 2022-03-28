import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TransactionSubCategory extends Equatable {
  static const entryName = 'name';
  static const entryIcon = 'icon';
  static const entryColor = 'color';

  final String name;
  final IconData icon;
  final Color color;

  const TransactionSubCategory({
    required this.name,
    required this.icon,
    required this.color,
  });

  factory TransactionSubCategory.fromFireStore(Map<String, dynamic> json) =>
      TransactionSubCategory(
        name: json[entryName] as String,
        icon: IconData(json[entryIcon] as int, fontFamily: 'MaterialIcons'),
        color: Color(json[entryColor] as int),
      );

  Map<String, dynamic> toFirestore() => {
        entryName: name,
        entryIcon: icon.codePoint,
        entryColor: color.value,
      };

  @override
  List<Object> get props {
    return [
      name,
      icon,
      color,
    ];
  }

  @override
  String toString() {
    return 'TransactionSubCategory(name: $name, icon: $icon, color: $color)';
  }
}
