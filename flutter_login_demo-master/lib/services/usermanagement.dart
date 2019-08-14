import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserManagement{
  storeNewUser(user, name, mobile, address, context){

    DocumentReference ds =
    Firestore.instance.collection('/users').document(user.uid);
    Map<String, dynamic> rdata = {
      'name':name,
      'mobile':mobile,
      'email': user.email,
      'uid': user.uid,
      'address':address,
      'role':'user',
      'photourl': user.photoUrl,
    };
    ds.setData(rdata).whenComplete(() {
      print("Registration Successful");
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    });
    ds.setData(rdata).catchError((e){
      print(e);
    });
   /* Firestore.instance.collection('/users')
        .add({
      'name':name,
      'mobile':mobile,
      'email': user.email,
      'uid': user.uid,
      'address':address,
      'photourl': user.photoUrl,
      'role':'user',
    })
        .then((value){
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed('/homepage');
    })
        .catchError((e){
          print(e);
    });*/
  }
}