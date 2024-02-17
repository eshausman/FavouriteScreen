import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  File? selectedImage;
  List<XFile>? selectedMultipleImages;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () async {
                  var img = ImagePicker(); //instance
                  List<XFile>? images =  // list of XFile
                      await img.pickMultiImage();
                  if (images != null) {
                    selectedMultipleImages = images;
                    // selectedImage = File(image.path);
                    setState(() {});
                  }
                },
                child: Icon(Icons.camera_alt),
              ),
              // SizedBox(height: 50,),
             Expanded(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 if (selectedMultipleImages != null) 
               if(kIsWeb)
               for(var image in selectedMultipleImages!)
                Image.network(image!.path, height:400, width: 400, fit: BoxFit.cover,)
                else
                for(var image in selectedMultipleImages!)
                Image.file(File(image.path))
               ],),
             )
            ],
          ),
        ),
      ),
    );
  }
}
