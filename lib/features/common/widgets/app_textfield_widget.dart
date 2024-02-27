import 'package:car_service/assets/colors/app_colors.dart';
import 'package:car_service/assets/res/svg_icons.dart';
import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWidget extends StatefulWidget {
  const AppTextFieldWidget({
    required this.text,
    this.formKey,
    this.controller,
    super.key,
    this.validatorText,
    this.lines = 1,
    this.isPrice = false,
    this.keyboardType,
    this.inputFormatters,
  });

  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final int lines;
  final bool isPrice;
  final String text;
  final String? Function()? validatorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  final FocusNode _focus = FocusNode();

  bool isFocused = false;
  bool isShowFloatingLabel = false;
  bool textIsNotEmpty = false;

  void listener() {
    setState(() {
      textIsNotEmpty = widget.controller!.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    widget.controller?.addListener(listener);
    listener();
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(listener);
    _focus
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focus.hasFocus;
    });
  }

  late Widget widgetStack = Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: TextFormField(
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      maxLines: widget.lines,
      style: AppTextStyle.regular14.value.copyWith(color: Colors.black),
      validator: (value) {
        return widget.validatorText?.call() != null ? '' : null;
      },
      focusNode: _focus,
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.red, width: 0.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.2, color: AppColors.gray),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.2, color: AppColors.gray),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.gray, width: 0.2),
        ),
        errorStyle: const TextStyle(height: 0),
        fillColor: AppColors.white,
        filled: true,
        hintText: widget.text,
        hintStyle: AppTextStyle.superLight12.value.copyWith(color: AppColors.prime),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Form(
        key: widget.formKey,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (textIsNotEmpty || isFocused)
                Stack(
                  children: [
                    widgetStack,
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.text,
                        style: AppTextStyle.medium10.value.copyWith(color: AppColors.prime),
                      ),
                    ),
                  ],
                )
              else
                Stack(
                  children: [
                    widgetStack,
                    const SizedBox(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
