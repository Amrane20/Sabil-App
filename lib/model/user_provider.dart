import 'package:flutter/material.dart';
import 'package:sabil/screens/login.dart';

enum UserType { admin, student }

class UserProvider extends ChangeNotifier {
  String? email;
  String? password;
  UserType? _selectedUserType;

 // this is only for the test
  void userInfo(String email, String password) {
    this.email = email;
    this.password = password;
    print(email);
    print(password);
    notifyListeners();
  }

  UserType? get selectedUserType => _selectedUserType;

    void setUserType(UserType userType, BuildContext context) {
    _selectedUserType = userType;
    notifyListeners();

    // Navigate to Login Page after selection
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void signIn(String email, String password) {
    if (_selectedUserType == UserType.admin) {
      print("sign in as an ADMIN");
      print(">>>> email : $email");
      print(">>>> password : $password");
    } else if (_selectedUserType == UserType.student) {
      print("sign in as a STUDENT");
      print(">>>> email : $email");
      print(">>>> password : $password");
    }
  }
}
