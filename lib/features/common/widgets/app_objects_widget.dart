import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:car_service/features/common/domain/data/object/object_data.dart';
import 'package:car_service/features/common/domain/data/objectTypes/object_type_data.dart';
import 'package:car_service/features/common/domain/data/object_type_with_objects/object_type_with_objects_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppObjectsWidget<T> extends StatelessWidget {
  final VoidCallback? openAddObjectScreen;
  final List<ObjectTypeWithObjectsData> objectTypeWithObjects;
  final void Function(ObjectData, ObjectTypeData) editObjectScreen;
  final Future<void> Function(ObjectData) deleteObject;
  final bool isAdd;
  final void Function(ObjectData, ObjectTypeData) onTapThreeDots;

  const AppObjectsWidget({
    required this.editObjectScreen,
    required this.deleteObject,
    required this.objectTypeWithObjects,
    required this.isAdd,
    super.key,
    this.openAddObjectScreen,
    required this.onTapThreeDots,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          ListView.separated(
            separatorBuilder: (context, ind) => const SizedBox(height: 4),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: objectTypeWithObjects.length,
            itemBuilder: (context, ind) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (objectTypeWithObjects[ind].objects.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      objectTypeWithObjects[ind].objectType.objectTypeName,
                      style: AppTextStyle.semiBold20.value.copyWith(color: AppColors.prime),
                    ),
                  ),
                if (objectTypeWithObjects[ind].objects.isNotEmpty)
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: (objectTypeWithObjects[ind].objects.length / 2).round(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(),
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(25),
                                              child: objectTypeWithObjects[ind].objects[index * 2].photo.isNotEmpty
                                                  ? Image.memory(
                                                      objectTypeWithObjects[ind].objects[index * 2].photo,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Container(
                                                      color: AppColors.prime,
                                                    ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                isAdd
                                                    ? onTapThreeDots.call(
                                                        objectTypeWithObjects[ind].objects[index * 2],
                                                        objectTypeWithObjects[ind].objectType,
                                                      )
                                                    : editObjectScreen.call(
                                                        objectTypeWithObjects[ind].objects[index * 2],
                                                        objectTypeWithObjects[ind].objectType,
                                                      );
                                              },
                                              child: SvgPicture.asset(SvgIcons.dots))
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            objectTypeWithObjects[ind].objects[index * 2].objectName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyle.medium14.value.copyWith(color: Colors.black),
                                          ),
                                          Text(
                                            '${objectTypeWithObjects[ind].objects[index * 2].objectCount.toString()} ${objectTypeWithObjects[ind].objects[index * 2].measureUnit}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyle.medium14.value.copyWith(color: AppColors.darkGray),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            if (index * 2 + 1 != objectTypeWithObjects[ind].objects.length)
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(),
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(25),
                                                child: objectTypeWithObjects[ind].objects[index * 2 + 1].photo.isNotEmpty
                                                    ? Image.memory(
                                                        objectTypeWithObjects[ind].objects[index * 2 + 1].photo,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Container(
                                                        color: AppColors.prime,
                                                      ),
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  isAdd
                                                      ? onTapThreeDots.call(
                                                          objectTypeWithObjects[ind].objects[index * 2 + 1],
                                                          objectTypeWithObjects[ind].objectType,
                                                        )
                                                      : editObjectScreen.call(
                                                          objectTypeWithObjects[ind].objects[index * 2 + 1],
                                                          objectTypeWithObjects[ind].objectType,
                                                        );
                                                },
                                                child: SvgPicture.asset(SvgIcons.dots))
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              objectTypeWithObjects[ind].objects[index * 2 + 1].objectName,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyle.medium14.value.copyWith(color: Colors.black),
                                            ),
                                            Text(
                                              '${objectTypeWithObjects[ind].objects[index * 2 + 1].objectCount.toString()} ${objectTypeWithObjects[ind].objects[index * 2 + 1].measureUnit}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyle.medium14.value.copyWith(color: AppColors.darkGray),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            else
                              const Spacer(),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
