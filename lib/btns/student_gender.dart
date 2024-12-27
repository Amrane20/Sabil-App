import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class StudentGender extends StatelessWidget {
  final genderValue;
  final String textTitle;
  const StudentGender({
    super.key,
    required this.genderValue,
    required this.textTitle,
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    // checks if the current button matches the selected gender
    bool isSelected = (user.selectedUserGender ==
        (genderValue == 'M' ? UserGender.male : UserGender.female));
    return Expanded(
      child: InkWell(
        onTap: () {
          if (genderValue == 'M') {
            user.setUserGender(UserGender.male);
          } else if (genderValue == 'F') {
            user.setUserGender(UserGender.female);
          }
        },
        child: Container(
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
              color: isSelected ? const Color(0xffE8F6F3) : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color:
                    isSelected ? Colors.transparent : const Color(0xff290064),
                width: 1.0,
              )),
          child: Row(
            children: [
              const SizedBox(
                width: 16.0,
              ),
              Icon(
                isSelected
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank_rounded,
                color: isSelected
                    ? const Color(0xff7A7A7A)
                    : const Color(0xff7A7A7A),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                textTitle,
                style: GoogleFonts.poppins(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? const Color(0xff7A7A7A)
                      : const Color(0xff525252),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
