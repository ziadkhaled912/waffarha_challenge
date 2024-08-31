import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DoubleUtils on num {
  num shouldShowDecimal() {
    final floored = floor();
    final value = this / floored;
    return value == 1 ? toInt() : this;
  }

  Widget get emptyWidth => SizedBox(width: toDouble());

  Widget get emptyHeight => SizedBox(height: toDouble());
}

extension PriceFormat on num {
  String formatPrice(){
    final decimalDigits = this / toInt() == 1 ? 0 : 2;

    return NumberFormat.simpleCurrency(
      decimalDigits: decimalDigits,
      name: "",
    ).format(this).replaceAll(r'$', '');
  }

  String calculatePercentagePerYear(num percentage, num duration) {
    final percentagePerYear = percentage *  duration;
    return percentagePerYear.toStringAsFixed(isDecimal(percentagePerYear) == true ? 2 : 0);
  }

  bool isDecimal(num number){
    return number.truncate() != number;
  }
}
