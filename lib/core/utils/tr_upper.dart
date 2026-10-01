/// Turkish-aware upper casing (i→İ, ı→I). Dart's toUpperCase() is locale independent.
String trUpper(String s, {bool turkish = true}) {
  if (!turkish) return s.toUpperCase();
  return s.replaceAll('i', 'İ').replaceAll('ı', 'I').toUpperCase();
}
