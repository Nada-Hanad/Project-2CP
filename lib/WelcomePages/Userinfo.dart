
import 'package:flutter/material.dart';
import 'package:somthn/Avatars/BlueAvatarIcon.dart';
import 'package:somthn/Branches/BranchIconSimple.dart';
import 'package:somthn/WelcomePages/ChooseAvatar.dart';
import 'package:somthn/WelcomePages/Entrernom.dart';
import 'package:somthn/Buttons/HomeButton.dart';
import 'package:somthn/Avatars/OrangeAvatarIcon.dart';
import 'package:somthn/Avatars/PinkAvatarIcon.dart';
import 'package:somthn/Avatars/PurpleAvatarIcon.dart';
import 'package:somthn/WelcomePages/Settings.dart';
import 'package:somthn/Buttons/buttonModifyAvatar.dart';
import 'package:somthn/Buttons/buttonModifyNom.dart';
import 'package:somthn/Buttons/buttonSuppProfile.dart';
import '../Buttons/settingsButton.dart';
import '../Buttons/BacksButton.dart';
import 'Home.dart';

class Userinfo extends StatefulWidget {


  @override
  _UserinfoState createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                Navigator.pop(
                  context,
                  );
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
            top: size.height*0.3,
            right:size.width*0.62,
              child:BranchIconSimple(),
            ),
          if (New.avatar=="Pink")
            Visibility(

              child: Positioned(
                top: size.height*0.135,
                right:size.width*0.65,
                height: size.height*0.3,
                width: size.width*0.3,
                child:PinkAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Purple")
            Visibility(

              child: Positioned(
                top: size.height*0.12,
                right:size.width*0.65,
                height: size.height*0.35,
                width: size.width*0.35,
                child:PurpleAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Orange")
            Visibility(
              child: Positioned(
                top: size.height*0.14,
                right:size.width*0.65,
                height: size.height*0.3,
                width: size.width*0.3,
                child: OrangeAvatarIcon(onPressed: null,),
              ),
            ),
          if (New.avatar=="Blue")
            Visibility(

              child: Positioned(
                top: size.height*0.135,
                right:size.width*0.65,
                height: size.height*0.3,
                width: size.width*0.3,
                child:BlueAvatarIcon(onPressed: null,),
              ),
            ),

          Positioned(
            top: size.height*0.65,
            left:size.width*0.05,
       child: Text(
    'Supprimer le compte',
           style: TextStyle(
             fontFamily: 'Skranji-Bold',
             fontSize: 24,

             color:Colors.brown[700],
           ),
          ),

          ),
Positioned(
  top:size.height*0.61,
  right:size.width*0.05,
            child:ButtonSupp(
              onPressed: (){

                print("SUPP");
                },
            ),
          ),
          Positioned(
            top: size.height*0.45,
            left:size.width*0.05,
            child: Text(
               'Changer avatar',
                      style: TextStyle(
                        fontFamily: 'Skranji-Bold',
                        fontSize: 24,

                        color:Colors.brown[700],
                      ),
                     ),


            ),
          Positioned(
            top:size.height*0.41,
            right:size.width*0.05,
            child: ButtonAvatar(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseAvatar()),);
                print("HELL YEAH");
              },
            ),
          ),
          Positioned(
            top: size.height*0.55,
            left:size.width*0.05,
         child: Text(
                      'Changer nom',
                      style: TextStyle(
                        fontFamily: 'Skranji-Bold',
                        fontSize: 24,

                        color:Colors.brown[700],
                      ),
                        ),

              ),

          Positioned(
            top:size.height*0.51,
            right:size.width*0.05,
            child: Container(

              child: ButtonModifyNom(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Entrernom()),);

                  print("HELL YEAH");
                },
              ),
            ),
          ),
],
          ),

          );

  }
}


