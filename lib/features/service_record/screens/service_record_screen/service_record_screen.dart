import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/common/widgets/app_main_title.dart';
import 'package:car_service/features/common/widgets/choose_edit_or_delete_dialog_widget.dart';
import 'package:car_service/features/common/widgets/delete_dialog_widget.dart';
import 'package:car_service/features/common/widgets/service_record_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:car_service/features/service_record/screens/service_record_screen/service_record_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:union_state/union_state.dart';
import 'package:intl/date_symbol_data_local.dart';
import "package:weekly_date_picker/datetime_apis.dart";

@RoutePage(
  name: AppRouteNames.serviceRecordScreen,
)
class ServiceRecordScreen extends ElementaryWidget<IServiceRecordScreenWidgetModel> {
  const ServiceRecordScreen({
    Key? key,
    WidgetModelFactory wmFactory = serviceRecordScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IServiceRecordScreenWidgetModel wm) {
    return Builder(builder: (context) {
      return UnionStateListenableBuilder<List<RecordData>>(
        unionStateListenable: wm.serviceRecordState,
        builder: (_, serviceRecord) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const AppMainWidget(title: 'Запись в сервис'),
                        WeeklyDatePickerWidget(wm: wm),
                        ServiceRecordWidget(
                          recordBrand: serviceRecord.map((e) => e.recordBrand).toList(),
                          recordModel: serviceRecord.map((e) => e.recordModel).toList(),
                          registrationNumber: serviceRecord.map((e) => e.registrationNumber).toList(),
                          values: serviceRecord,
                          onTapThreeDots: (serviceRecords) {
                            showDialog<void>(
                              context: context,
                              builder: (ctx) => ChooseEditOrDeleteDialogWidget(
                                icon: SvgIcons.download,
                                editCarScreen: () {
                                  Navigator.pop(ctx);
                                  wm.openEditRecordScreen.call(serviceRecords);
                                },
                                deleteCar: () {
                                  Navigator.pop(ctx);
                                  showDialog<void>(
                                    context: context,
                                    builder: (ctx) => DeleteDialogWidget(
                                      deleteCar: () async {
                                        Navigator.pop(ctx);
                                        await wm.deleteRecordScreen.call(serviceRecords);
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: AppButtonWidget(
                    title: 'Добавить запись',
                    onPressed: wm.openAddRecordScreen,
                  ),
                ),
              ],
            ),
          );
        },
        loadingBuilder: (_, serviceRecords) => const SizedBox(),
        failureBuilder: (_, exception, serviceRecords) => const SizedBox(),
      );
    });
  }
}

class WeeklyDatePickerWidget extends StatefulWidget {
  final IServiceRecordScreenWidgetModel wm;

  const WeeklyDatePickerWidget({super.key, required this.wm});

  @override
  WeeklyDatePickerState createState() => WeeklyDatePickerState();
}

class WeeklyDatePickerState extends State<WeeklyDatePickerWidget> {
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM', 'ru').format(_selectedDay).capitalize(),
                style: AppTextStyle.semiBold24.value.copyWith(
                  color: AppColors.prime,
                  height: 1,
                ),
              ),
              Text(
                DateFormat.y().format(_selectedDay),
                style: AppTextStyle.semiBold18.value.copyWith(
                  color: Colors.black,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0.2,
          color: AppColors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: WeeklyDatePicker(
            selectedDay: _selectedDay,
            changeDay: (value) => setState(() {
              _selectedDay = value;
              widget.wm.setWeekDateTime(value);
            }),
            onWeekChange: (value) => setState(() {
              _selectedDay = value;
              widget.wm.setWeekDateTime(value);
            }),
            weekdays: const ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Divider(
            height: 0.2,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class WeeklyDatePicker extends StatefulWidget {
  const WeeklyDatePicker({
    super.key,
    required this.selectedDay,
    required this.changeDay,
    required this.onWeekChange,
    this.weekdays = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    this.daysInWeek = 7,
  }) : assert(weekdays.length == daysInWeek, "weekdays must be of length $daysInWeek");

  final DateTime selectedDay;
  final Function(DateTime) changeDay;
  final Function(DateTime) onWeekChange;
  final List<String> weekdays;
  final int daysInWeek;

  @override
  _WeeklyDatePickerState createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
  final int _weekIndexOffset = 5200;

  late final PageController _controller;
  late final DateTime _initialSelectedDay;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _weekIndexOffset);
    _initialSelectedDay = widget.selectedDay;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                final int offset = 1 - _initialSelectedDay.weekday;
                final int daysToAdd = (index - _weekIndexOffset) * 7 + offset;
                final DateTime dateTime = _initialSelectedDay.addDays(daysToAdd);
                widget.onWeekChange.call(dateTime);
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, weekIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _weekdays(weekIndex - _weekIndexOffset),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _weekdays(int weekIndex) {
    List<Widget> weekdays = [];

    for (int i = 0; i < widget.daysInWeek; i++) {
      final int offset = i + 1 - _initialSelectedDay.weekday;
      final int daysToAdd = weekIndex * 7 + offset;
      final DateTime dateTime = _initialSelectedDay.addDays(daysToAdd);
      weekdays.add(_dateButton(dateTime));
    }
    return weekdays;
  }

  Widget _dateButton(DateTime dateTime) {
    final String weekday = widget.weekdays[dateTime.weekday - 1];
    final bool isSelected = dateTime.isSameDateAs(widget.selectedDay);

    return Expanded(
      child: GestureDetector(
        onTap: () => widget.changeDay(dateTime),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weekday,
              style: AppTextStyle.medium18.value.copyWith(color: AppColors.darkGray),
            ),
            CircleAvatar(
              backgroundColor: isSelected ? AppColors.prime : Colors.transparent,
              radius: 18.0,
              child: Text(
                '${dateTime.day}',
                style: AppTextStyle.medium18.value.copyWith(color: isSelected ? AppColors.white : AppColors.darkGray),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
