import 'package:intl/intl.dart';
import 'dart:ui' as ui;


String formatDate(DateTime date) {
  if (ui.window.locale.languageCode == 'es'){
    return DateFormat("dd/MM/yyyy", "es_ES").format(date);
  }
  else{
    return DateFormat("yyyy/MM/dd", "en_US").format(date);
  }
}

int formatDateInteger(DateTime date) {
  return int.parse(DateFormat("yyyyMMdd", "en_US").format(date));
}

String formatDateMonth(DateTime date) {
  if (ui.window.locale.languageCode == 'es'){
    return DateFormat("MMMM", "es_ES").format(date);
  }
  else{
    return DateFormat("MMMM", "en_US").format(date);
  }
}


