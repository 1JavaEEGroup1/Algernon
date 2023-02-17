
import 'package:algernon/configuration.dart';
import 'package:algernon/data/entity/net/sign.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefs = SharedPreferences.getInstance();

/////////////////////login////////////////////////////////
void saveUser(Data user, BuildContext context) async {
  prefs.then((value){
    value.setInt("id", user.id ?? 0);
    value.setString("email", user.email ?? "");
    value.setString("username", user.username ?? "");
  }).onError((error, stackTrace) => toast("Data Saved Error !!", context))
      .whenComplete(() => toast("Data Saved Successful !!", context));
}

Future<Data> getUser() async{
  Data user;
  user = await prefs.then((value){
    Data user = Data();
    user.id = value.getInt("id");
    user.email = value.getString("email");
    user.username = value.getString("username");
    print("${user.id} + ${user.email} + ${user.username}");
    return user;
  });
  return user;
}