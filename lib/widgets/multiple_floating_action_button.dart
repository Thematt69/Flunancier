import 'dart:math' as math;

import 'package:flunancier/models/account.dart';
import 'package:flunancier/models/transaction.dart';
import 'package:flunancier/pages/add_transaction_page.dart';
import 'package:flutter/material.dart';

class MultipleFloatingActionButton extends StatefulWidget {
  const MultipleFloatingActionButton({
    Key? key,
    required this.account,
  }) : super(key: key);

  final Account? account;

  @override
  State createState() => MultipleFloatingActionButtonState();
}

class MultipleFloatingActionButtonState
    extends State<MultipleFloatingActionButton> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  void _pushNamed(TransactionType type) {
    Navigator.pushNamed(
      context,
      AddTransactionPage.routeName,
      arguments: {
        'account': widget.account,
        'type': type,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: const Interval(
                0.0,
                1.0,
                curve: Curves.easeOut,
              ),
            ),
            child: FloatingActionButton(
              tooltip: 'Ajouter une dépense',
              heroTag: null,
              mini: true,
              child: const Icon(Icons.shopping_cart_outlined),
              onPressed: () => _pushNamed(TransactionType.expense),
            ),
          ),
        ),
        Container(
          height: 70.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: const Interval(
                0.0,
                1.0,
                curve: Curves.easeOut,
              ),
            ),
            child: FloatingActionButton(
              tooltip: 'Ajouter un revenu',
              heroTag: null,
              mini: true,
              child: const Icon(Icons.payments_outlined),
              onPressed: () => _pushNamed(TransactionType.income),
            ),
          ),
        ),
        FloatingActionButton(
          tooltip: 'Ajouter une transaction',
          heroTag: null,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform(
                transform: Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                alignment: FractionalOffset.center,
                child: Icon(
                  _controller.isDismissed
                      ? Icons.add_card_outlined
                      : Icons.close_outlined,
                ),
              );
            },
          ),
          onPressed: () {
            if (_controller.isDismissed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
        )
      ],
    );
  }
}
