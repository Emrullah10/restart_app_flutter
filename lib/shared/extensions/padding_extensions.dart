import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtensions on num {
  EdgeInsets get allP => EdgeInsets.all(toDouble().r);
  EdgeInsets get onlyLeftP => EdgeInsets.only(left: toDouble().w);
  EdgeInsets get onlyRightP => EdgeInsets.only(right: toDouble().w);
  EdgeInsets get onlyTopP => EdgeInsets.only(top: toDouble().h);
  EdgeInsets get onlyBottomP => EdgeInsets.only(bottom: toDouble().h);
  EdgeInsets get verticalP => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get horizontalP => EdgeInsets.symmetric(horizontal: toDouble().w);
}

extension PaddingListExtensions on List<num> {
  EdgeInsets get horizantalAndVerticalP =>
      EdgeInsets.symmetric(horizontal: this[0].w, vertical: this[1].h);
  EdgeInsets get paddingLTRB =>
      EdgeInsets.fromLTRB(this[0].w, this[1].w, this[2].w, this[3].h);
}
