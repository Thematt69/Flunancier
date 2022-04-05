import 'package:flutter/material.dart';

class NameAndAmountView extends StatelessWidget {
  const NameAndAmountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text('NameAndAmountView'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          child: const Text('SOON...'),
        ),
      ],
    );
  }
}
