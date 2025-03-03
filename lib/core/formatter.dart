import 'package:intl/intl.dart';

String formatCurrency(int amount){
  NumberFormat currencyFormatter = NumberFormat("#,###", "en_US");
  return currencyFormatter.format(amount);
}