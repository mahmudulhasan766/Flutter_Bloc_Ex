import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'counter/bloc/counter_bloc.dart';

import 'counter_observer.dart';
import 'home.dart';


void main() {
  // BlocOverrides.runZoned(
  //       () => runApp(const CounterApp()),
  //   blocObserver: CounterObserver(),
  // );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500),
            ),
          );
        },
      ),
      // floatingActionButton: Column(
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.symmetric(vertical: 5.0),
      //       child: FloatingActionButton(
      //         child: Icon(Icons.add),
      //         onPressed: () => context.read<CounterBloc>().add(CounterIncrementPressed()),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(vertical: 5.0),
      //       child: FloatingActionButton(
      //         child: Icon(Icons.remove),
      //         onPressed: () => context.read<CounterBloc>().add(CounterDecrementPressed()),
      //       ),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.close),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Title"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Title"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Title"),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
