import 'package:flutter/material.dart';

class IndicatorMontant extends StatelessWidget {
  const IndicatorMontant({
    Key? key,
    required this.montant,
  }) : super(key: key);

  final num montant;

  @override
  Widget build(BuildContext context) {
    MaterialColor _color = Colors.green;
    if (montant.isNegative) {
      _color = Colors.red;
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _color.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text(
          '$montant €',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: _color[900]),
        ),
      ),
    );
  }
}
