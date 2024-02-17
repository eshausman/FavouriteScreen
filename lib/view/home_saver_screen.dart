import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/preferences/provider/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSaverScreen extends StatefulWidget {
  @override
  State<HomeSaverScreen> createState() => _HomeSaverScreenState();
}

class _HomeSaverScreenState extends State<HomeSaverScreen> {
  // int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = context.read<CounterProvider>();
    provider.getCount();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () async {
                  var provider = context.read<CounterProvider>();
                  provider.addCount();
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () async {
                  var provider = context.read<CounterProvider>();
                  provider.removeCount();
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () async {
                  var provider = context.read<CounterProvider>();
                  provider.restoreCount();
                },
                child: Icon(Icons.restart_alt),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Consumer<CounterProvider>(
            builder: (context, Provider, child) {
              return Text(
                Provider.count.toString(),
                style: TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
              );
            }
          ),
        ],
      )),
    );
  }
}
