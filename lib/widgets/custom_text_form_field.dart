import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool itPassword;
  final String label;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode autovalidateMode;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int maxLines;
  final BoxConstraints? constraints;
  final String? suffixText;

  const CustomTextFormField._({
    required this.controller,
    required this.label,
    this.itPassword = false,
    this.textInputAction,
    this.textInputType,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onFieldSubmitted,
    this.validator,
    Key? key,
    this.maxLength,
    this.maxLines = 1,
    this.constraints,
    this.suffixText,
  }) : super(key: key);

  factory CustomTextFormField.password({
    required TextEditingController controller,
    TextInputAction? textInputAction,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    void Function(String)? onFieldSubmitted,
    String? Function(String?)? validator,
    Key? key,
    int? maxLength,
    BoxConstraints? constraints,
  }) {
    return CustomTextFormField._(
      controller: controller,
      textInputAction: textInputAction,
      textInputType: TextInputType.visiblePassword,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      itPassword: true,
      validator: validator,
      key: key,
      label: 'Mot de passe',
      maxLength: maxLength,
      constraints: constraints,
    );
  }

  factory CustomTextFormField.emailAddress({
    required TextEditingController controller,
    TextInputAction? textInputAction,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    void Function(String)? onFieldSubmitted,
    String? Function(String?)? validator,
    Key? key,
    int? maxLength,
    int maxLines = 1,
    BoxConstraints? constraints,
  }) {
    return CustomTextFormField._(
      controller: controller,
      textInputAction: textInputAction,
      textInputType: TextInputType.emailAddress,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      key: key,
      label: 'Adresse mail',
      maxLength: maxLength,
      maxLines: maxLines,
      constraints: constraints,
    );
  }

  factory CustomTextFormField.text({
    required TextEditingController controller,
    required String label,
    TextInputAction? textInputAction,
    TextInputType? textInputType,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    void Function(String)? onFieldSubmitted,
    String? Function(String?)? validator,
    Key? key,
    int? maxLength,
    int maxLines = 1,
    BoxConstraints? constraints,
    String? suffixText,
  }) {
    return CustomTextFormField._(
      controller: controller,
      textInputAction: textInputAction,
      textInputType: textInputType,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      key: key,
      label: label,
      maxLength: maxLength,
      maxLines: maxLines,
      constraints: constraints,
      suffixText: suffixText,
    );
  }

  factory CustomTextFormField.number({
    required TextEditingController controller,
    required String label,
    TextInputAction? textInputAction,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    void Function(String)? onFieldSubmitted,
    String? Function(String?)? validator,
    Key? key,
    int? maxLength,
    int maxLines = 1,
    BoxConstraints? constraints,
    String? suffixText,
  }) {
    return CustomTextFormField._(
      controller: controller,
      textInputAction: textInputAction,
      textInputType: TextInputType.number,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      key: key,
      label: label,
      maxLength: maxLength,
      maxLines: maxLines,
      constraints: constraints,
      suffixText: suffixText,
    );
  }

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final ValueNotifier<bool> _passwordVisible = ValueNotifier(false);

  @override
  void dispose() {
    _passwordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _passwordVisible,
      builder: (context, passwordVisible, _) => TextFormField(
        textInputAction: widget.textInputAction,
        obscureText: widget.itPassword && !passwordVisible,
        keyboardType: widget.textInputType,
        autovalidateMode: widget.autovalidateMode,
        controller: widget.controller,
        onFieldSubmitted: (value) => widget.onFieldSubmitted?.call(value),
        validator: widget.validator,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          constraints: widget.constraints,
          alignLabelWithHint: widget.maxLines > 1,
          label: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.6),
                ),
          ),
          suffixText: widget.suffixText,
          suffixIcon: widget.itPassword
              ? IconButton(
                  icon: Icon(
                    passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    semanticLabel: passwordVisible
                        ? 'Cacher le mot de passe'
                        : 'Voir le mot de passe',
                  ),
                  onPressed: () => _passwordVisible.value = !passwordVisible,
                )
              : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
