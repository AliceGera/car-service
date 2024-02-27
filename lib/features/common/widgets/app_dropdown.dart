import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({
    super.key,
    required this.items,
    required this.title,
    required this.selectedValueText,
    this.isEdit = false,
    this.text = '',
    this.colorBorder = AppColors.gray,
  });

  final void Function(String) selectedValueText;
  final List<String> items;
  final String title;
  final bool isEdit;
  final Color colorBorder;
  final String text;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? selectedValue;
  final bool isEditt = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                widget.title,
                style: widget.isEdit
                    ? AppTextStyle.regular14.value.copyWith(color: Colors.black)
                    : AppTextStyle.superLight12.value.copyWith(color: AppColors.prime),
                overflow: TextOverflow.ellipsis,
              ),
              items: widget.items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: AppTextStyle.regular14.value.copyWith(color: Colors.black),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
                widget.selectedValueText.call(selectedValue!);
              },
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: widget.colorBorder,
                    width: 0.4,
                  ),
                  color: Colors.white,
                ),
                //elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: SvgPicture.asset(SvgIcons.arrowDown),
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 44,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            widget.text,
            style: AppTextStyle.medium10.value.copyWith(color: AppColors.prime),
          ),
        ),
      ],
    );
  }
}
