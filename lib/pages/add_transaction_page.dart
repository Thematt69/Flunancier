import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/constants/transaction_categories.dart';
import 'package:flunancier/models/transaction.dart';
import 'package:flunancier/models/transaction_sub_category.dart';
import 'package:flunancier/widgets/income_or_expense_view.dart';
import 'package:flunancier/widgets/name_and_amount_view.dart';
import 'package:flunancier/widgets/select_date_time_view.dart';
import 'package:flunancier/widgets/select_payment_method_view.dart';
import 'package:flunancier/widgets/select_transaction_category_view.dart';
import 'package:flunancier/widgets/tab_indicator.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  static const String routeName = '/add-transaction';

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  final _transactionType = ValueNotifier<TransactionType?>(null);
  final _transactionCategory = ValueNotifier<TransactionSubCategory?>(null);
  final _paymentMethod = ValueNotifier<PaymentMethod?>(null);

  // final _formatDate = DateFormat.yMd('fr_FR');
  // final _formatTime = DateFormat.jm('fr_FR');

  @override
  void dispose() {
    _transactionType.dispose();
    _transactionCategory.dispose();
    _paymentMethod.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<AnalyticsBloc>(context)
        .setScreenName(AddTransactionPage.routeName);

    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      debugPrint('Selected Index: $_selectedIndex');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as Account?;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    IncomeOrExpenseView(
                      tabController: _tabController,
                      onSelect: (value) {
                        _transactionType.value = value;
                      },
                    ),
                    ValueListenableBuilder<TransactionType?>(
                      valueListenable: _transactionType,
                      builder: (context, value, child) =>
                          SelectTransactionCategoryView(
                        tabController: _tabController,
                        transactionCategories: value == TransactionType.expense
                            ? expenseCategories
                            : incomeCategories,
                        onSelect: (value) {
                          _transactionCategory.value = value;
                        },
                      ),
                    ),
                    SelectPaymentMethodView(
                      tabController: _tabController,
                      onSelect: (value) {
                        _paymentMethod.value = value;
                      },
                    ),
                    SelectDateTimeView(
                      tabController: _tabController,
                    ),
                    const NameAndAmountView(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _selectedIndex >= 1 ? 1 : 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      if (_tabController.index >= 1) {
                        _tabController.animateTo(_tabController.index - 1);
                      }
                    },
                    splashRadius: 22,
                    color: Theme.of(context).colorScheme.secondary,
                    icon: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TabBar(
                controller: _tabController,
                indicator: MaterialIndicator(
                  tabPosition: TabPosition.top,
                  topLeftRadius: 20,
                  topRightRadius: 20,
                  bottomLeftRadius: 20,
                  bottomRightRadius: 20,
                  horizontalPadding: 8,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                tabs: const [
                  SizedBox(height: 4),
                  SizedBox(height: 4),
                  SizedBox(height: 4),
                  SizedBox(height: 4),
                  SizedBox(height: 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
