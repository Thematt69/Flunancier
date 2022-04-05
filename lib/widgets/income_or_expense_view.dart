import 'package:flunancier/models/transaction.dart';
import 'package:flutter/material.dart';

class IncomeOrExpenseView extends StatelessWidget {
  const IncomeOrExpenseView({
    Key? key,
    required this.tabController,
    required this.onSelect,
  }) : super(key: key);

  final TabController tabController;

  final void Function(TransactionType transactionType) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onSelect(TransactionType.expense);
            tabController.animateTo(1);
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Ink(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart_outlined, size: 32),
                const SizedBox(height: 8),
                Text(
                  'Dépense',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {
            onSelect(TransactionType.income);
            tabController.animateTo(1);
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Ink(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.25,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 5,
                  color: Colors.grey,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.payments_outlined, size: 32),
                const SizedBox(height: 8),
                Text(
                  'Revenu',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
