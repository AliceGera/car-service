import 'package:flutter/material.dart';

/// App text style.
enum AppTextStyle {
  light12(TextStyle(fontSize: 12, height: 1.4, fontWeight: FontWeight.w300)),
  regular13(TextStyle(fontSize: 13, height: 1.38)),
  regular14(TextStyle(fontSize: 14, height: 1.71)),
  superLight12(TextStyle(fontSize: 12, height: 2, fontWeight: FontWeight.w200)),
  regular10(TextStyle(fontSize: 10, height: 1.14)),
  medium10(TextStyle(fontSize: 10, height: 1.17, fontWeight: FontWeight.w500)),
  medium13(TextStyle(fontSize: 13, height: 1.53, fontWeight: FontWeight.w500)),
  medium14(TextStyle(fontSize: 14, height: 1.64, fontWeight: FontWeight.w500)),
  medium15(TextStyle(fontSize: 15, height: 1.6, fontWeight: FontWeight.w500)),
  medium16(TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w500)),
  medium17(TextStyle(fontSize: 17, height: 1.41, fontWeight: FontWeight.w500)),
  semiBold16(TextStyle(fontSize: 16, height: 1.8, fontWeight: FontWeight.w600)),
  bold14(TextStyle(fontSize: 14, height: 1.40, fontWeight: FontWeight.w700)),
  bold16(TextStyle(fontSize: 16, height: 1.24, fontWeight: FontWeight.w700)),
  bold32(TextStyle(fontSize: 32, height: 3.757, fontWeight: FontWeight.w700));

  final TextStyle value;

  const AppTextStyle(this.value);
}
