import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

final _datePickerConfig = CalendarDatePicker2WithActionButtonsConfig(
  calendarType: CalendarDatePicker2Type.single,
  weekdayLabels: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
  firstDayOfWeek: 1,
  weekdayLabelTextStyle: AppTextStyle.regular10.value.copyWith(color: AppColors.darkGray),
  lastMonthIcon: const Icon(
    Icons.chevron_left,
    color: AppColors.gray,
  ),
  nextMonthIcon: const Icon(
    Icons.chevron_right,
    color: AppColors.prime,
  ),
  controlsTextStyle: AppTextStyle.regular10.value.copyWith(color: AppColors.darkGray),
  dayTextStyle: AppTextStyle.medium14.value.copyWith(color: Colors.black),
  selectedDayTextStyle: AppTextStyle.medium14.value.copyWith(color: AppColors.white),
  selectedDayHighlightColor: AppColors.prime,
  yearTextStyle: AppTextStyle.semiBold16.value.copyWith(color: Colors.black),
  selectedYearTextStyle: const TextStyle(
    color: AppColors.prime,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  cancelButton: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.black,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Text(
        'Закрыть',
        style: AppTextStyle.medium13.value.copyWith(color: AppColors.white),
      ),
    ),
  ),
  centerAlignModePicker: true,
  okButton: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: AppColors.prime,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Text(
        'Выбрать',
        style: AppTextStyle.medium13.value.copyWith(color: AppColors.white),
      ),
    ),
  ),
  closeDialogOnCancelTapped: true,
  openedFromDialog: true,
  gapBetweenCalendarAndButtons: 0,
);

List<DateTime?> _singleDatePickerValueWithDefaultValue = [DateTime.now()];

Future<List<DateTime?>?> showAppDatePicker(BuildContext context) async {
  return showCalendarDatePicker2Dialog(
    context: context,
    config: _datePickerConfig,
    dialogSize: const Size(325, 0),
    borderRadius: BorderRadius.circular(15),
    value: _singleDatePickerValueWithDefaultValue,
    dialogBackgroundColor: Colors.white,
  );
}
