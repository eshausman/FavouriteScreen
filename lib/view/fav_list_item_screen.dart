import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/data.dart';
import 'package:flutter_application_1/controller/preferences/preferences.dart';

class FavouriteListItemScreen extends StatefulWidget {


  @override
  State<FavouriteListItemScreen> createState() => _FavouriteListItemScreenState();
}

class _FavouriteListItemScreenState extends State<FavouriteListItemScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavourite();
  }

  getFavourite()async{
    var data = await Preferences.getItem();
    listFavourite = data;
    setState(() {
      
    });

  }

  var listFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('Favourite Items')),
        actions: [
          InkWell(
            onTap: (){},
            child: Icon(Icons.list)),
          SizedBox(width: 20,),
        ],
      ),
      body: listFavourite == null ? CircleAvatar() : ListView.builder(
        itemCount: listFavourite.length,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0,right: 8.0),
          child: ListTile(
            tileColor: Colors.pink.shade50,
            trailing: IconButton(onPressed: ()async{
             await Preferences.removeItem(index);
             await getFavourite();
            }, icon: Icon(Icons.delete, color: Colors.pink,)),
            subtitle: Text(listFavourite[index]["price"]),
            title: Text(listFavourite[index]["name"]),
          leading: CircleAvatar(backgroundImage: NetworkImage(listFavourite[index]["image"]),),
          ),
        );
      }),
      
    );
  }
}