import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

const IconData newspaper = IconData(0xf0541, fontFamily: 'MaterialIcons');
const IconData redeem = IconData(0xe511, fontFamily: 'MaterialIcons');
const primaryColor = Color(0xFFFFFF00);
var isConnected = true;
int cashoutTime = DateTime.now().add(const Duration(hours: 4)).millisecondsSinceEpoch + 1000 * 30;

String getCurrency() {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
  return format.currencySymbol;
}
