import 'package:flutter/material.dart';
import 'package:sabil/model/student.dart';
import 'package:sabil/screens/login.dart';

enum UserType { admin, student }

enum UserGender { male, female }

class UserProvider extends ChangeNotifier {
  Student student = Student();
  String? email;
  String? password;
  String? fullName;
  UserType? _selectedUserType;
  UserGender? _selectedGender;
  String? module;
  String mark = '00';
  List<Map<String, dynamic>> academicDetails = [];
  String? selectedModule;
  final List<String> availableModules = [
    'Biology',
    'Chemistry',
    'Math',
    'history',
    'physics',
    'english',
    'geography'
  ];

  void setModule(String newModule) {
    module = newModule;
    notifyListeners();
  }

  void setMark(String newMark) {
    mark = newMark;
    notifyListeners();
  }

  void addModuleList() {
    if (module != null) {
      academicDetails.add({'module': "$module", 'mark': int.parse(mark)});
      availableModules.remove(module);
      module = null; // Reset module
      selectedModule = null; // Reset selectedModule
      print("list : ${academicDetails}");
      notifyListeners();
    }
  }

  void clearSelection() {
    selectedModule = null;
    notifyListeners();
  }

  void deleteModule(String module, int mark) {
    String temp = module;
    academicDetails.removeWhere(
        (elem) => elem['module'] == module && elem['mark'] == mark);
    availableModules.add(temp);
    notifyListeners();
  }

  // this is only for the test
  void userInfo(String email, String password) {
    this.email = email;
    this.password = password;
    notifyListeners();
  }

  UserType? get selectedUserType => _selectedUserType;
  UserGender? get selectedUserGender => _selectedGender;

  void setUserType(UserType userType, BuildContext context) {
    _selectedUserType = userType;
    notifyListeners();

    // Navigate to Login Page after selection
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void setUserGender(UserGender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

// here is the sign in page for both student and admin
  void signIn(String email, String password) {
    if (_selectedUserType == UserType.admin) {
      // fetch from data base

      print("sign in as an ADMIN");
      print(">>>> email : $email");
      print(">>>> password : $password");
    } else if (_selectedUserType == UserType.student) {
      print("sign in as a STUDENT");
      print(">>>> email : $email");
      print(">>>> password : $password");
    }
  }

  void addStudent() {}

  void userPersonalInfo(String fullName) {
    // this.fullName = fullName;
    print("User Personal Info: ");
    print(_selectedGender!.name);
    print("full Name: $fullName");
  }

  void printAcademicDetails() {
    for (var detail in academicDetails) {
      print("Module: ${detail['module']}, Mark: ${detail['mark']}");
    }
  }
}
