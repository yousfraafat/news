import 'package:intl/intl.dart';

extension DateExtension on String {
  String formatDate() {
    var inputDate = DateFormat('yyyy-MM-ddTHH:mm:SSZ');
    var date = inputDate.parse(this);
    var outputDate = DateFormat('yyyy MM dd HH:mm aa');
    return outputDate.format(date);
  }
}
