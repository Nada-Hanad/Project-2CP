import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'myicons.dart';
import 'package:flutter/foundation.dart';
class CentreButton extends StatelessWidget {
  CentreButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset(buttonCentre),
                Positioned(
                  bottom : 18.0,
                  child: Text(
                    "MATHEMATIQUE",
                    style: TextStyle(
                      fontFamily: 'Skranji-Bold',
                      fontSize: 25,
                      color: Colors.brown[700],
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
              ],
            ),
          ),),
        iconSize: 150.0,

        onPressed: onPressed
    );
  }
}
