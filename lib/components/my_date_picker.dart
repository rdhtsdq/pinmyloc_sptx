import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime focusDate;
  final ValueChanged<DateTime>? onDateChanged;

  MyDatePicker({
    required this.startDate,
    required this.endDate,
    required this.focusDate,
    this.onDateChanged,
  });

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  late FixedExtentScrollController _yearController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _dayController;

  late List<int> _years;
  late List<int> _months;
  late List<int> _days;

  @override
  void initState() {
    super.initState();
    _years = List.generate(widget.endDate.year - widget.startDate.year + 1,
        (index) => widget.startDate.year + index);
    _months = List.generate(12, (index) => index + 1);
    _days = _generateDaysList(widget.focusDate.year, widget.focusDate.month);

    _yearController = FixedExtentScrollController(
        initialItem: widget.focusDate.year - widget.startDate.year);
    _monthController =
        FixedExtentScrollController(initialItem: widget.focusDate.month - 1);
    _dayController =
        FixedExtentScrollController(initialItem: widget.focusDate.day - 1);
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPicker(
          _yearController,
          _years.map((year) => year.toString()).toList(),
          (index) => _onYearChanged(index),
        ),
        const SizedBox(width: 8.0),
        _buildPicker(
            _monthController,
            _months.map((month) => month.toString().padLeft(2, '0')).toList(),
            (index) => _onMonthChanged(index)),
        const SizedBox(width: 8.0),
        _buildPicker(
            _dayController,
            _days.map((day) => day.toString().padLeft(2, '0')).toList(),
            (index) => _onDayChanged(index)),
      ],
    );
  }

  Widget _buildPicker(
    FixedExtentScrollController controller,
    List<String> items,
    ValueChanged<int> onSelectedItemChanged,
  ) {
    return Container(
      height: 150.0,
      width: 64.0,
      child: ListWheelScrollView(
        controller: controller,
        itemExtent: 32.0,
        physics: const FixedExtentScrollPhysics(),
        useMagnifier: true,
        onSelectedItemChanged: onSelectedItemChanged,
        children: items
            .map((item) => Text(
                  item,
                  style: const TextStyle(fontSize: 18),
                ))
            .toList(),
      ),
    );
  }

  List<int> _generateDaysList(int year, int month) {
    final daysInMonth = DateTime(year, month + 1, 0).day;
    return List.generate(daysInMonth, (index) => index + 1);
  }

  void _onYearChanged(int index) {
    final year = _years[index];
    if (widget.startDate.year == _years[index]) {
      _monthController.jumpTo(0);
      final month = _months[_monthController.selectedItem];
      _months = List.generate(12, (index) => index + 1)
          .skip(widget.startDate.month - 1)
          .toList();

      if (widget.startDate.month == _months[_monthController.selectedItem]) {
        print("object");
        _days = _generateDaysList(year, month)
            .skip(widget.startDate.day - 1)
            .toList();
      }
    } else if (widget.endDate.year == _years[index]) {
      _months = List.generate(12, (index) => index + 1)
          .take(widget.endDate.month + 1)
          .toList();
      _monthController.jumpTo(0);
      final month = _months[_monthController.selectedItem];

      if (widget.endDate.month == _months[_monthController.selectedItem]) {
        _days =
            _generateDaysList(year, month).take(widget.endDate.day).toList();
      }
    } else {
      _months = List.generate(12, (index) => index + 1);
      final month = _months[_monthController.selectedItem];

      _days = _generateDaysList(year, month);
      _dayController.jumpTo(0);
    }

    setState(() {});
  }

  void _onMonthChanged(int index) {
    final year = _years[_yearController.selectedItem];
    final month = _months[index];

    if (widget.startDate.year == _years[_yearController.selectedItem] &&
        widget.startDate.month == _months[_monthController.selectedItem]) {
      _days = _generateDaysList(year, month)
          .skip(widget.startDate.day - 1)
          .toList();
    } else if (widget.endDate.year == _years[_yearController.selectedItem] &&
        widget.endDate.month == _months[_monthController.selectedItem]) {
      _days = _generateDaysList(year, month).take(widget.endDate.day).toList();
    } else {
      _days = _generateDaysList(year, month);
      _dayController.jumpTo(0);
      _emitDateChangedEvent();
    }

    setState(() {});
  }

  void _onDayChanged(int index) {
    setState(() {
      _emitDateChangedEvent();
    });
  }

  void _emitDateChangedEvent() {
    final year = _years[_yearController.selectedItem];
    final month = _months[_monthController.selectedItem];
    final day = _days[_dayController.selectedItem];
    final selectedDate = DateTime(year, month, day);
    widget.onDateChanged?.call(selectedDate);
  }
}
