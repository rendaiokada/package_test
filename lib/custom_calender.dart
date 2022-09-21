// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class CustomCalender extends TableCalendar {
//   CustomCalender(
//       {super.key,
//       required super.focusedDay,
//       required super.firstDay,
//       required super.lastDay,
//       required this.onDoubleTapped,
//       super.onDaySelected,
//       super.availableCalendarFormats,
//       super.availableGestures,
//       super.calendarBuilders,
//       super.calendarFormat,
//       super.calendarStyle,
//       super.currentDay,
//       super.dayHitTestBehavior,
//       super.daysOfWeekHeight,
//       super.daysOfWeekStyle,
//       super.daysOfWeekVisible,
//       super.enabledDayPredicate,
//       super.eventLoader,
//       super.formatAnimationCurve,
//       super.formatAnimationDuration,
//       super.headerStyle});
//
//   Function(DateTime) onDoubleTapped;
//
//   @override
//   void _onDayTapped() {
//     super.onDaySelected;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (super.headerVisible)
//           ValueListenableBuilder<DateTime>(
//             valueListenable: _focusedDay,
//             builder: (context, value, _) {
//               return CalendarHeader(
//                 headerTitleBuilder: widget.calendarBuilders.headerTitleBuilder,
//                 focusedMonth: value,
//                 onLeftChevronTap: _onLeftChevronTap,
//                 onRightChevronTap: _onRightChevronTap,
//                 onHeaderTap: () => widget.onHeaderTapped?.call(value),
//                 onHeaderLongPress: () =>
//                     widget.onHeaderLongPressed?.call(value),
//                 headerStyle: widget.headerStyle,
//                 availableCalendarFormats: widget.availableCalendarFormats,
//                 calendarFormat: widget.calendarFormat,
//                 locale: widget.locale,
//                 onFormatButtonTap: (format) {
//                   assert(
//                     widget.onFormatChanged != null,
//                     'Using `FormatButton` without providing `onFormatChanged` will have no effect.',
//                   );
//
//                   widget.onFormatChanged?.call(format);
//                 },
//               );
//             },
//           ),
//         Flexible(
//           flex: widget.shouldFillViewport ? 1 : 0,
//           child: TableCalendarBase(
//             onCalendarCreated: (pageController) {
//               _pageController = pageController;
//               widget.onCalendarCreated?.call(pageController);
//             },
//             focusedDay: _focusedDay.value,
//             calendarFormat: widget.calendarFormat,
//             availableGestures: widget.availableGestures,
//             firstDay: widget.firstDay,
//             lastDay: widget.lastDay,
//             startingDayOfWeek: widget.startingDayOfWeek,
//             dowDecoration: widget.daysOfWeekStyle.decoration,
//             rowDecoration: widget.calendarStyle.rowDecoration,
//             tableBorder: widget.calendarStyle.tableBorder,
//             dowVisible: widget.daysOfWeekVisible,
//             dowHeight: widget.daysOfWeekHeight,
//             rowHeight: widget.rowHeight,
//             formatAnimationDuration: widget.formatAnimationDuration,
//             formatAnimationCurve: widget.formatAnimationCurve,
//             pageAnimationEnabled: widget.pageAnimationEnabled,
//             pageAnimationDuration: widget.pageAnimationDuration,
//             pageAnimationCurve: widget.pageAnimationCurve,
//             availableCalendarFormats: widget.availableCalendarFormats,
//             simpleSwipeConfig: widget.simpleSwipeConfig,
//             sixWeekMonthsEnforced: widget.sixWeekMonthsEnforced,
//             onVerticalSwipe: _swipeCalendarFormat,
//             onPageChanged: (focusedDay) {
//               _focusedDay.value = focusedDay;
//               widget.onPageChanged?.call(focusedDay);
//             },
//             weekNumbersVisible: widget.weekNumbersVisible,
//             weekNumberBuilder: (BuildContext context, DateTime day) {
//               final weekNumber = _calculateWeekNumber(day);
//               Widget? cell = widget.calendarBuilders.weekNumberBuilder
//                   ?.call(context, weekNumber);
//
//               if (cell == null) {
//                 cell = Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   child: Center(
//                     child: Text(
//                       weekNumber.toString(),
//                       style: widget.calendarStyle.weekNumberTextStyle,
//                     ),
//                   ),
//                 );
//               }
//
//               return cell;
//             },
//             dowBuilder: (BuildContext context, DateTime day) {
//               Widget? dowCell =
//                   widget.calendarBuilders.dowBuilder?.call(context, day);
//
//               if (dowCell == null) {
//                 final weekdayString = widget.daysOfWeekStyle.dowTextFormatter
//                         ?.call(day, widget.locale) ??
//                     DateFormat.E(widget.locale).format(day);
//
//                 final isWeekend =
//                     _isWeekend(day, weekendDays: widget.weekendDays);
//
//                 dowCell = Center(
//                   child: ExcludeSemantics(
//                     child: Text(
//                       weekdayString,
//                       style: isWeekend
//                           ? widget.daysOfWeekStyle.weekendStyle
//                           : widget.daysOfWeekStyle.weekdayStyle,
//                     ),
//                   ),
//                 );
//               }
//
//               return dowCell;
//             },
//             dayBuilder: (context, day, focusedMonth) {
//               return GestureDetector(
//                 behavior: widget.dayHitTestBehavior,
//                 onTap: () => _onDayTapped(day),
//                 onLongPress: () => _onDayLongPressed(day),
//                 child: _buildCell(day, focusedMonth),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
