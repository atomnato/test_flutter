import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'domain/state/home_state.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> HomeState();


}
class HomeState extends State<Home>{

  final FormStore store = FormStore();

  @override
  void initState() {
    super.initState();
    store.setupValidations();
  }
  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Login Form'),
    ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Observer(
                builder: (_)=> TextField(
                  onChanged: (value) => store.name = value,
                  decoration: (InputDecoration(
                    labelText: 'User Name',
                    hintText: 'Pick a username',
                    errorText: store.error.username,
                  )),
                ),
              ),
              Observer(
                  builder: (_) => AnimatedOpacity(
                      child: const LinearProgressIndicator(),
                      duration: const Duration(milliseconds: 300),
                      opacity: store.isUserCheckPending ? 1 : 0)),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.email = value,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      errorText: store.error.email),
                ),
              ),
              Observer(
                builder: (_) => TextField(
                  onChanged: (value) => store.password = value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Set a password',
                      errorText: store.error.password),
                ),
              ),
              ElevatedButton(
                child: const Text('Sign up'),
                onPressed: store.validateAll,
              )
            ],
          ),
        ),
      ),
  );
}
}