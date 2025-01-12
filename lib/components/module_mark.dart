import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ModuleMark extends StatelessWidget {
  final TextEditingController controller;
  const ModuleMark({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 56.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: const Color(0xff290064),
              width: 1.0,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow digits only
                  LengthLimitingTextInputFormatter(2),  // two digits as a limit
                ],
                style: GoogleFonts.montserrat(
                    fontSize: 16.0, color: const Color(0xff525252)),
                controller: controller,
                textAlign: TextAlign.center,    
                decoration: InputDecoration(
                  hintText: '00',
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
      ),
    );
  }
}
