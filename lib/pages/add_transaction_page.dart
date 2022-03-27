import 'package:flunancier/constants/transaction_categories.dart';
import 'package:flunancier/extensions/enum.dart';
import 'package:flunancier/models/transaction.dart';
import 'package:flunancier/models/transaction_category.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _montantController = TextEditingController();
  final _dateTime = ValueNotifier(DateTime.now());
  final _category = ValueNotifier<TransactionCategory?>(null);
  final _paymentMethod = ValueNotifier<PaymentMethod?>(null);
  final _categories = ValueNotifier<List<TransactionCategory>>([]);

  final formatDate = DateFormat.yMd('fr_FR');
  final formatTime = DateFormat.jm('fr_FR');

  @override
  void dispose() {
    _nameController.dispose();
    _montantController.dispose();
    _dateTime.dispose();
    _category.dispose();
    _paymentMethod.dispose();
    _categories.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _categories.value = expenseCategories + incomeCategories;
    _montantController.addListener(() {
      final montant = double.tryParse(_montantController.text);
      if (montant == null) {
        _categories.value = expenseCategories + incomeCategories;
      } else if (montant.isNegative) {
        _categories.value = expenseCategories;
        if (!expenseCategories.contains(_category.value)) {
          _category.value = null;
        }
      } else {
        _categories.value = incomeCategories;
        if (!incomeCategories.contains(_category.value)) {
          _category.value = null;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ajouter une transaction',
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
                          ValueListenableBuilder<TransactionCategory?>(
                            valueListenable: _category,
                            builder: (context, category, _) {
                              return ValueListenableBuilder<
                                  List<TransactionCategory>>(
                                valueListenable: _categories,
                                builder: (context, categories, _) =>
                                    DropdownButtonFormField<
                                        TransactionCategory>(
                                  value: category,
                                  onChanged: (value) {
                                    if (value != null) _category.value = value;
                                  },
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text('Catégorie'),
                                  ),
                                  items: categories
                                      .map(
                                        (category) => DropdownMenuItem<
                                            TransactionCategory>(
                                          value: category,
                                          child: Text(category.name),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
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
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // TODO - Add transaction
                                Navigator.maybePop(context);
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
