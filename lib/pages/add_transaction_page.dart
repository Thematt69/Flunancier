import 'package:flunancier/blocs/analytics_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/store_bloc.dart';
import 'package:flunancier/constants/transaction_categories.dart';
import 'package:flunancier/extensions/enum.dart';
import 'package:flunancier/models/account.dart';
import 'package:flunancier/models/transaction.dart';
import 'package:flunancier/models/transaction_sub_category.dart';
import 'package:flunancier/widgets/category_button.dart';
import 'package:flunancier/widgets/custom_button.dart';
import 'package:flunancier/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  static const String routeName = '/add-transaction';

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  late final _storeBloc = BlocProvider.of<StoreBloc>(context);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _montantController = TextEditingController();
  final _dateTime = ValueNotifier(DateTime.now());
  final _category = ValueNotifier<TransactionSubCategory?>(null);
  final _paymentMethod = ValueNotifier<PaymentMethod?>(null);

  final formatDate = DateFormat.yMd('fr_FR');
  final formatTime = DateFormat.jm('fr_FR');

  @override
  void dispose() {
    _nameController.dispose();
    _montantController.dispose();
    _dateTime.dispose();
    _category.dispose();
    _paymentMethod.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<AnalyticsBloc>(context)
        .setScreenName(AddTransactionPage.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final account = args?['account'] as Account?;
    final type = args?['type'] as TransactionType?;

    List<TransactionSubCategory> categories = [];

    if (type == TransactionType.expense) {
      categories = expenseCategories;
    } else {
      categories = incomeCategories;
    }

    bool _validate() {
      if (_category.value == null) {
        const snackBar = SnackBar(
          content: Text('Veuillez choisir une catégorie'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
      if (_paymentMethod.value == null) {
        const snackBar = SnackBar(
          content: Text('Veuillez choisir un mode de paiement'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      }
      return true && account != null;
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    type == TransactionType.expense
                        ? 'Ajouter une dépense'
                        : 'Ajouter un revenu',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close_outlined),
                  splashRadius: 22,
                  tooltip: 'Fermer',
                  onPressed: () => Navigator.maybePop(context),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField.text(
                            controller: _nameController,
                            textInputAction: TextInputAction.next,
                            label: 'Nom',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez indiquer un nom';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomTextFormField.number(
                            controller: _montantController,
                            textInputAction: TextInputAction.next,
                            suffixText: '€',
                            label: 'Montant',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer un montant';
                              } else if (double.tryParse(value) == null) {
                                return 'Veuillez indiquer une valeur numérique';
                              } else if (double.parse(value).isNegative) {
                                return 'Veuillez indiquer un montant positif';
                              } else if (value.contains('.') &&
                                  value.split('.').last.length > 2) {
                                return 'Veuillez indiquer un montant correct, deux décimals maximum';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          ValueListenableBuilder<DateTime>(
                            valueListenable: _dateTime,
                            builder: (context, dateTime, _) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: dateTime,
                                        firstDate: dateTime.subtract(
                                          const Duration(days: 365),
                                        ),
                                        lastDate: dateTime
                                            .add(const Duration(days: 365)),
                                        locale: const Locale('fr', 'FR'),
                                      ).then((date) async {
                                        if (date != null) {
                                          _dateTime.value = DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            dateTime.hour,
                                            dateTime.minute,
                                          );
                                          debugPrint('date => $date');
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Theme.of(context).colorScheme.surface,
                                      onPrimary: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    child: Text(
                                      formatDate.format(dateTime).toUpperCase(),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((time) async {
                                        if (time != null) {
                                          _dateTime.value = DateTime(
                                            dateTime.year,
                                            dateTime.month,
                                            dateTime.day,
                                            time.hour,
                                            time.minute,
                                          );
                                          debugPrint('time => $time');
                                        }
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Theme.of(context).colorScheme.surface,
                                      onPrimary: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                    child: Text(
                                      formatTime.format(dateTime).toUpperCase(),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          ValueListenableBuilder<TransactionSubCategory?>(
                            valueListenable: _category,
                            builder: (context, category, _) => CategoryButton(
                              currentCategory: category,
                              categories: categories,
                              onPressed: (category) {
                                _category.value = category;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          ValueListenableBuilder<PaymentMethod?>(
                            valueListenable: _paymentMethod,
                            builder: (context, paymentMethod, _) {
                              return DropdownButtonFormField<PaymentMethod>(
                                value: paymentMethod,
                                onChanged: (value) {
                                  if (value != null) {
                                    _paymentMethod.value = value;
                                  }
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Methodes de paiement'),
                                ),
                                items: PaymentMethod.values
                                    .map(
                                      (paymentMethod) =>
                                          DropdownMenuItem<PaymentMethod>(
                                        value: paymentMethod,
                                        child: Text(paymentMethod.label),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          CustomElevatedButton(
                            onPressed: () async {
                              if ((_formKey.currentState?.validate() ??
                                      false) &&
                                  _validate()) {
                                await _storeBloc
                                    .addTransaction(
                                      Transaction(
                                        uuid: 'uuid',
                                        name: _nameController.text,
                                        montant: type == TransactionType.expense
                                            ? double.parse(
                                                  _montantController.text,
                                                ) *
                                                (-1)
                                            : double.parse(
                                                _montantController.text,
                                              ),
                                        dateTime: _dateTime.value,
                                        category: _category.value!,
                                        paymentMethod: _paymentMethod.value!,
                                        accountUuid: account!.uuid,
                                      ),
                                    )
                                    .whenComplete(
                                      () => Navigator.maybePop(context),
                                    );
                              }
                            },
                            label: 'AJOUTER',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
