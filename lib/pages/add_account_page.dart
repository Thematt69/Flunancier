import 'package:flunancier/blocs/authentication_bloc.dart';
import 'package:flunancier/blocs/bloc_provider.dart';
import 'package:flunancier/blocs/store_bloc.dart';
import 'package:flunancier/models/account.dart';
import 'package:flunancier/widgets/custom_button.dart';
import 'package:flunancier/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({Key? key}) : super(key: key);

  static const String routeName = '/add-account';

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  late final _storeBloc = BlocProvider.of<StoreBloc>(context);
  late final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _totalController = TextEditingController();
  final _plafondController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _totalController.dispose();
    _plafondController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _storeBloc
          .addAccount(
            Account(
              uuid: 'N/A',
              name: _nameController.text,
              total: double.tryParse(_totalController.text) ?? 0,
              plafond: double.tryParse(_plafondController.text),
              userId: _authenticationBloc.currentUser?.uid ?? 'N/A',
            ),
          )
          .whenComplete(() => Navigator.maybePop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField.text(
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    constraints: const BoxConstraints(maxWidth: 350),
                    label: 'Nom *',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez indiquer un nom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField.number(
                    controller: _totalController,
                    textInputAction: TextInputAction.next,
                    constraints: const BoxConstraints(maxWidth: 350),
                    suffixText: '€',
                    label: 'Montant *',
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
                  CustomTextFormField.number(
                    controller: _plafondController,
                    textInputAction: TextInputAction.done,
                    constraints: const BoxConstraints(maxWidth: 350),
                    suffixText: '€',
                    label: 'Plafond',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // do nothing
                      } else if (double.tryParse(value) == null) {
                        return 'Veuillez indiquer une valeur numérique';
                      } else if (double.parse(value).isNegative) {
                        return 'Veuillez indiquer un nombre positif';
                      } else if (value.contains('.') &&
                          value.split('.').last.length > 2) {
                        return 'Veuillez indiquer un chiffre correct, deux décimals maximum';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) async => submit(),
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    onPressed: () async => submit(),
                    label: 'Ajouter',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
