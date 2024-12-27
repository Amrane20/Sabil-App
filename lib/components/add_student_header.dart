import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDesign extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;
  const HeaderDesign({super.key, required this.colorOne, required this.colorTwo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24.0),
      width: double.infinity,
      height: 72.0,
      color: const Color(0xffE8F6F3),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: colorOne,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Text(
                      '1',
                      style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffEFE6FD)),
                    ))),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Personal',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: colorOne,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            flex: 1,
            child: Divider(
              color: colorTwo,
              thickness: 0.5,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: colorTwo,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Text(
                      '2',
                      style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffEFE6FD)),
                    ))),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'Academic',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: colorTwo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
