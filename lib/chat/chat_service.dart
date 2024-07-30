import 'package:chatapp/auth_service.dart';
import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ChatService {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final authService = AuthService();

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return firestore.collection('users').snapshots().map((snapshot) {


      return snapshot.docs.map((doc) {
        final user = doc.data();
        print(user);
        return user;
      }).toList();
    });
  }

  Future<void>sendMessage(String recieverID , String message)
  async {
    final String currentUserID = authService.auth.currentUser!.uid;
    final String? currentUserEmail = authService.auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(senderEmail: currentUserEmail, senderID: currentUserID, recieverID: recieverID, timestamp: timestamp, message: message);

    List<String>ids = [currentUserID, recieverID];
    ids.sort();
    print(ids);
    String chatroomID = ids.join('_');

    await firestore.collection('chat_rooms').doc(chatroomID).collection('messages').add(newMessage.toMap());



  }

  Stream<QuerySnapshot>getMessages(String userID ,otherUserID)
  {
    List<String> ID = [userID , otherUserID];
    ID.sort();

    String chatroomID = ID.join('_');

    return firestore.collection('chat_rooms').doc(chatroomID).collection('messages').orderBy('timestamp' , descending: false).snapshots();

  }


}