import 'package:flutter/material.dart';
import 'package:somthn/WelcomePages/ChoixDomaines.dart';
import 'package:somthn/WelcomePages/Settings.dart';
//import 'package:somthn/TestDeNiveau/TestDeniveau.dart';
import 'package:somthn/Buttons/buttonCommencerDroit.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../myicons.dart';
import './NiveauGeo.dart';
import '../WelcomePages/ChoixDomaines.dart';
import 'ScoreGeo.dart';
import '../Maths/HighestScore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'TestNiv/BienvenueTest.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


ScoreGeo scoreG ;
HighestScore highG ;


class BienvenueGeo extends StatefulWidget {
  @override
  _BienvenueGeoState createState() => _BienvenueGeoState();
}

class _BienvenueGeoState extends State<BienvenueGeo> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/IntroGeo.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Scaffold(
        body:
        Stack(
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
                  child:
                  SettingsButton(onPressed: (){
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChoixDomaine()));
                  },)
              ),
              Positioned(
                top: size.height*0.5,
                right: size.width*0.48,
                height: size.height*0.55,
                width: size.width*0.55,
                child: ButtonCommencerD(onPressed: () async  {
                  print('commencer');
                  var d=await Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').get();

                  scoreG=new ScoreGeo(d.data["testFait"], d.data["niv1"], d.data["niv2"], d.data["niv3"]);
                  highG=new HighestScore(d.data["high1"],d.data["high2"],d.data["high3"]);

                  print(scoreG.niv1);
                  if (scoreG.testFait){
                    Navigator.push(

                        context,
                        MaterialPageRoute(builder: (context) => NiveauGeo()));}
                  else {
                    Navigator.push(

                        context,
                        MaterialPageRoute(builder: (context) => TestNiveau()));
                  }
                }
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(

                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.15,
                    top:size.height*0.61,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(

                  child: Positioned(
                    top: size.height*0.6,
                    right: size.width*0.6 ,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(

                  child: Positioned(
                    top: size.height*0.61,
                    right: size.width*0.6 ,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(

                  child: Positioned(
                    top: size.height*0.61,
                    right: size.width*0.6 ,
                    height: size.width*0.3,
                    width: size.width*0.25,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),

              Positioned(
                top: size.height*0.05,
                left: size.width*0.2 ,
                height: size.height*0.8,
                width: size.width*0.8,
                child:SvgPicture.asset(BulleBienvenueGeo),
              ),
            ]
        ),
      ),
    );
  }
}

