import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final bool icon;
  final String hintText;
  final bool obscureText;
  final IconData iconField;
  const MyTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.iconField = Icons.mail_outline_outlined,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0xff290064),
            width: 1.0,
          )),
      child: Row(
        children: [
          const SizedBox(
            width: 16.0,
          ),
          icon == true
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
                  child: Icon(
                    iconField,
                    color: Color(0xff525252),
                  ),
                )
              : const SizedBox.shrink(),
          // const SizedBox(
          //   width: 16.0,
          // ),
          Expanded(
            child: TextFormField(
              style: GoogleFonts.montserrat(
                  fontSize: 16.0, color: Color(0xff525252)),
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.montserrat(
                    color: const Color(0xff525252),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
