import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class NextBtn extends StatelessWidget {
  final TextEditingController fullNameController;
  const NextBtn({super.key, required this.fullNameController});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: InkWell(
        onTap: () {
          final fullName = fullNameController.text;
          if (fullName.isNotEmpty && user.selectedUserGender != null) {
            user.userPersonalInfo(fullName);
            print("Full Name: $fullName");
          } else {
            // throw a sncak bar 
            print("One of the Field is empty!");
          }
        },
        child: Container(
          width: double.infinity,
          height: 56.0,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Next',
                  style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffEFE6FD))),
              const SizedBox(
                width: 16.0,
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xffEFE6FD),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
