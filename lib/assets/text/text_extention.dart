import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle light10;
  final TextStyle light12;
  final TextStyle regular13;
  final TextStyle superLight12;
  final TextStyle regular10;
  final TextStyle regular14;
  final TextStyle regular15;
  final TextStyle medium10;
  final TextStyle medium12;
  final TextStyle medium13;
  final TextStyle medium14;
  final TextStyle medium15;
  final TextStyle medium17;
  final TextStyle medium18;
  final TextStyle medium16;
  final TextStyle medium20;
  final TextStyle medium22;
  final TextStyle semiBold16;
  final TextStyle semiBold18;
  final TextStyle semiBold20;
  final TextStyle semiBold22;
  final TextStyle semiBold24;
  final TextStyle semiBold28;
  final TextStyle bold14;
  final TextStyle bold16;
  final TextStyle bold32;

  AppTextTheme._({
    required this.light10,
    required this.light12,
    required this.regular13,
    required this.superLight12,
    required this.regular10,
    required this.regular14,
    required this.regular15,
    required this.medium10,
    required this.medium12,
    required this.medium13,
    required this.medium14,
    required this.medium15,
    required this.medium16,
    required this.medium17,
    required this.medium18,
    required this.medium20,
    required this.medium22,
    required this.semiBold16,
    required this.semiBold18,
    required this.semiBold20,
    required this.semiBold22,
    required this.semiBold24,
    required this.semiBold28,
    required this.bold14,
    required this.bold16,
    required this.bold32,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : light10 = AppTextStyle.light10.value,light12 = AppTextStyle.light12.value,
        regular10 = AppTextStyle.regular10.value,
        regular13 = AppTextStyle.regular13.value,
        regular14 = AppTextStyle.regular14.value,
        regular15 = AppTextStyle.regular15.value,
        superLight12 = AppTextStyle.superLight12.value,
        medium10 = AppTextStyle.medium10.value,
        medium12 = AppTextStyle.medium12.value,
        medium13 = AppTextStyle.medium13.value,
        medium14 = AppTextStyle.medium14.value,
        medium15 = AppTextStyle.medium15.value,
        medium16 = AppTextStyle.medium16.value,
        medium17 = AppTextStyle.medium17.value,
        medium18 = AppTextStyle.medium18.value,
        medium20 = AppTextStyle.medium20.value,
        medium22 = AppTextStyle.medium22.value,
        bold14 = AppTextStyle.bold14.value,
        semiBold16 = AppTextStyle.semiBold16.value,
        semiBold18 = AppTextStyle.semiBold18.value,
        semiBold20 = AppTextStyle.semiBold20.value,
        semiBold22= AppTextStyle.semiBold22.value,
        semiBold24 = AppTextStyle.semiBold24.value,
        semiBold28 = AppTextStyle.semiBold28.value,
        bold16 = AppTextStyle.bold16.value,
        bold32 = AppTextStyle.bold32.value;

  @override
  ThemeExtension<AppTextTheme> lerp(
    ThemeExtension<AppTextTheme>? other,
    double t,
  ) {
    if (other is! AppTextTheme) {
      return this;
    }

    return AppTextTheme._(
      light10: TextStyle.lerp(light10, other.light10, t)!,
      light12: TextStyle.lerp(light12, other.light12, t)!,
      superLight12: TextStyle.lerp(superLight12, other.superLight12, t)!,
      regular10: TextStyle.lerp(regular10, other.regular10, t)!,
      regular13: TextStyle.lerp(regular13, other.regular13, t)!,
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      regular15: TextStyle.lerp(regular15, other.regular15, t)!,
      medium10: TextStyle.lerp(medium10, other.medium10, t)!,
      medium12: TextStyle.lerp(medium12, other.medium12, t)!,
      medium13: TextStyle.lerp(medium13, other.medium13, t)!,
      medium14: TextStyle.lerp(medium14, other.medium14, t)!,
      medium15: TextStyle.lerp(medium15, other.medium15, t)!,
      medium16: TextStyle.lerp(medium16, other.medium16, t)!,
      medium17: TextStyle.lerp(medium17, other.medium17, t)!,
      medium18: TextStyle.lerp(medium18, other.medium18, t)!,
      medium20: TextStyle.lerp(medium20, other.medium20, t)!,
      medium22: TextStyle.lerp(medium22, other.medium22, t)!,
      semiBold16: TextStyle.lerp(semiBold16, other.semiBold16, t)!,
      semiBold18: TextStyle.lerp(semiBold18, other.semiBold18, t)!,
        semiBold20: TextStyle.lerp(semiBold20, other.semiBold20, t)!,
        semiBold22: TextStyle.lerp(semiBold22, other.semiBold22, t)!,
      semiBold24: TextStyle.lerp(semiBold24, other.semiBold24, t)!,
      semiBold28: TextStyle.lerp(semiBold28, other.semiBold28, t)!,
      bold14: TextStyle.lerp(bold14, other.bold14, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold32: TextStyle.lerp(bold32, other.bold32, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextTheme>() ?? _throwThemeExceptionFromFunc(context);
  }

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? light10,
    TextStyle? light12,
    TextStyle? regular10,
    TextStyle? regular13,
    TextStyle? regular14,
    TextStyle? regular15,
    TextStyle? superLight12,
    TextStyle? medium10,
    TextStyle? medium12,
    TextStyle? medium13,
    TextStyle? medium14,
    TextStyle? medium15,
    TextStyle? medium16,
    TextStyle? medium17,
    TextStyle? medium18,
    TextStyle? medium20,
    TextStyle? medium22,
    TextStyle? bold14,
    TextStyle? semiBold16,
    TextStyle? semiBold18,
    TextStyle? semiBold20,
    TextStyle? semiBold22,
    TextStyle? semiBold24,
    TextStyle? semiBold28,
    TextStyle? bold16,
    TextStyle? bold32,
  }) {
    return AppTextTheme._(
      light10: light10 ?? this.light10,
      light12: light12 ?? this.light12,
      superLight12: superLight12 ?? this.superLight12,
      regular10: regular10 ?? this.regular10,
      regular13: regular13 ?? this.regular13,
      regular14: regular14 ?? this.regular14,
      regular15: regular14 ?? this.regular15,
      medium10: medium10 ?? this.medium10,
      medium12: medium12 ?? this.medium12,
      medium13: medium13 ?? this.medium13,
      medium14: medium14 ?? this.medium14,
      medium15: medium15 ?? this.medium15,
      medium16: medium16 ?? this.medium16,
      medium17: medium17 ?? this.medium17,
      medium18: medium18 ?? this.medium18,
      medium20: medium20 ?? this.medium20,
      medium22: medium22 ?? this.medium22,
      semiBold16: semiBold16 ?? this.semiBold16,
      semiBold18: semiBold18 ?? this.semiBold18,
      semiBold20: semiBold20 ?? this.semiBold20,
      semiBold22: semiBold22 ?? this.semiBold22,
      semiBold24: semiBold24 ?? this.semiBold24,
      semiBold28: semiBold28 ?? this.semiBold28,
      bold14: bold14 ?? this.bold14,
      bold16: bold16 ?? this.bold16,
      bold32: bold32 ?? this.bold32,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) => throw Exception('$AppTextTheme не найдена в $context');
