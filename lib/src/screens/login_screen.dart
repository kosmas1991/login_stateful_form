import 'package:flutter/material.dart';
import '../mixins/validateFormMixin.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }


}

class LoginScreenState extends State<LoginScreen> with ValidateFormMixin{

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            // text fields and button  here ...
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
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue;
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
      validator: validatePassword,
      onSaved: (newValue) {
        password = newValue;
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
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('Email: $email , password: $password');
        }
      },
      child: Text('Submit'),
    );
  }

}