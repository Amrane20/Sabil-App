import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  // final bool obscureText;
  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    // required this.obscureText,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isEyeIcon = true; // Tracks if the current icon is the eye icon
  bool isObscured = true; // Tracks if the text is obscured

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
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 48.0,
          ),
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Cannot be empty';
                }
                return null;
              },
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: const Color(0xff525252),
              ),
              controller: widget.controller,
              obscureText: isObscured, // Use the state to control visibility
              decoration: InputDecoration(
                errorStyle: GoogleFonts.poppins(color: const Color(0xfff16467)),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.montserrat(
                  color: const Color(0xff525252),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEyeIcon = !isEyeIcon; // Toggle the icon
                  isObscured = !isObscured; // Toggle text visibility
                });
              },
              child: Icon(
                isEyeIcon
                    ? Icons.remove_red_eye_outlined // Eye icon
                    : Icons.visibility_off_outlined, // Alternate icon
                color: const Color(0xff525252),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
