import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/controller/preferences/preferences.dart';

class CounterProvider extends ChangeNotifier{

int count = 0;

getCount()async{
 var data = await Preferences.getCount();
 if(data != null){
  count = data;
  notifyListeners();
 }
}

addCount(){
count = count + 1;
Preferences.setCount(count);
getCount();
}

removeCount(){
count = count - 1;
Preferences.setCount(count);
getCount();
}

restoreCount(){
count = 0;
Preferences.setCount(count);
getCount();
}

}