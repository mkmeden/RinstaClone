import 'package:chatapp/auth_service.dart';
import 'package:chatapp/chat/chat_service.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final chatService = ChatService();
final authService = AuthService();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('U S E R S',
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
          ),),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        actions:[
          IconButton(
          onPressed: (){
            AuthService authService = AuthService();
            authService.signOut();
          },

          icon: Icon(Icons.logout),
        ),
    ] ,
      ),

      drawer: MyDrawer(),

      body: buildUserList(),
    );
  }
}

Widget buildUserList(){
  return StreamBuilder(
      stream: chatService.getUsersStream(),
      builder: (context , snapshot) {

        // print(snapshot.data);

        if(snapshot.hasError)
          {
            return Text('error');
          }

        if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Text('Loading');
          }

        return ListView(
        children : snapshot.data!.map<Widget>((userData) => buildUserListItem(userData,  context)).toList(),
        );
  });
}

Widget buildUserListItem(Map<String , dynamic> userData , BuildContext context){

   print(authService.auth.currentUser?.email);
if(userData['email'] != authService.auth.currentUser?.email){
  return UserTile(
    text : userData['email'],
    onTap : (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>ChatPage(recieverEmail: userData['email'], recieverID: userData['uid'],))
      );
    }
);

}

else{
  return Container();
}
}
