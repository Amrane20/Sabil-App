import 'package:sabil/model/scores.dart';

class Student {
  final int id;
  final String name;
  final String email;
  final int apogee;
  final String gender;
  final String password;
  final Score? score;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.apogee,
    required this.gender,
    required this.password,
    this.score,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      apogee: json['apogee'],
      gender: json['gender'],
      password: json['password'],
      score: json['scores'] != null ? Score.fromJson(json['scores']) : null,
    );
  }
}