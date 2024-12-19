import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class LoginBtn extends StatelessWidget {
  String email;
  String password;
  LoginBtn({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return InkWell(
      onTap: () {
        // userInfo gets the user login and store them in the userprovider
        // user.userInfo(email, password);
        user.signIn(email, password);
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
            Text('Log In',
                style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffEFE6FD))),
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
    );
  }
}
