import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/records/record_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ServiceRecordWidget extends StatelessWidget {
  final List<RecordData> values;
  final List<String> recordBrand;
  final List<String> recordModel;
  final List<String> registrationNumber;
  final void Function(RecordData) onTapThreeDots;

  const ServiceRecordWidget({
    super.key,
    required this.values,
    required this.registrationNumber,
    required this.recordBrand,
    required this.recordModel,
    required this.onTapThreeDots,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: recordBrand.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  SizedBox(
                    width: 56,
                    child: Text(
                      DateFormat('HH:mm').format(values[index].recordTime!),
                      style: AppTextStyle.semiBold20.value.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Container(width: 0.5, color: AppColors.prime),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${recordBrand[index]} ${recordModel[index]}',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.medium18.value.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          registrationNumber[index],
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.medium18.value.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => onTapThreeDots.call(values[index]),
                    child: SvgPicture.asset(SvgIcons.dots),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
