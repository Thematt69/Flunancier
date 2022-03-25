import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final ButtonStyle? style;

  const CustomTextButton({
    required this.label,
    Key? key,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.style,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (leadingIcon != null) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(leadingIcon),
        style: style,
        label: Text(label.toUpperCase()),
      );
    } else if (trailingIcon != null) {
      return TextButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Text(label.toUpperCase())),
            Icon(trailingIcon),
          ],
        ),
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: Text(label.toUpperCase()),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final ButtonStyle? style;

  const CustomOutlinedButton({
    required this.label,
    Key? key,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (leadingIcon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(leadingIcon),
        style: style,
        label: Text(label.toUpperCase()),
      );
    } else if (trailingIcon != null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Text(label.toUpperCase())),
            Icon(trailingIcon),
          ],
        ),
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: style,
      child: Text(label.toUpperCase()),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final ButtonStyle? style;

  const CustomElevatedButton({
    required this.label,
    Key? key,
    this.onPressed,
    this.leadingIcon,
    this.trailingIcon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (leadingIcon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(leadingIcon),
        style: style,
        label: Text(label.toUpperCase()),
      );
    } else if (trailingIcon != null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Text(label.toUpperCase())),
            Icon(trailingIcon),
          ],
        ),
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(label.toUpperCase()),
    );
  }
}
