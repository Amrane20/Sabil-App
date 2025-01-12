import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabil/model/student.dart';
import 'package:sabil/screens/home_page.dart';
import 'package:sabil/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sabil/screens/student_personal_info.dart';

enum UserType { admin, student }

enum UserGender { male, female }

class UserProvider extends ChangeNotifier {
  List<Student> _students = [];
  List<Student> get students => _students;
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

  void setUserGender(UserGender gender) {
    _selectedGender = gender;
    notifyListeners();
  }

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
      print("list : $academicDetails");
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

  // Login Method
  Future<void> login(
      String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    bool loginSuccess = false;
    if (_selectedUserType == UserType.admin) {
      loginSuccess = await _adminLogin(email, password, context);
      if (loginSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const StudentPersonalInfo()),
          (Route<dynamic> route) => false,
        );
      }
    } else if (_selectedUserType == UserType.student) {
      loginSuccess = await _studentLogin(email, password, context);
      if (loginSuccess) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
        );
      }
    }


    if (!loginSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Login failed. Please try again.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Color(0xffEFE6FD),
                    fontWeight: FontWeight.w500)),
            backgroundColor: Color(0xfff16467),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16.0),
            duration: const Duration(seconds: 3)),
      );
      Navigator.of(context).pop();
    }
     
  }

  // Method to login as admin
  Future<bool> _adminLogin(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('http://192.168.43.192:5000/admin/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Admin login successful');
      return true;
      // Navigate to Admin Dashboard or Home Page after success
      // Navigator.pushReplacementNamed(context, '/admin-dashboard');
    } else {
      print('Admin login failed: ${response.body}');
      // Show error message to user
      return false;
    }
  }

  // Method to login as student (you can implement this later if needed)
  Future<bool> _studentLogin(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('http://192.168.43.192:5000/student/login');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Student logedIn successful');
      return true;
    } else {
      print('Student login failed: ${response.body}');
      // Show error message to user
      return false;
    }
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

  Future<void> get getStds async {
    http.Response response;
    try {
      response = await http.get(Uri.parse('http://192.168.43.192:5000/'));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        _students = body.map((json) => Student.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      print(e);
    }

    notifyListeners(); // Notify UI to rebuild with the updated student data
  }
}
