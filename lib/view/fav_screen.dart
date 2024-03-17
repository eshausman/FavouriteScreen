import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/data.dart';
import 'package:flutter_application_1/controller/preferences/preferences.dart';
import 'package:flutter_application_1/view/fav_list_item_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreen extends StatefulWidget {

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isItemAdded = false;

  itemChecker(item){
    bool isFound = false;
    for (var i = 0; i< favData.length; i++){
      if (favData[i]["id"]== item["id"]){
      isFound=true;
      break;
    }
    }
    return isFound;
  }

  var favData;

  getItem()async{
    var list = await Preferences.getItem();
    favData = list;
    setState(() {
      
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('Items')),
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
      body: favData == null ? Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0,right: 8.0),
          child: ListTile(
            tileColor: Colors.pink.shade50,
            trailing: IconButton(onPressed: ()async{
              await Preferences.addItem(context,data[index], index);
              getItem();
            }, 
            
            icon: Icon(Icons.favorite, color:itemChecker(data[index])? Colors.pink : Colors.grey)),
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