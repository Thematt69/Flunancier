import 'package:flunancier/models/transaction_category.dart';
import 'package:flunancier/models/transaction_sub_category.dart';
import 'package:flunancier/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.currentCategory,
    required this.categories,
    required this.onPressed,
  }) : super(key: key);

  final TransactionSubCategory? currentCategory;
  final List<TransactionSubCategory> categories;
  final void Function(TransactionSubCategory) onPressed;

  double _sizeItem(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 500) {
      return (width - ((20 * 2 + 16 * 2) + (8 * 3) + (2 * 2) + 10)) / 3;
    } else if (width < 700) {
      return (width - ((20 * 2 + 16 * 2) + (8 * 4) + (2 * 3) + 10)) / 4;
    } else if (width < 900) {
      return (width - ((20 * 2 + 16 * 2) + (8 * 5) + (2 * 4) + 10)) / 5;
    } else {
      return 150;
    }
  }

  void _showSubDialog(
    BuildContext context,
    List<TransactionSubCategory> subCategories,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 900),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 2,
                runSpacing: 2,
                children: List.generate(
                  subCategories.length,
                  (index) => Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        onPressed(subCategories[index]);
                        Navigator.pop(context);
                        Navigator.pop(context);
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
                              subCategories[index].icon,
                              color: subCategories[index].color,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subCategories[index].name,
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      label: currentCategory?.name ?? 'Catégorie',
      leadingIcon: currentCategory?.icon,
      style: TextButton.styleFrom(primary: currentCategory?.color),
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(maxWidth: 900),
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 2,
                  runSpacing: 2,
                  children: List.generate(
                    categories.length,
                    (index) => Card(
                      elevation: 2,
                      child: InkWell(
                        onTap: () {
                          if (categories[index] is TransactionCategory &&
                              (categories[index] as TransactionCategory)
                                  .subCategory
                                  .isNotEmpty) {
                            final transactionCategory =
                                categories[index] as TransactionCategory;
                            _showSubDialog(
                              context,
                              transactionCategory.subCategory,
                            );
                          } else {
                            onPressed(categories[index]);
                            Navigator.pop(context);
                          }
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        child: Ink(
                          padding: const EdgeInsets.all(8),
                          width: _sizeItem(context),
                          height: _sizeItem(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                categories[index].icon,
                                color: categories[index].color,
                                size: 28,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                categories[index].name,
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
        },
      ),
    );
  }
}
