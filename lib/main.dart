import 'package:bloc/bloc.dart';

import 'package:bolc_ex/bloc/internet_bloc_cubit/internet_bloc_cubit.dart';
import 'package:bolc_ex/bloc/login_screen_bloc/login_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

import 'bloc/login_screen_bloc/login_screen.dart';
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
        create: (context) => LoginScreenBloc(),
        child: LoginScreen(),
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
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 8,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "Title"),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Title"),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
