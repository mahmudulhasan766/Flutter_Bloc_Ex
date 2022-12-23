import 'package:bolc_ex/bloc/login_screen_bloc/login_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),

        children: <Widget>[
          const SizedBox(height: 50,),
          BlocBuilder<LoginScreenBloc,LoginScreenState>(
              builder: (context,state){
                if(state is SignInErrorState){
                  return Text(state.errorMessage,style: const TextStyle(color: Colors.red),);
                }else{
                  return const SizedBox();
                }

              }),
          const SizedBox(height: 50,),
           Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: emailController,
              onChanged: (value){
                BlocProvider.of<LoginScreenBloc>(context).add(SignInTextChangedEvent(emailController.text, passwordController.text));
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com'),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(15),
            //padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: passwordController,
              onChanged: (value){
                BlocProvider.of<LoginScreenBloc>(context).add(SignInTextChangedEvent(emailController.text, passwordController.text));
              },
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: (){


              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LoginScreenBloc,LoginScreenState>(
                builder: (context,state){
                  return CupertinoButton(
                    onPressed: () {
                      if(state is SignInValidState){
                        BlocProvider.of<LoginScreenBloc>(context).add(SignInSubmittedEvent(emailController.text, passwordController.text));
                      }
                      //Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    color: (state is SignInValidState)?Colors.blue:Colors.grey,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  );
                }
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text('New User? Create Account')
        ],
      ),
    );
  }
}
