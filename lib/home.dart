import 'package:bolc_ex/counter/counter.dart';
import 'package:bolc_ex/counter/view/counter_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CounterPage()));

              },
              child: Text('Green'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // This is what you need!
              ),
            ), ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CounterPage()));

              },
              child: Text('Red'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // This is what you need!
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CounterPage()));

              },
              child: Text('Blue'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // This is what you need!
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CounterPage()));

              },
              child: Text('Black'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // This is what you need!
              ),
            ),
          ],
        ),
      ),
    );
  }
}
