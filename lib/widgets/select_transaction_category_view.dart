import 'package:flunancier/models/transaction_category.dart';
import 'package:flutter/material.dart';

class SelectTransactionCategoryView extends StatelessWidget {
  const SelectTransactionCategoryView({
    Key? key,
    required this.tabController,
    required this.transactionCategories,
    required this.onSelect,
  }) : super(key: key);

  final TabController tabController;
  final List<TransactionCategory> transactionCategories;
  final void Function(TransactionCategory transactionCategory) onSelect;

  double _sizeItem(BuildContext context) {
    final width = MediaQuery.of(context).size.width - (16 * 2 + 8 * 2);
    double result;
    if ((width / 6) > 110) {
      result = (width - (2 * 5) - (10 * 6)) / 6;
    } else if ((width / 5) > 110) {
      result = (width - (2 * 4) - (10 * 5)) / 5;
    } else if ((width / 4) > 110) {
      result = (width - (2 * 3) - (10 * 4)) / 4;
    } else if ((width / 3) > 110) {
      result = (width - (2 * 2) - (10 * 3)) / 3;
    } else if ((width / 2) > 110) {
      result = (width - (2 * 1) - (10 * 2)) / 2;
    } else {
      result = width - (2 * 0) - (10 * 1);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 2,
            runSpacing: 2,
            children: List.generate(
              transactionCategories.length,
              (index) => Card(
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    onSelect(transactionCategories[index]);
                    tabController.animateTo(2);
                    // if (transactionCategories[index] is TransactionCategory &&
                    //     (transactionCategories[index] as TransactionCategory)
                    //         .subCategory
                    //         .isNotEmpty) {
                    //   final transactionCategory =
                    //       transactionCategories[index] as TransactionCategory;
                    //   // TODO - Add a new tab for sub categories
                    // } else {
                    //   tabController.animateTo(2);
                    // }
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Ink(
                    padding: const EdgeInsets.all(8),
                    width: _sizeItem(context),
                    height: _sizeItem(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          transactionCategories[index].icon,
                          color: transactionCategories[index].color,
                          size: 28,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          transactionCategories[index].name,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
