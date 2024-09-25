import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final Function(DateTime dateTime) onDateTimeChanged;
  final InputDecoration? decoration;

  const DateTimePicker({
    super.key,
    this.initialDateTime,
    required this.onDateTimeChanged,
    this.decoration,
  });

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDateTime ?? DateTime.now();
    _selectedTime = TimeOfDay.fromDateTime(_selectedDate!);
    _controller = TextEditingController(
      text: _formatDateTime(_selectedDate!, _selectedTime!),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && mounted) {
      setState(() {
        _selectedDate = picked;
        _updateControllerText();
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && mounted) {
      setState(() {
        _selectedTime = picked;
        _updateControllerText();
        _notifyDateTimeChanged();
      });
    }
  }

  void _updateControllerText() {
    if (_selectedDate != null && _selectedTime != null) {
      _controller.text = _formatDateTime(_selectedDate!, _selectedTime!);
    }
  }

  String _formatDateTime(DateTime date, TimeOfDay time) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} "
           "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  void _notifyDateTimeChanged() {
    if (_selectedDate != null && _selectedTime != null) {
      final dateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
      widget.onDateTimeChanged(dateTime);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          readOnly: true,
          decoration: widget.decoration?.copyWith(
                hintText: widget.decoration?.hintText ??
                    (_selectedDate != null
                        ? _formatDateTime(_selectedDate!, _selectedTime!)
                        : '选择日期和时间'),
              ) ??
              InputDecoration(
                border: OutlineInputBorder(),
                labelText: '选择日期和时间',
              ),
          onTap: () async {
            await _selectDate();
            if (mounted) {
              await _selectTime();
            }
          },
        ),
      ],
    );
  }
}
