import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabil/btns/admin_btn.dart';
import 'package:sabil/btns/student_btn.dart';

class UserOptioln extends StatelessWidget {
  const UserOptioln({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Image.asset(
                  'assets/images/sabil_logo.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.50,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'We\'re thrilled to have you',
                style: GoogleFonts.poppins(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'What Type of User Are You?',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: Color(0xff4B4B4B),
                ),
              ),
              const SizedBox(
                height: 56.0,
              ),
              const Row(
                children: [
                  StudentBtn(),
                  SizedBox(
                    width: 16.0,
                  ),
                  AdminBtn(),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
