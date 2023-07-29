import 'package:flutter/material.dart';
import 'package:helloworld/done.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  send() {
    var formdata = _formKey.currentState;
    if (formdata!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Done();
      }));
    } else {
      print("not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value!.length < 5) {
                  return "too short";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              validator: (text) {
                if (text!.length < 5) {
                  return "too short";
                }
                return null;
              },
            ),
            TextButton(
              onPressed: send,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
