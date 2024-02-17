import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String count = "count";

  static String favouriteKey = "favouriteKey";

  static getCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getInt(count);
    return data;
  }

  static setCount(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(count, value);
  }






  static addItem(context,Map item)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var list = await getItem();
    bool isFound = false;
    for (var i = 0; i< list.length; i++){
      if (list[i]["id"]== item["id"]){
      isFound=true;
      break;
    }
    }

    if(isFound){
      const snackBar = SnackBar(content: Text("Already Added"),
      backgroundColor: Color.fromARGB(255, 255, 149, 184),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  
    }
    else{
    list.add(item);
    pref.setString(favouriteKey, jsonEncode(list));
    const snackBar = SnackBar(content: Text("Item Added"),
    backgroundColor: Colors.pink);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    
  }

  static getItem()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString(favouriteKey);
    if(data != null){
      var actualData = jsonDecode(data);
      return actualData;
    }
    else{
      return [];
    }
  }
}
