import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool _disable = true;

  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  bool get disable => _disable; 

  set email(String email) {
    _email = email;
    checkSignInCredentials();
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    checkSignInCredentials();
    notifyListeners();
  }

  set confirmPassword(String password) {
    _confirmPassword = password;
    checkSignInCredentials();
    notifyListeners();
  }

  checkSignInCredentials() {
    if (_email.isNotEmpty && (password.isNotEmpty && _confirmPassword.isNotEmpty && (_password == _confirmPassword))) {
      _disable = false;
    } else {
      _disable = true;
    }
    notifyListeners();
  }
}

final signUpProvider = ChangeNotifierProvider<SignUpProvider>((ref) {return SignUpProvider();});