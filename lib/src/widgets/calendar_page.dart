// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/widgets.dart';

import '../../caviare_flutter_table_calendar.dart';

class CalendarPage extends StatelessWidget {
  final Widget Function(BuildContext context, DateTime day)? dowBuilder;
  final Widget Function(BuildContext context, DateTime? day) dayBuilder;
  final List<DateTime> visibleDays;
  final Decoration? dowDecoration;
  final Decoration? rowDecoration;
  final TableBorder? tableBorder;
  final CalendarFormat calendarFormat;
  final bool dowVisible;

  const CalendarPage({
    Key? key,
    required this.visibleDays,
    required this.calendarFormat,
    this.dowBuilder,
    required this.dayBuilder,
    this.dowDecoration,
    this.rowDecoration,
    this.tableBorder,
    this.dowVisible = true,
  })  : assert(!dowVisible || dowBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: tableBorder,
      children: [
        if (dowVisible) _buildDaysOfWeek(context),
        ..._buildCalendarDays(context),
      ],
    );
  }

  TableRow _buildDaysOfWeek(BuildContext context) {
    return TableRow(
      decoration: dowDecoration,
      children: List.generate(
        calendarFormat == CalendarFormat.year ? 6 : 7,
        (index) => dowBuilder!(context, visibleDays[index]),
      ).toList(),
    );
  }

  List<TableRow> _buildCalendarDays(BuildContext context) {
    final rowAmount =
        (visibleDays.length / (calendarFormat == CalendarFormat.year ? 6 : 7))
            .ceil();

    return List.generate(rowAmount,
            (index) => index * (calendarFormat == CalendarFormat.year ? 6 : 7))
        .map((index) => TableRow(
              decoration: rowDecoration,
              children: List.generate(
                (calendarFormat == CalendarFormat.year ? 6 : 7),
                (id) => dayBuilder(
                    context,
                    visibleDays.length > (index + id)
                        ? visibleDays[index + id]
                        : null),
              ),
            ))
        .toList();
  }
}
