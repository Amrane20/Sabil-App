import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class LoginBtn extends StatelessWidget {
  String email;
  String password;
  final VoidCallback onTaped; 
  LoginBtn({super.key, required this.email, required this.password, required this.onTaped});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return InkWell(
      // onTap: () {
      //   // Signing function 
      //   if (_formKey.currentState!.validate()) {
      //     user.login(email,password);
      //   }
        
      // },
      onTap: onTaped,
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
    );
  }
}
