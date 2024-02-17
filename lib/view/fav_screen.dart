import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/data.dart';
import 'package:flutter_application_1/controller/preferences/preferences.dart';
import 'package:flutter_application_1/view/fav_list_item_screen.dart';

class FavouriteScreen extends StatelessWidget {

  bool isItemAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Items'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>
              FavouriteListItemScreen()));
            },
            child: Icon(Icons.list)),
          SizedBox(width: 20,),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0,right: 8.0),
          child: ListTile(
            tileColor: Colors.pink.shade50,
            trailing: IconButton(onPressed: (){
              Preferences.addItem(context,data[index]);
            }, 
            
            icon: Icon(Icons.favorite)),
            // icon: Icon(isItemAdded ? Icons.favorite : Icons.favorite_border,
            //   color: isItemAdded ? Colors.pink : null,),),


            subtitle: Text(data[index]["price"]),
            title: Text(data[index]["name"]),
          leading: CircleAvatar(backgroundImage: NetworkImage(data[index]["image"]),),
          ),
        );
      }),
      
    );
  }
}