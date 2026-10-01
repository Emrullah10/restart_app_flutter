/// 0 idle · 1 weak · 2 fair · 3 good · 4 strong (length based, as in the Stitch prototype).
int passwordScore(String v) {
  final n = v.length;
  if (n == 0) return 0;
  if (n < 6) return 1;
  if (n < 8) return 2;
  if (n < 12) return 3;
  return 4;
}
