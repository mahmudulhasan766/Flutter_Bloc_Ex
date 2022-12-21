import 'package:bloc/bloc.dart';

import 'package:bolc_ex/bloc/internet_bloc_cubit/internet_bloc_cubit.dart';
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
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => InternetBlocCubit(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<InternetBlocCubit,InternetBlocState>(
          builder: (context, connection) {
            if(connection is InternetGanState){
              return const Text("Connected");
            } else if(connection is InternetLossState){
             return const Text("No Connection");
            } else{
              return const Text("Loading...");
            }
          },
          listener: (context,state){
            if(state is InternetGanState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:  Text("Internet Connected")
              ));
            }else if(state is InternetLossState){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:  Text("No Internet Connected")
              ));
            }
          }
      ),
      // BlocBuilder<InternetBloc, InternetState>(
      //   builder: (context, connection) {
      //     if(connection is InternetGainedState){
      //       return const Text("Connected");
      //     } else if(connection is InternetLostState){
      //      return const Text("No Connection");
      //     } else{
      //       return const Text("Loading...");
      //     }
      //   },
      // ),
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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.close),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 8,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Title"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Title"),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
