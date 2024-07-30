import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {


  final String message ;
  final bool isCurrentUser;
  const ChatBubble({super.key , required this.message , required this.isCurrentUser});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isCurrentUser? Colors.green : Colors.grey
      ),
      child: Text(message , style: TextStyle(
        fontSize: 20,
        color: isCurrentUser?Colors.white : Colors.black
      ),),
    );
  }
}
