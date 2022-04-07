import 'package:flunancier/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NameAndAmountView extends StatelessWidget {
  const NameAndAmountView({
    Key? key,
    required this.nameController,
    required this.montantController,
    required this.onSubmit,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController montantController;
  final VoidCallback onSubmit;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField.text(
            controller: nameController,
            textInputAction: TextInputAction.next,
            constraints: const BoxConstraints(maxWidth: 350),
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
            controller: montantController,
            textInputAction: TextInputAction.done,
            constraints: const BoxConstraints(maxWidth: 350),
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
            onFieldSubmitted: (_) {
              if (formKey.currentState?.validate() ?? false) onSubmit();
            },
          ),
        ],
      ),
    );
  }
}
