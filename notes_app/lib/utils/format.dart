import 'package:intl/intl.dart';

String formatDate(int date) {
  return DateFormat('dd-MM-yyyy')
      .format(DateTime.fromMillisecondsSinceEpoch(date));
}
