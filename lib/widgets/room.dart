import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {

  final onlineUser;


  Room(this.onlineUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(itemBuilder: (BuildContext context,int index){

        if(index == 0){
          return Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _createRoomButton (),);
        }
        return Container(

          margin: EdgeInsets.all(2.0),
          height: 20.0,
          width: 20.0,
          color: Colors.red,
        );
      },
        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 4.0),
        scrollDirection: Axis.horizontal,
      itemCount:  onlineUser.length,),
    );
  }
}

class _createRoomButton  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return OutlineButton(onPressed: ()=>{print('Create Room')},
      textColor: Palette.facebookBlue,
      borderSide: BorderSide(width: 3.0,color: Colors.blueAccent),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
            child: Icon(Icons.video_call,
            size: 30,
            color: Colors.white,),
          ),
          const SizedBox(width: 4.0,),
          Text('Create\nRoom')
        ],
      ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
    color: Colors.white,);

  }
}
