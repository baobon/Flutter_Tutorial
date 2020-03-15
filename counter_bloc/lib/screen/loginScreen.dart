import 'dart:developer';

import 'package:counter_bloc/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int countTer = 5;
  String message = "";
  bool showPass = true;
  bool loginError = false;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is CounterState) {
            countTer = state.counter;
          } else if (state is ButtonPressedState) {
            message = state.message;
            loginError = state.error;
          } else if (state is ShowPassState) {
            showPass = !state.showPass;
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          // bloc: BlocProvider.of<LoginBloc>(context),
          builder: (context, state) {
            return Scaffold(
              body: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 18.0),
                    height: 150.0,
                    width: double.infinity,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Count: $countTer",
                          style: TextStyle(color: Colors.blue, fontSize: 30.0),
                        ),
                        RaisedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(CounterUp(counter: countTer));
                          },
                          child: Text("Up"),
                        ),
                        RaisedButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context)
                                .add(CounterDown(counter: countTer));
                          },
                          child: Text("Down"),
                        ),
                      ],
                    ),
                  ),

                  //
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Enter email'),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: Stack(
                            children: <Widget>[
                              TextField(
                                controller: _passController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: 'Enter Password'),
                                obscureText: showPass,
                              ),
                              Positioned(
                                width: 80.0,
                                height: 40.0,
                                right: 5,
                                top: 10,
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(ShowPassEvent(showPass: showPass));
                                  },
                                  child: Container(
                                    width: 80.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                        color: Colors.grey[400]),
                                    child: Center(
                                      child: Text(showPass ? "Hide" : "Show"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RaisedButton(
                          child: Text("Login"),
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginButtonPressedEvent(
                                    userName: _emailController.text,
                                    passWord: _passController.text));
                          },
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "$message",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: loginError ? Colors.red : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _onPressUp() {
    BlocProvider.of<LoginBloc>(context).add(CounterUp(counter: countTer));
  }

  _onPressDown() {
    BlocProvider.of<LoginBloc>(context).add(CounterDown(counter: countTer));
  }
}
