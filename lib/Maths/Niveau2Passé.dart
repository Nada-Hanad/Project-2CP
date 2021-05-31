import 'package:flutter/material.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Maths/M-2.dart';
import 'package:somthn/Maths/M-3.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Mutual/Stars.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import '../WelcomePages/Home.dart';
import '../WelcomePages/ChooseAvatar.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Services/Login.dart';
import '../Services/SignUp.dart';
import 'BienvenueMath.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Niveau2Pass extends StatefulWidget {
  @override
  _Niveau2PassState createState() => _Niveau2PassState();
}

class _Niveau2PassState extends State<Niveau2Pass> {
  @override




  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/forestbackground.jpg"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                top: size.height*0.05,
                left:size.width*0.75,
                child: SettingsButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()));
                  print("HELL YEAH");
                },)
            ),

            Positioned(
                top: size.height*0.05,
                right:size.width*0.75,
                child: BacksButton(onPressed: (){
                  print("HELL YEAH");
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Math2()));
                },)
            ),
            Positioned(
              top: size.height*0.047,
              left: size.width*0.39,
              child: HomeButton(
                onPressed: (){
                  print("HELL YEAH");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),);

                },
              ),
            ),
            Positioned(
              top: size.height*0.65,
              right: size.width*0.45,
              child:StarIcon(),
            ),
            if (user.avatar=="Pink")
              Visibility(

                child: Positioned(
                  top: size.height*0.48,
                  right: size.width*0.58,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child:Transform.rotate(
                      angle: 6,
                      child: PinkAvatarIcon(onPressed: null,)),
                ),
              ),
            if (user.avatar=="Purple")
              Visibility(

                child: Positioned(
                  top: size.height*0.46,
                  right: size.width*0.56,
                  height: size.height*0.35,
                  width: size.width*0.35,
                  child:Transform.rotate(
                      angle: 6,
                      child: PurpleAvatarIcon(onPressed: null,)),
                ),
              ),
            if (user.avatar=="Orange")
              Visibility(

                child: Positioned(
                  top: size.height*0.49,
                  right: size.width*0.58,
                  height: size.height*0.3,
                  width: size.width*0.3,
                  child: Transform.rotate(
                      angle: 6,
                      child: OrangeAvatarIcon(onPressed: null,)),
                ),
              ),
            if (user.avatar=="Blue")
              Positioned(
                top: size.height*0.48,
                right: size.width*0.58,
                height: size.height*0.3,
                width: size.width*0.3,
                child: Transform.rotate
                  (
                    angle:6,
                    child: BlueAvatarIcon(onPressed: null,)),
              ),


            Positioned(
              top: size.height*0.2,
              right: size.width*0.2,
              height: size.height*0.4,
              width: size.width*0.6,
              child:SvgPicture.asset(bulleNiveauPasse),
            ),

            Positioned(
              top: size.height*0.83,
              left: size.width*0.7 ,
              child: GoToButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Math3()));
              }),
            ),

          ],
        ),
      ),
    );
  }
}
