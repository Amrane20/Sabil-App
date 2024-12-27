import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabil/btns/login_btn.dart';
import 'package:sabil/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Declare a GlobalKey to identify the Form and manage validation
  final _formKey = GlobalKey<FormState>();
  // 2. Declare controllers for TextFormFields to manage user input
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login_img.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.40,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8.0),
              Text(
                textAlign: TextAlign.center,
                'Welcome Back!',
                style: GoogleFonts.poppins(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff333333),
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Please enter your details',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  color: const Color(0xff4B4B4B),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 40, 16, 0),
                  child: Column(
                    children: [
                      MyTextfield(
                        controller: _emailController,
                        hintText: 'example@taalim.ma',
                        obscureText: false,
                        iconField: Icons.mail,
                        icon: true,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      MyTextfield(
                        controller: _passwordController,
                        hintText: '**************',
                        obscureText: true,
                        iconField: Icons.remove_red_eye,
                        icon: true,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password?',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      // sending the email & password input values to the Login Button
                      LoginBtn(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        children: [
                          const Expanded(
                              child: Divider(
                            color: Color(0xffCEB0FA),
                            thickness: 0.5,
                          )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Or',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Expanded(
                              child: Divider(
                            color: Color(0xffCEB0FA),
                            thickness: 0.5,
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 56.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color(0xff290064),
                          width: 1.0,
                        )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              width: 16.0,
                              height: 16.0,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Text('Login with Google',
                                style: GoogleFonts.poppins(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff333333))),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
