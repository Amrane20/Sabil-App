import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/btns/next_btn.dart';
import 'package:sabil/btns/student_gender.dart';
import 'package:sabil/components/add_student_header.dart';
import 'package:sabil/components/my_textfield.dart';
import 'package:sabil/model/user_provider.dart';

class StudentPersonalInfo extends StatefulWidget {
  const StudentPersonalInfo({super.key});

  @override
  State<StudentPersonalInfo> createState() => _StudentPersonalInfoState();
}

class _StudentPersonalInfoState extends State<StudentPersonalInfo> {
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: Text(
          'Add a Student',
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xff333333),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderDesign(
                colorOne: Color(0xff16A085), colorTwo: Color(0xff7A7A7A)),
            const SizedBox(
              height: 24.0,
            ),
            Image.asset(
              'assets/images/personal_data.png',
              width: 264,
              height: 176,
            ),
            // the Student Full Name Text Field
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 56, 16, 24),
              child: MyTextfield(
                  controller: _fullNameController,
                  hintText: "Your Name",
                  obscureText: false,
                  iconField: Icons.remove_red_eye,
                  icon: false),
            ),

            // the Student's Gender CheckBox
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  StudentGender(
                    textTitle: 'Male',
                    genderValue: 'M',
                  ),
                  SizedBox(
                    width: 64.0,
                  ),
                  StudentGender(
                    textTitle: 'Female',
                    genderValue: 'F',
                  ),
                ],
              ),
            ),
            // the Next button
            NextBtn(
              fullNameController: _fullNameController,
            ),
          ],
        ),
      ),
    );
  }
}
