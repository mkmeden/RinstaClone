import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {

  final FirebaseAuth auth  = FirebaseAuth.instance;

  final FirebaseFirestore firestore=  FirebaseFirestore.instance;
  //sign in
  Future<UserCredential> signInwithEmailPassword( String email , String password) async{

    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      firestore.collection('users').doc(userCredential.user!.uid).set(
          {
            'uid' : userCredential.user!.uid,
            'email' : email
          }
      );



      return userCredential;
    }

    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }


  //sign up

  Future<UserCredential>signUpwithEmailPassword(String email , String password) async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      firestore.collection('users').doc(userCredential.user!.uid).set(
        {
          'uid' : userCredential.user!.uid,
          'email' : email
        }
      );


      return userCredential;
    }

    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }



  }
  //sign out

  Future<void> signOut() async{

    await auth.signOut();
}

}