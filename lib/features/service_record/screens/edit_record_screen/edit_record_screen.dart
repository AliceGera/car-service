import 'package:auto_route/auto_route.dart';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:car_service/features/common/widgets/app_button_widget.dart';
import 'package:car_service/features/common/widgets/app_date_picker_widget.dart';
import 'package:car_service/features/common/widgets/app_dropdown.dart';
import 'package:car_service/features/common/widgets/app_textfield_widget.dart';
import 'package:car_service/features/common/widgets/choose_widget.dart';
import 'package:car_service/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'edit_record_screen_widget_model.dart';

@RoutePage(
  name: AppRouteNames.editRecordScreen,
)
class EditRecordScreen extends ElementaryWidget<IEditRecordScreenWidgetModel> {
  EditRecordScreen({
    this.loadAgain,
    required this.record,
    Key? key,
    WidgetModelFactory wmFactory = editRecordScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final VoidCallback? loadAgain;
  final RecordData record;
  final List<String> recordBrand = ['Volkswagen', 'Toyota', 'Lada', 'Kia', 'Hyundai', 'Ford', 'BMW', 'Mercedes'];
  final List<String> releaseYear = ['2024', '2023', '2022', '2021', '2020', '2019', '2018', '2017'];
  final inputFormaters = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^(\+?\d{0,3})?[\s.-]?\(?\d{0,3}\)?[\s.-]?\d{0,4}[\s.-]?\d{0,4}$')),
  ];

  @override
  Widget build(IEditRecordScreenWidgetModel wm) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            AppColors.backgroundBlue,
            AppColors.backgroundLight,
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: wm.closeScreen,
                  child: SvgPicture.asset(SvgIcons.backArrow),
                ),
                const Spacer(),
                Text(
                  'Редактировать запись',
                  style: AppTextStyle.medium17.value,
                ),
                const Spacer(),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ValueListenableBuilder<RecordData>(
                builder: (context, record, child) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.backgroundGray,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: DropdownWidget(
                                  items: recordBrand,
                                  title: record.recordBrand.isEmpty ? 'Марка автомобиля' : record!.recordBrand,
                                  selectedValueText: wm.saveRecordBrand,
                                  isEdit: true,
                                  text: record.recordBrand.isEmpty ? '' : 'Марка автомобиля',
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppTextFieldWidget(
                                      text: 'Модель автомобиля',
                                      controller: wm.recordModelController,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: DropdownWidget(
                                      items: releaseYear,
                                      title: record.releaseYear.isEmpty ? 'Год выпуска' : record!.releaseYear,
                                      selectedValueText: wm.saveReleaseYear,
                                      isEdit: true,
                                      text: record.releaseYear.isEmpty ? '' : 'Год выпуска',
                                    ),
                                  ),
                                ],
                              ),
                              AppTextFieldWidget(
                                text: 'Регистрационный номер',
                                controller: wm.registrationNumberController,
                               ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Container(
                                  color: AppColors.gray,
                                  height: 0.2,
                                  width: double.infinity,
                                ),
                              ),
                              AppTextFieldWidget(
                                text: 'Фамилия и имя владельца',
                                controller: wm.firstAndLastNameController,
                              ),
                              AppTextFieldWidget(
                                text: 'Контактный номер',
                                controller: wm.phoneNumberController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: inputFormaters,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Container(
                                  color: AppColors.gray,
                                  height: 0.2,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6,bottom: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () async {
                                          final result = await showAppDatePicker(context);
                                          if (result != null && result.isNotEmpty) {
                                            wm.addDate(result.first);
                                          }
                                        },
                                        child: ChooseWidget(
                                          fieldName: record.recordDate == null ? '' : 'Дата',
                                          textColor: Colors.black,
                                          text: record.recordDate != null ? DateFormat('dd.MM.yyyy').format(record.recordDate!) : 'Дата',
                                          assetName: SvgIcons.datePicker,
                                          isEdit: true,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () async {
                                          final result = await showTimeDialog(context: context);
                                          if (result != null) {
                                            wm.addTime(result);
                                          }
                                        },
                                        child: ChooseWidget(
                                          fieldName: record.recordTime == null ? '' : 'Время',
                                          textColor: record.recordTime != null ? Colors.black : AppColors.prime,
                                          text: record.recordTime != null ? DateFormat('HH:mm').format(record.recordDate!) : 'Время',
                                          assetName: SvgIcons.time,
                                          isEdit: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              AppTextFieldWidget(
                                text: 'Комментарий',
                                controller: wm.commentController,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: AppButtonWidget(
                          title: 'Сохранить',
                          onPressed: (record.recordModel.isNotEmpty &&
                                  record.recordBrand.isNotEmpty &&
                                  record.releaseYear.isNotEmpty &&
                                  record.registrationNumber.isNotEmpty &&
                                  record.firstAndLastName.isNotEmpty &&
                                  record.phoneNumber.isNotEmpty &&
                                  record.recordDate != null &&
                                  record.recordTime != null)
                              ? () async {
                                  await wm.editRecord();
                                  loadAgain?.call();
                                }
                              : null,
                          color: (record.recordModel.isNotEmpty &&
                                  record.recordBrand.isNotEmpty &&
                                  record.releaseYear.isNotEmpty &&
                                  record.registrationNumber.isNotEmpty &&
                                  record.firstAndLastName.isNotEmpty &&
                                  record.phoneNumber.isNotEmpty &&
                                  record.recordDate != null &&
                                  record.recordTime != null)
                              ? AppColors.prime
                              : AppColors.white,
                          textColor: (record.recordModel.isNotEmpty &&
                                  record.recordBrand.isNotEmpty &&
                                  record.releaseYear.isNotEmpty &&
                                  record.registrationNumber.isNotEmpty &&
                                  record.firstAndLastName.isNotEmpty &&
                                  record.phoneNumber.isNotEmpty &&
                                  record.recordDate != null &&
                                  record.recordTime != null)
                              ? Colors.white
                              : AppColors.darkGray,
                          borderColor: (record.recordModel.isNotEmpty &&
                                  record.recordBrand.isNotEmpty &&
                                  record.releaseYear.isNotEmpty &&
                                  record.registrationNumber.isNotEmpty &&
                                  record.firstAndLastName.isNotEmpty &&
                                  record.phoneNumber.isNotEmpty &&
                                  record.recordDate != null &&
                                  record.recordTime != null)
                              ? AppColors.prime
                              : Colors.black,
                        ),
                      ),
                    ],
                  );
                },
                valueListenable: wm.recordState,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<DateTime?> showTimeDialog({
  required BuildContext context,
}) {
  var dialog = Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    backgroundColor: Theme.of(context).canvasColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    clipBehavior: Clip.antiAlias,
    child: const TimePicker(),
  );

  return showDialog<DateTime?>(
    context: context,
    builder: (BuildContext context) => dialog,
    barrierColor: Colors.black54,
  );
}

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimePickerSpinner(
              is24HourMode: true,
              onTimeChange: (time) {
                setState(() {
                  selectedTime = time;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AppButtonWidget(
                title: 'Выбрать',
                onPressed: () {
                  Navigator.pop(context, selectedTime);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
