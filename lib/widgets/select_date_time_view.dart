import 'package:flutter/material.dart';

class SelectDateTimeView extends StatelessWidget {
  const SelectDateTimeView({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text('SelectDateTimeView'),
        ),
        ElevatedButton(
          onPressed: () {
            tabController.animateTo(4);
          },
          child: const Text('SOON...'),
        ),
      ],
    );
  }
}
