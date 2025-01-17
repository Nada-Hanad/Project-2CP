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
import 'package:somthn/Francais/F-1-4-2ndAttempt.dart';
import 'package:somthn/Francais/F-1-5.dart';
import 'package:somthn/Francais/F-1.dart';
import 'package:somthn/Francais/boxDialog1.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/myicons.dart';
import '../Services/Login.dart';
import 'BienvenueFr.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class F_1_4 extends StatefulWidget {
  const F_1_4({Key key}) : super(key: key);

  @override
  _F_1_4State createState() => _F_1_4State();
}

class _F_1_4State extends State<F_1_4> {

  AudioPlayer advancedPlayer;
  var player = AudioCache();
  var player2 = AudioPlayer ();
  @override
  initState() {
    super.initState();
    loadMusic();
  }

  Future loadMusic() async {

    advancedPlayer = await AudioCache().play("audio/frMoulin.wav");
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  bool Visible = true;
  String letterA;
  String letterM;
  String letterO;
  String letterU;
  String letterL;
  String letterI;
  String letterN;
  String drag1;
  String drag2;
  String drag3;
  String drag4;
  String drag5;
  String drag6;

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
                    image: AssetImage("images/frBG.jpg"),
                    fit: BoxFit.cover)),),
                Positioned(
                    top: size.height*0.05,
                    left:size.width*0.75,
                    child:
                    SettingsButton(onPressed: () async {
                      player2?.stop();
                        await advancedPlayer?.pause();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()));
                      print("HELL YEAH");
                    },)
                ),
                Positioned(
                    top: size.height*0.05,
                    right:size.width*0.75,
                    child: BacksButton(onPressed: ()async {
                      player2?.stop();
                      await advancedPlayer?.pause();
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return customDialog1();
                          }
                      );
                    },)
                ),
                Positioned(
                    bottom: size.height*0.88,
                    left: size.width*0.275,
                    right: size.width*0.275,
                    child: SvgPicture.asset(ThreeBars)),

                Visibility(
                  visible: !Visible,
                  child: Positioned(
                    bottom: size.height*0.88,
                    left: size.width*0.275,
                    right: size.width*0.275,
                    child: SvgPicture.asset(FourBars),
                  ),
                ),

                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.47,
                    left: size.width*0.75,
                    child: GoToButton(onPressed: () async {
                      if(advancedPlayer !=null){
                        int result = await advancedPlayer?.pause();
                      }

                      if((drag1=="assets/icons/m.svg")&&(drag2=="assets/icons/o.svg")&&(drag3=="assets/icons/u.svg")&&(drag4=="assets/icons/l.svg")&&(drag5=="assets/icons/i.svg")&&(drag6=="assets/icons/n.svg")){
                        print('correct');
                        player2 =  await player.play('audio/mathsBravo.wav');

                        scoreF.niv1+=2;
                      setState(() {
                        Visible=false;
                      });}else if ((drag1==null)&&(drag2==null)&&(drag3==null)&&(drag4==null)&&(drag5==null)&&(drag6==null)){}
                      else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_1_4_2nd()));
                      }
                      print("HELL YEAH");

                    },),
                  ),
                ),
                Positioned(
                  top: size.height*0.535,
                  left:size.width*0.1,
                  height: size.height*0.2,
                  width: size.width*0.8,

                  child: Visibility(
                      child: SvgPicture.asset("assets/icons/bigButton.svg"),
                  ),
                ),
                Positioned(
                  top: size.height*0.15,
                  left: size.width*0.2,
                  height: size.width*0.5,
                  width: size.width*0.5,
                  child:SvgPicture.asset('assets/icons/bulleDictée.svg'),
                ),
                Visibility(
                  visible: Visible,
                  child: Positioned(
                    top: size.height*0.48,
                    right: size.width*0.77,
                    child: ButtonReset(
                        onPressed: () {
                          setState(() {
                             letterA="";
                             letterM="";
                             letterO="";
                             letterU="";
                             letterL="";
                             letterI="";
                             letterN="";
                             drag1=null;
                             drag2=null;
                             drag3=null;
                             drag4=null;
                             drag5=null;
                             drag6=null;
                          });
                          print('reset');
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
                      child: ButtonContinuer(onPressed: () async{
                        player2?.stop();
                        int result = await advancedPlayer?.pause();

                        print('HADA SCORE');
                        print(scoreF.niv1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => F_1_5()));
                        print('Continuer');},)
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
                   top: size.height*0.8,
                   right: size.width*0.23,
                   child: Visibility(
                     visible: Visible,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /////////////////////
                        /// Draggable
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                              letterA = 'assets/icons/a.svg';
                          },
                          data:
                          "assets/icons/a.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterA == 'assets/icons/a.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/a.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                             Container(
                              //color: Colors.purple,
                               width: 50,
                               height: 50,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                'assets/icons/a.svg',
                                height: 50,
                                width: 50,
                              ),
                              ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                              width: 50,
                              height: 50,),


                          ),
                        SizedBox( width: size.width*0.1,),
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                            letterM = 'assets/icons/m.svg';
                          },
                          data:
                          "assets/icons/m.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterM == 'assets/icons/m.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/m.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                          Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/m.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,),
                        ),
                        SizedBox( width: size.width*0.1,),
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                            letterI = 'assets/icons/i.svg';
                          },
                          data:
                          "assets/icons/i.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterI == 'assets/icons/i.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/i.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                          Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/i.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,),
                        ),




                        ////////////////////////


                      ],
                ),
                   ),

                 ),
                Positioned(
                  top: size.height*0.9,
                  left: size.width*0.1,
                  child: Visibility(
                    visible: Visible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /////////////////////
                        /// Draggable
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                            letterO = 'assets/icons/o.svg';
                          },
                          data:
                          "assets/icons/o.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterO == 'assets/icons/o.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/o.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                          Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/o.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,),


                        ),
                        SizedBox( width: size.width*0.1,),
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                            letterN = 'assets/icons/n.svg';
                          },
                          data:
                          "assets/icons/n.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterN == 'assets/icons/n.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/n.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                          Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/n.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,),
                        ),
                        SizedBox( width: size.width*0.1,),
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                            letterU = 'assets/icons/u.svg';
                          },
                          data:
                          "assets/icons/u.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterU == 'assets/icons/u.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/u.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                          Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/u.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,),
                        ),
                        SizedBox( width: size.width*0.1,),
                        Draggable<String>(
                          onDragCompleted: (){
                            print('gfds');
                            letterL = 'assets/icons/l.svg';
                          },
                          data:
                          "assets/icons/l.svg",
                          child: Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            //color: Colors.purple,
                            child: letterL == 'assets/icons/l.svg'
                                ? Container()
                                : SvgPicture.asset(
                              'assets/icons/l.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),

                          // The widget to show under the pointer when a drag is under way
                          feedback:
                          Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/l.svg',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          childWhenDragging: Container(
                            //color: Colors.purple,
                            width: 50,
                            height: 50,),
                        ),
                        ////////////////////////
                      ],
                    ),
                  ),

                ),
                Positioned(
                  top: size.height*0.6,
                  left: size.width*0.14,
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
                            width: 50,
                            height: 50,

                            alignment: Alignment.center,
                            child: drag1 != null
                                ? SvgPicture.asset(
                              drag1,
                              height: 50,
                              width: 50,
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
                            width: 50,
                            height: 50,

                            alignment: Alignment.center,
                            child: drag2 != null
                                ? SvgPicture.asset(

                              drag2,
                              height: 50,
                              width: 50,
                            )
                                : Container(),
                          );
                        },
                      ),
                      DragTarget<String>(
                        onAccept: (value) {
                          setState(() {
                            drag3 = value;
                          });
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            width: 50,
                            height: 50,

                            alignment: Alignment.center,
                            child: drag3 != null
                                ? SvgPicture.asset(

                              drag3,
                              height: 50,
                              width: 50,
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
                            width: 50,
                            height: 50,

                            alignment: Alignment.center,
                            child: drag4 != null
                                ? SvgPicture.asset(

                              drag4,
                              height: 50,
                              width: 50,
                            )
                                : Container(),
                          );
                        },
                      ), DragTarget<String>(
                        onAccept: (value) {
                          setState(() {
                            drag5 = value;
                          });
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            width: 50,
                            height: 50,

                            alignment: Alignment.center,
                            child: drag5 != null
                                ? SvgPicture.asset(

                              drag5,
                              height: 50,
                              width: 50,
                            )
                                : Container(),
                          );
                        },
                      ),
                      DragTarget<String>(
                        onAccept: (value) {
                          setState(() {
                            drag6 = value;
                          });
                        },
                        builder: (_, candidateData, rejectedData) {
                          return Container(
                            width: 50,
                            height: 50,

                            alignment: Alignment.center,
                            child: drag6 != null
                                ? SvgPicture.asset(

                              drag6,
                              height: 50,
                              width: 50,
                            )
                                : Container(),
                          );
                        },
                      ),
                    ],
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
                )
      ]
              ),
            ),
          );
  }

}
