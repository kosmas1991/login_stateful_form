import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }


}

class LoginScreenState extends State<LoginScreen>{

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            // text fields  and button  here ...
            emailField(),
            passwordField(),
            Container(padding: EdgeInsets.only(top: 25.0),),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      validator: (value) {
        if(!value.contains('@')){
          return 'Invalid email';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText: 'kosmasgou@gmail.com',
      ),
    );
  }

  Widget passwordField(){
    return TextFormField(
      validator: (value) {
        if(value.length<5){
          return 'Invalid password';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.blueAccent,
      onPressed: () {
        formKey.currentState.validate();
      },
      child: Text('Submit'),
    );
  }

}