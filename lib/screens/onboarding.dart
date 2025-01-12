import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/onboarding_img.png',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sabil ',
                          style: GoogleFonts.poppins(
                            fontSize: 40.0,
                            color: const Color(0xffF39C12),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          'Your Best',
                          style: GoogleFonts.poppins(
                            fontSize: 40.0,
                            color: const Color(0xff333333),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Orientation App',
                      style: GoogleFonts.poppins(
                        fontSize: 38.0,
                        color: const Color(0xff333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Your Personalized Guide to Academic and Career Success.',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        color: const Color(0xff4B4B4B),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 78.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 64.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Let\'s Start',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
