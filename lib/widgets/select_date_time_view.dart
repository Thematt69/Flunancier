import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateTimeView extends StatefulWidget {
  const SelectDateTimeView({
    Key? key,
    required this.tabController,
    required this.onChange,
  }) : super(key: key);

  final TabController tabController;
  final void Function(DateTime dateTime) onChange;

  @override
  State<SelectDateTimeView> createState() => _SelectDateTimeViewState();
}

class _SelectDateTimeViewState extends State<SelectDateTimeView> {
  final _formatDate = DateFormat.yMd('fr_FR');
  final _formatTime = DateFormat.jm('fr_FR');

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('fr', 'FR'),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formatDate.format(_selectedDate);
      });
      widget.onChange(_selectedDate);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Localizations.override(
          context: context,
          locale: const Locale('fr', 'FR'),
          child: child,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _selectedDate = DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          _selectedTime.hour,
          _selectedTime.minute,
        );
        _timeController.text = _formatTime.format(_selectedDate);
      });
      widget.onChange(_selectedDate);
    }
  }

  @override
  void initState() {
    _dateController.text = _formatDate.format(_selectedDate);

    _timeController.text = _formatTime.format(
      DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () => _selectDate(context),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Ink(
            width: _width / 1.7,
            height: _height / 9,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: TextFormField(
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
                enabled: false,
                keyboardType: TextInputType.text,
                controller: _dateController,
                decoration: const InputDecoration(
                  disabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => _selectTime(context),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Ink(
            width: _width / 1.7,
            height: _height / 9,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: TextFormField(
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
                enabled: false,
                keyboardType: TextInputType.text,
                controller: _timeController,
                decoration: const InputDecoration(
                  disabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
