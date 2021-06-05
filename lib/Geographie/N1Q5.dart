import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Geographie/N1Q5T2_C_1.dart';
import 'package:somthn/Geographie/N1Q5T2_C_2.dart';
import 'package:somthn/Geographie/N1Q5T2_C_3.dart';
import 'package:somthn/Geographie/N2Q2.dart';
import 'package:somthn/Geographie/Niv1Pass%C3%A9.dart';
import 'package:somthn/Geographie/NiveauGeo.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonQ.dart';
import 'package:somthn/myicons.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import '../Services/Login.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';

import 'BienvenueGeo.dart';




class N1Q5 extends StatefulWidget {
  const N1Q5({Key key}) : super(key: key);

  @override
  _N1Q5State createState() => _N1Q5State();
}
class _N1Q5State extends State<N1Q5> {

  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/doubleClic.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  bool oneClicked = false;
  bool twoClicked = false;
  bool threeClicked = false;
  bool fourClicked = false;
  bool Visible = true;
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
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,

                  child: BacksButton(onPressed: (){
                    print("u clicked me");
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NiveauGeo()));
                  },)
              ),

              Positioned(
                  top:size.height*0.05,
                  left:size.width*0.75,
                  child: SettingsButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                    print("settings");
                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FourBars)),
              Positioned(
                bottom: size.height*0.55,
                left: size.width*0.05,
                height: size.height*0.3,
                width: size.width*0.8,
                child:SvgPicture.asset('assets/icons/BulleN1Q5.svg'),
              ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(FourBars),
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:PinkAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child: OrangeAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.38,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),


              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.5,
                  left: size.width*0.5,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Amazigh.svg'),
                    onPressed: (){
                      print('merRouge');
                      setState(() {
                        oneClicked = false;
                        twoClicked = true;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.7,
                  left: size.width*0.5,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Chinois.svg'),
                    onPressed: (){
                      print('meditera');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = true;
                      });},
                  ),
                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.6,
                  left: size.width*0,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Francais.svg'),
                    onPressed: (){
                      print('merNoire');
                      setState(() {
                        oneClicked = false;
                        twoClicked = false;
                        threeClicked = true;
                        fourClicked = false;
                      });},
                  ),

                ),
              ),
              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.4,
                  left: size.width*0.0,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/icons/Arabe.svg'),
                    onPressed: (){
                      print('mermorte');
                      setState(() {
                        oneClicked = true;
                        twoClicked = false;
                        threeClicked = false;
                        fourClicked = false;
                      });},
                  ),
                ),
              ),

              Visibility(
                visible: !Visible,
                child: Positioned(
                    top: size.height*0.8,
                    left: 0.0,
                    height: size.height*0.2,
                    width: size.width*0.5,
                    child: ButtonContinuer(onPressed: (){
                      print("score final");
                      print(scoreG.niv1);
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').updateData({'niv1':scoreG.niv1});
                      if (scoreG.niv1>highG.niv1)
                      { highG.niv1=scoreG.niv1 ;
                      Firestore.instance.collection('users').document(user.uid).collection('domains').document('geographie').updateData({'high1':scoreG.niv1});}
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Niveau1Pass()));
                      print('Continuer');},)
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.729,
                    child:Image.asset('images/HappyPink.gif'),
                  ),
                ),
              if (user.avatar=="Purple")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.35,
                    width: size.width*0.35,
                    left: size.width*0.1,
                    top:size.height*0.7,
                    child:Image.asset('images/HappyPurple.gif'),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.729,
                    child: Image.asset('images/HappyOrange.gif'),
                  ),
                ),
              if (user.avatar=="Blue")
                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    height: size.width*0.3,
                    width: size.width*0.3,
                    left: size.width*0.1,
                    top:size.height*0.729,
                    child:Image.asset('images/HappyBlue.gif'),
                  ),
                ),
              Visibility(
                visible: !Visible,
                child: Positioned(
                    height: size.width*0.45,
                    width: size.width*0.45,
                    left: size.width*0.4,
                    top:size.height*0.7,
                    child: SvgPicture.asset(bulleBravo)
                ),
              ),

              Positioned(
                  top: size.height*0.6,
                  left: size.width*0,
                  height: size.height*0.3,
                  width: size.width*0.5,
                  child: Visibility(
                      visible: (threeClicked && Visible),
                      child: IconButton(
                        onPressed: (){
                          if (threeClicked){
                            Vibration.vibrate();
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => N1Q5T2_C_3()));
                              print('Wrong');
                            });

                            print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset('assets/icons/Francais.svg'),))
              ),
              Positioned(
                top: size.height*0.7,
                left: size.width*0.5,
                height: size.height*0.3,
                width: size.width*0.5,
                child: Visibility(
                    visible: (fourClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (fourClicked){
                            setState(() {
                              Visible = false;
                            });
                            scoreG.niv1+=2;

                            print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset('assets/icons/Chinois.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.5,
                left: size.width*0.5,
                height: size.height*0.3,
                width: size.width*0.5,

                child: Visibility(
                    visible: (twoClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (twoClicked){
                            Vibration.vibrate();
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => N1Q5T2_C_2()));
                              print('Wrong');
                            });

                            print('Correct');
                          }
                          print('2');
                        },
                        icon: SvgPicture.asset('assets/icons/Amazigh.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.4,
                left: size.width*0.0,
                height: size.height*0.3,
                width: size.width*0.5,
                child: Visibility(
                    visible: (oneClicked&&Visible),
                    child: IconButton(
                        onPressed: (){
                          if (oneClicked)  {
                            Vibration.vibrate();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => N1Q5T2_C_1()));
                            print('Wrong');
                          }
                          print('3');
                        },
                        icon: SvgPicture.asset('assets/icons/Arabe.svg'))
                ),
              ),
              Positioned(
                top: size.height*0.45,
                left: size.width*0.2,
                height: size.height*0.3,
                width: size.width*0.6,
                child: Visibility(
                    visible: !Visible,
                    child: IconButton(
                        onPressed: (){
                          print('3aychin ghaya kho');
                        },
                        icon: SvgPicture.asset('assets/icons/Chinois.svg'))
                ),
              ),
              Visibility(
                visible: !Visible,
                child:Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(Right)
                ),
              ),
            ],
          ),
        ));
  }
}