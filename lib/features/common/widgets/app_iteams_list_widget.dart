// ignore: duplicate_ignore
// ignore_for_, duplicate_ignore-file: public_member_api_docs
// ignore_for_file: public_member_api_docs

import 'dart:typed_data';
import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppItemListWidget<T> extends StatelessWidget {
  final List<T> values;
  final List<String> carBrand;
  final List<String> carModel;
  final List<String> registrationNumber;
  final List<Uint8List> photoList;
  final void Function(T) onTapThreeDots;
  final void Function(T)? onItemTap;

  const AppItemListWidget({
    super.key,
    required this.values,
    required this.carBrand,
    required this.carModel,
    required this.registrationNumber,
    required this.photoList,
    required this.onTapThreeDots,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: carBrand.length,
          itemBuilder: (context, index) {
            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                onItemTap?.call(values[index]);
              },
              child: Container(
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: photoList[index].isNotEmpty
                                    ? Image.memory(
                                        photoList[index],
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        color: AppColors.prime,
                                      ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${carBrand[index]} ${carModel[index]}',
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.medium18.value.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      registrationNumber[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.regular14.value.copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
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
        ),
      ),
    );
  }
}
