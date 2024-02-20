import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.items, required this.title});

  final List<String> items;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Expanded(
          child: Text(
            widget.title,
            style: AppTextStyle.superLight12.value.copyWith(color: AppColors.buttonColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        items: widget.items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppTextStyle.superLight12.value.copyWith(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.gray,
              width: 0.2,
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
          //width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.white,
          ),
          // offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
      ),
    );
  }
}
