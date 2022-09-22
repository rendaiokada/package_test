import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalender extends TableCalendar {
  CustomCalender(
      {required super.focusedDay,
      required super.firstDay,
      required super.lastDay,
      required this.onDoubleTapped});

  Function(DateTime) onDoubleTapped;

}
