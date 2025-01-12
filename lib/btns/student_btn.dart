import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class StudentBtn extends StatelessWidget {
  const StudentBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Expanded(
      child: InkWell(
        // 
        onTap: () {
          user.setUserType(UserType.student,context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 56.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Student',
                  style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffEFE6FD))),
            ],
          ),
        ),
      ),
    );
  }
}
