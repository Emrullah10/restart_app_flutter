import 'package:intl/intl.dart';

/// Locale-aware formatting. TR: 4.250 / 24,5 / ₺2.340 / %65 — EN: 4,250 / 24.5 / ₺2,340 / 65%.
class Fmt {
  final String lang;
  const Fmt(this.lang);
  String get _loc => lang == 'tr' ? 'tr_TR' : 'en_US';

  String number(num n, {int digits = 0}) => NumberFormat.decimalPatternDigits(locale: _loc, decimalDigits: digits).format(n);
  String currency(num n) => '₺${number(n, digits: n == n.roundToDouble() ? 0 : 2)}';
  String percent(num n) => lang == 'tr' ? '%${number(n)}' : '${number(n)}%';
  String compact(num n) => n < 1000 ? number(n) : '${number(n / 1000, digits: n >= 10000 ? 0 : 1)}${lang == 'tr' ? ' B' : 'K'}';
  String date(DateTime d) => DateFormat('dd MMM yyyy', _loc).format(d);
  String monthYear(DateTime d) => DateFormat('MMMM yyyy', _loc).format(d);
  String time(DateTime d) => DateFormat('HH:mm', _loc).format(d);

  String relative(DateTime d, {DateTime? now}) {
    final n = now ?? DateTime.now();
    final days = DateTime(n.year, n.month, n.day).difference(DateTime(d.year, d.month, d.day)).inDays;
    final mins = n.difference(d).inMinutes;
    final tr = lang == 'tr';
    if (mins < 1) return tr ? 'Az önce' : 'Just now';
    if (days <= 0) return mins < 60 ? (tr ? '$mins dk önce' : '$mins min ago') : '${tr ? 'Bugün' : 'Today'}, ${time(d)}';
    if (days == 1) return '${tr ? 'Dün' : 'Yesterday'}, ${time(d)}';
    if (days < 7) return tr ? '$days gün önce' : '$days days ago';
    if (days < 30) return tr ? '${days ~/ 7} hafta önce' : '${days ~/ 7} weeks ago';
    return date(d);
  }

  static String initials(String name) {
    final p = name.trim().split(RegExp(r'\s+')).where((e) => e.isNotEmpty).take(2).toList();
    return p.isEmpty ? 'R' : p.map((e) => e[0].toUpperCase()).join();
  }
}
