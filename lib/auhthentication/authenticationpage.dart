import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



FirebaseAuth auth = FirebaseAuth.instance;

//Future<User?> signInWithGoogle() async{
  // final GoogleSignInAccount? googleUser = await GoogleSignIn().initialize();
  // final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  // final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken,idToken: googleAuth.idToken);

  // var user = await FirebaseAuth.instance.signInWithCredential(credential);
  // User? myuser = user.user;
  // return myuser;

//}

Future<User?> loginuser(String email,String password)async{
  UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  return Future(() => user);
}

Future<User?> signupUser(String email,String name, String password)async{
  UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

  User? user =userCredential.user;

  if(user != null){
    await sendDataToFirebaseDatabase(name, password, email, user.uid);
  }
  return Future(() => userCredential.user);


}

Future<void> sendDataToFirebaseDatabase(String name,String password,String email,String uid)async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection('user').doc(uid).set({'user_name':name,'user_email':email,'uid':uid,'user_password':password});

}