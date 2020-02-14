import 'package:intl/intl.dart';

class Format {
  static String numberFormat(double result) {
    NumberFormat nf =
        NumberFormat.currency(locale: "en_US", decimalDigits: 2, symbol: "\$");
    //NumberFormat nf = NumberFormat("#,##0.00", "en_US");
    String formattedResult = nf.format(result);
    return formattedResult;
  }
}
