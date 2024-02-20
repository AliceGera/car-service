import 'package:car_service/assets/text/text_style.dart';
import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle light12;
  final TextStyle regular13;
  final TextStyle superLight12;
  final TextStyle regular10;
  final TextStyle regular14;
  final TextStyle medium10;
  final TextStyle medium13;
  final TextStyle medium14;
  final TextStyle medium15;
  final TextStyle medium17;
  final TextStyle medium16;
  final TextStyle semiBold16;
  final TextStyle bold14;
  final TextStyle bold16;
  final TextStyle bold32;

  AppTextTheme._({
    required this.light12,
    required this.regular13,
    required this.superLight12,
    required this.regular10,
    required this.regular14,
    required this.medium10,
    required this.medium13,
    required this.medium14,
    required this.medium15,
    required this.medium17,
    required this.medium16,
    required this.semiBold16,
    required this.bold14,
    required this.bold16,
    required this.bold32,
  });

  /// Base app text theme.
  AppTextTheme.base()
      : light12 = AppTextStyle.light12.value,
        regular13 = AppTextStyle.regular13.value,
        regular14 = AppTextStyle.regular14.value,
        superLight12 = AppTextStyle.superLight12.value,
        regular10 = AppTextStyle.regular10.value,
        medium10 = AppTextStyle.medium10.value,
        medium13 = AppTextStyle.medium13.value,
        medium14 = AppTextStyle.medium14.value,
        medium15 = AppTextStyle.medium15.value,
        medium17 = AppTextStyle.medium17.value,
        medium16 = AppTextStyle.medium16.value,
        bold14 = AppTextStyle.bold14.value,
        semiBold16 = AppTextStyle.semiBold16.value,
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
      light12: TextStyle.lerp(light12, other.light12, t)!,
      superLight12: TextStyle.lerp(superLight12, other.superLight12, t)!,
      regular10: TextStyle.lerp(regular10, other.regular10, t)!,
      regular13: TextStyle.lerp(regular13, other.regular13, t)!,
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      medium10: TextStyle.lerp(medium10, other.medium10, t)!,
      medium13: TextStyle.lerp(medium13, other.medium13, t)!,
      medium14: TextStyle.lerp(medium14, other.medium14, t)!,
      medium15: TextStyle.lerp(medium15, other.medium15, t)!,
      medium17: TextStyle.lerp(medium17, other.medium17, t)!,
      medium16: TextStyle.lerp(medium16, other.medium16, t)!,
      semiBold16: TextStyle.lerp(semiBold16, other.semiBold16, t)!,
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
    TextStyle? light12,
    TextStyle? regular13,
    TextStyle? regular14,
    TextStyle? superLight12,
    TextStyle? regular10,
    TextStyle? medium10,
    TextStyle? medium13,
    TextStyle? medium14,
    TextStyle? medium15,
    TextStyle? medium17,
    TextStyle? medium16,
    TextStyle? bold14,
    TextStyle? semiBold16,
    TextStyle? bold16,
    TextStyle? bold32,
  }) {
    return AppTextTheme._(
      light12: light12 ?? this.light12,
      superLight12: superLight12 ?? this.superLight12,
      regular10: regular10 ?? this.regular10,
      regular13: regular13 ?? this.regular13,
      regular14: regular10 ?? this.regular14,
      medium10: medium13 ?? this.medium10,
      medium13: medium13 ?? this.medium13,
      medium14: medium14 ?? this.medium14,
      medium15: medium15 ?? this.medium15,
      medium17: medium17 ?? this.medium17,
      medium16: medium16 ?? this.medium16,
      semiBold16: semiBold16 ?? this.semiBold16,
      bold14: bold14 ?? this.bold14,
      bold16: bold16 ?? this.bold16,
      bold32: bold16 ?? this.bold32,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) => throw Exception('$AppTextTheme не найдена в $context');
