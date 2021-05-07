import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class OrangeOwl extends StatelessWidget {
  OrangeOwl({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : SvgPicture.asset(orangeOwl),
        iconSize: 200.0,
        onPressed: onPressed
    );
  }
}