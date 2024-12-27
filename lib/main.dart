import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabil/screens/admin_or_std.dart';
import 'package:sabil/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabil/model/user_provider.dart';
import 'package:sabil/screens/onboarding.dart';
import 'package:sabil/screens/student_academic_info.dart';
import 'package:sabil/screens/student_personal_info.dart';

// Define custom colors
const Color primaryColor = Color(0xFF2B3990); // Royal Blue
const Color secondaryColor = Color(0xFFF39C12); // Amber Gold
const Color accentColor = Color(0xFF16A085); // Emerald Teal
const Color backgroundColor = Color(0xFFF5F5F5); // Light Gray
const Color textColor = Color(0xFF333333); // Dark Gray
void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SabilApp',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: primaryColor,
          secondary: secondaryColor,
          surface: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white, // Text color on primary
          onSecondary: Colors.black, // Text color on secondary
          onSurface: Colors.black, // Text color on surfaces
          onError: Colors.white, // Text color on error
          brightness: Brightness.light,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: secondaryColor,
          foregroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: StudentAcademicInfo(),
    );
  }
}
