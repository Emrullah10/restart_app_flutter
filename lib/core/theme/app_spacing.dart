import 'package:flutter/material.dart';

/// 4px rhythm (CSS px == Flutter logical px — no screenutil scaling).
class Sp {
  static const s1 = 4.0, s2 = 8.0, s3 = 12.0, s4 = 16.0, s5 = 20.0, s6 = 24.0, s8 = 32.0, s10 = 40.0, s12 = 48.0, s16 = 64.0;
}

/// Radii — Stitch overrides Tailwind: rounded=2, lg=4, md=6, xl=8, full=12.
class Rad {
  static const r2 = Radius.circular(2), r4 = Radius.circular(4), r6 = Radius.circular(6), r8 = Radius.circular(8), r12 = Radius.circular(12);
  static const b2 = BorderRadius.all(r2), b4 = BorderRadius.all(r4), b6 = BorderRadius.all(r6), b8 = BorderRadius.all(r8), b12 = BorderRadius.all(r12);
}

class Shadows {
  static const sm = [BoxShadow(color: Color(0x0D000000), blurRadius: 2, offset: Offset(0, 1))];
  static const md = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4)),
    BoxShadow(color: Color(0x1A000000), blurRadius: 4, spreadRadius: -2, offset: Offset(0, 2)),
  ];
}
