import 'package:chatapp/auth_service.dart';
import 'package:chatapp/chat/chat_service.dart';
import 'package:chatapp/components/my_textbox.dart';
import 'package:chatapp/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  final String recieverEmail;
  final String recieverID;

   ChatPage({super.key , required this.recieverEmail , required this.recieverID});


  final authService  = AuthService();
  final charService = ChatService();

  static final textController = TextEditingController();

  void sendMessage() async
  {
    if(textController.text.isNotEmpty)
      {
        await chatService.sendMessage(recieverID, textController.text);
      }

    textController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(recieverEmail,style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageBody()),
          Row(
            children: [
              Expanded(child: MyTextField(hintText: 'Send Message', obscureText: false, controller: textController)),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle
                  ),

                  child: IconButton(onPressed: (){
                    sendMessage();
                  }, icon: Icon(Icons.arrow_upward_sharp ,
                  color: Colors.white,
                  )),
                ),
              )
            ],
          )
        ],
      )
    );
  }

  Widget buildMessageBody()
  {
    String userID = authService.auth.currentUser!.uid;

    return StreamBuilder(
      stream: chatService.getMessages(userID, recieverID),
      builder: (context , snapshot){
        if(snapshot.hasError){
          return Text('Error');
        }

        if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Text('Loading');
          }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((doc) =>buildMessageItem(doc)).toList(),
        );
      },
    );

  }

  Widget buildMessageItem(DocumentSnapshot doc)
  {
      Map<String, dynamic> data = doc.data() as Map<String , dynamic>;

      bool isCurrentUser = data['senderID']==authService.auth.currentUser!.uid ;

      return Container(
          alignment: isCurrentUser? Alignment.centerRight:Alignment.centerLeft,
          child: ChatBubble(message: data['message'], isCurrentUser: isCurrentUser,)
      );
  }

  Widget buildUserInput()
  {
    return Row(
      children: [
        MyTextField(hintText: 'Send message', obscureText: false, controller: textController),

        IconButton(onPressed: (){
          sendMessage();
        }, icon: Icon(Icons.arrow_upward_sharp))
      ],
    );
  }
}

