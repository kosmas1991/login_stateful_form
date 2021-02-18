class ValidateFormMixin{
  String validatePassword(String value) {
    if(value.length<5){
      return 'Invalid password';
    }
    return null;
  }

  String validateEmail(String value) {
    if(!value.contains('@')){
      return 'Invalid email';
    }
    return null;
  }

}