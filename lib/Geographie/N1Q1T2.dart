import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/Buttons/BacksButton.dart';
import 'package:somthn/Buttons/buttonContinuer.dart';
import 'package:somthn/Buttons/buttonGoTo.dart';
import 'package:somthn/Buttons/buttonReset.dart';
import 'package:somthn/Buttons/settingsButton.dart';
import 'package:somthn/Francais/F-1-5.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Geographie/N1.dart';
import 'package:somthn/Geographie/N1Q2.dart';
import 'package:somthn/Geographie/boxDialogGeo1.dart';

import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Services/Login.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

import 'BienvenueGeo.dart';

class N1Q1T2 extends StatefulWidget {
  const N1Q1T2({Key key}) : super(key: key);

  @override
  _N1Q1T2State createState() => _N1Q1T2State();
}

class _N1Q1T2State extends State<N1Q1T2> {

  var player = AudioCache();
  var player2 = AudioPlayer ();
  AudioPlayer advancedPlayer;


  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/mathsMauvRep.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  bool Visible = true;
  String a;
  String b;
  String c;
  String d;
  String e;
  String f;
  String g;
  String h;
  String drag1;
  String drag2;
  String drag3;
  String drag4;
  String drag5;
  String drag6;
  String drag7;
  String drag8;
  bool correct=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/geo_BG.jpg"),
                        fit: BoxFit.cover)),),
              Positioned(
                  top: size.height*0.05,
                  left:size.width*0.75,
                  child:
                  SettingsButton(onPressed: () async {
                    player2.stop();
                    int result = await advancedPlayer.pause();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },)
              ),
              Positioned(
                  top: size.height*0.05,
                  right:size.width*0.75,
                  child: BacksButton(onPressed: (){
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return customDialogGeo1();
                        }
                    );
                    player2.stop();

                  },)
              ),
              Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(EmptyBar)),

              Visibility(
                visible: !Visible,
                child: Positioned(
                  bottom: size.height*0.88,
                  left: size.width*0.275,
                  right: size.width*0.275,
                  child: SvgPicture.asset(barreProgress),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.47,
                  left: size.width*0.75,
                  child: GoToButton(onPressed: () async {
                    player2.stop();
                    int result = await advancedPlayer.pause();
                    if((drag1=="assets/icons/posA.svg")&&(drag2=="assets/icons/posB.svg" ||drag2=="assets/icons/posH.svg" )&&(drag3=="assets/icons/posC.svg")&&(drag4=="assets/icons/posD.svg")&&(drag5=="assets/icons/posE.svg")&&(drag6=="assets/icons/posF.svg")&&(drag7=="assets/icons/posG.svg")&&(drag8=="assets/icons/posH.svg" ||drag8=="assets/icons/posB.svg" )){
                      player2.stop();
                      int result = await advancedPlayer.pause();
                      player2 =  await player.play('audio/mathsBravo.wav');

                      setState(() {
                        correct = true;
                        Visible=false;
                        scoreG.niv1++;
                      });}else if ((drag1==null)&&(drag2==null)&&(drag3==null)&&(drag4==null)&&(drag5==null)&&(drag6==null)&&(drag7==null)&&(drag8==null)){}
                    else{
                      player2 =  await player.play('audio/losing.wav');
                      setState(() {
                        Visible=false;
                        correct = false;
                      });}

                  },),
                ),
              ),
              Positioned(
                top: size.height*0.535,
                left:size.width*0.05,
                height: size.height*0.2,
                width: size.width*0.9,

                child: Visibility(
                  child: Image.asset("images/BigButton2.jpg"),
                ),
              ),

              Visibility(
                visible: Visible,
                child: Positioned(
                  top: size.height*0.48,
                  right: size.width*0.77,
                  child: ButtonReset(
                      onPressed: () {
                        setState(() {
                          a="";
                          b="";
                          c="";
                          d="";
                          e="";
                          f="";
                          g="";
                          h="";
                          drag1=null;
                          drag2=null;
                          drag3=null;
                          drag4=null;
                          drag5=null;
                          drag6=null;
                          drag7= null;
                          drag8= null;
                        });
                      }

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
                    child: ButtonContinuer(onPressed: () async {
                      player2.stop();
                      int result = await advancedPlayer.pause();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => N1Q2()));},)
                ),
              ),
              if (user.avatar=="Pink")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.36,
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
                    top: size.height*0.35,
                    left: size.width*0.69,
                    height: size.width*0.35,
                    width: size.width*0.35,
                    child:PurpleAvatarIcon(onPressed: null,),
                  ),
                ),
              if (user.avatar=="Orange")
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.36,
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
                    top: size.height*0.36,
                    left: size.width*0.72,
                    height: size.width*0.3,
                    width: size.width*0.3,
                    child:BlueAvatarIcon(onPressed: null,),
                  ),
                ),
              Positioned(
                top: size.height*0.75,
                right: size.width*0.16,
                child: Visibility(
                  visible: Visible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////////////////////
                      /// Draggable
                      Draggable<String>(
                        onDragCompleted: (){

                          a = 'assets/icons/posA.svg';
                        },
                        data:
                        "assets/icons/posA.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: a == 'assets/icons/posA.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posA.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posA.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),


                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){

                          c = 'assets/icons/posC.svg';
                        },
                        data:
                        "assets/icons/posC.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: c == 'assets/icons/posC.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posC.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posC.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),
                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){

                          d = 'assets/icons/posD.svg';
                        },
                        data:
                        "assets/icons/posD.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: d == 'assets/icons/posD.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posD.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posD.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),
                      ),

                      ////////////////////////
                    ],
                  ),
                ),

              ),
              Positioned(
                top: size.height*0.83,
                right: size.width*0.16,
                child: Visibility(
                  visible: Visible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////////////////////
                      /// Draggable
                      Draggable<String>(
                        onDragCompleted: (){

                          b = 'assets/icons/posB.svg';
                        },
                        data:
                        "assets/icons/posB.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: b == 'assets/icons/posB.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posB.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posB.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),


                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){

                          f = 'assets/icons/posF.svg';
                        },
                        data:
                        "assets/icons/posF.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: f == 'assets/icons/posF.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posF.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posF.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),
                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){

                          e = 'assets/icons/posE.svg';
                        },
                        data:
                        "assets/icons/posE.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: e == 'assets/icons/posE.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posE.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posE.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),
                      ),

                      ////////////////////////
                    ],
                  ),
                ),

              ),
              Positioned(
                top: size.height*0.91,
                right: size.width*0.2,
                child: Visibility(
                  visible: Visible,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /////////////////////
                      /// Draggable
                      Draggable<String>(
                        onDragCompleted: (){

                          g = 'assets/icons/posG.svg';
                        },
                        data:
                        "assets/icons/posG.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: g == 'assets/icons/posG.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posG.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posG.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),


                      ),
                      SizedBox( width: size.width*0.1,),
                      Draggable<String>(
                        onDragCompleted: (){

                          h = 'assets/icons/posH.svg';
                        },
                        data:
                        "assets/icons/posH.svg",
                        child: Container(
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: h == 'assets/icons/posH.svg'
                              ? Container()
                              : SvgPicture.asset(
                            'assets/icons/posH.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),

                        // The widget to show under the pointer when a drag is under way
                        feedback:
                        Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/icons/posH.svg',
                            height: 65,
                            width: 65,
                          ),
                        ),
                        childWhenDragging: Container(
                          //color: Colors.purple,
                          width: 65,
                          height: 65,),
                      ),
                      SizedBox( width: size.width*0.1,),
                      ////////////////////////
                    ],
                  ),
                ),

              ),

              Positioned(
                top: size.height*0.5405,
                left: size.width*0.418,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag1 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag1 != null
                              ? SvgPicture.asset(
                            drag1,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag2 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag2 != null
                              ? SvgPicture.asset(

                            drag2,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height*0.599,
                left: size.width*0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag3 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag3 != null
                              ? SvgPicture.asset(
                            drag3,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag4 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag4 != null
                              ? SvgPicture.asset(

                            drag4,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag5 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag5 != null
                              ? SvgPicture.asset(

                            drag5,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.height*0.657,
                left: size.width*0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag6 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag6 != null
                              ? SvgPicture.asset(
                            drag6,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag7 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag7 != null
                              ? SvgPicture.asset(

                            drag7,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                    DragTarget<String>(
                      onAccept: (value) {
                        setState(() {
                          drag8 = value;
                        });
                      },
                      builder: (_, candidateData, rejectedData) {
                        return Container(
                          width: 65,
                          height: 65,

                          alignment: Alignment.center,
                          child: drag8 != null
                              ? SvgPicture.asset(

                            drag8,
                            height: 65,
                            width: 65,
                          )
                              : Container(),
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (correct)
                Stack(
                  children: <Widget>[
                    Visibility(
                      visible: !Visible,
                      child:Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Right)
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
                  ],
                ),
              if (!correct)
                Stack(
                  children:[
                    Visibility(
                      visible: !Visible,
                      child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(Wrong)
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
                          child: Image.asset('images/MadPink.gif'),
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
                          child:Image.asset('images/MadPurple.gif'),
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
                          child: Image.asset('images/MadOrange.gif'),
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
                          child:Image.asset('images/MadBlue.gif'),
                        ),
                      ),
                  ],
                ),
            ]
        ),
      ),
    );
  }

}
