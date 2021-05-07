import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import 'package:flutter/foundation.dart';
class DroiteButton extends StatelessWidget {
  DroiteButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon : Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset(buttonVersDroite),
                Positioned(
                  bottom: 23.0,
                  child: Text(
                    "GEOGRAPHIE",
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

        onPressed: onPressed
    );
  }
}