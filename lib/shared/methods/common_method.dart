import 'package:intl/intl.dart';

String formatVnd(String price) {
  final oCcy = NumberFormat('#,###', 'en_US');
  return '${oCcy.format(double.parse(price))} VNĐ';
}

bool toBool(String ext) {
  if (ext == 'true') {
    return true;
  }
  return false;
}
