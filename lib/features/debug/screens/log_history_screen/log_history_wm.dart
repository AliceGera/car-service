import 'package:car_service/features/debug/screens/log_history_screen/log_history_export.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

LogHistoryWm logHistoryScreenWmFactory(
  BuildContext context,
) {
  final model = LogHistoryModel();
  return LogHistoryWm(model);
}

abstract interface class ILogHistoryWm implements IWidgetModel {}

class LogHistoryWm extends WidgetModel<LogHistoryScreen, LogHistoryModel> implements ILogHistoryWm {
  LogHistoryWm(super._model);
}
