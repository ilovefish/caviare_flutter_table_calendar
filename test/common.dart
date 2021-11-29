// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:caviare_flutter_table_calendar/src/shared/utils.dart';
import 'package:flutter/foundation.dart';

ValueKey<String> dateToKey(DateTime date, {String prefix = ''}) {
  return ValueKey('$prefix${date.year}-${date.month}-${date.day}');
}

const calendarFormatMap = const {
  CalendarFormat.month: 'Month',
  CalendarFormat.twoWeeks: 'Two weeks',
  CalendarFormat.week: 'week',
};