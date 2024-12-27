import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class AddBtn extends StatelessWidget {
  // final TextEditingController fullNameController;
  final IconData iconName;
  final Color iconColor;
  final Color backGroundColor;
  final String title;
  final Color titleColor;
  final Color borderColor;
  final VoidCallback onPressed;
  const AddBtn(
      {super.key,
      required this.iconName,
      required this.iconColor,
      required this.title,
      required this.backGroundColor,
      required this.titleColor,
      required this.borderColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        // width: double.infinity,
        height: 56.0,
        decoration: BoxDecoration(
            color: backGroundColor,
            border: Border.all(
              width: 1.0,
              color: borderColor,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: titleColor)),
            const SizedBox(
              width: 16.0,
            ),
            Icon(
              iconName,
              size: 18,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
