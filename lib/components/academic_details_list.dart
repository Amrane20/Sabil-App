import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class AcademicDetailsList extends StatelessWidget {
  const AcademicDetailsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return user.academicDetails.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: user.academicDetails.length,
                itemBuilder: (context, index) {
                  final module = user.academicDetails[index]['module'];
                  final mark = user.academicDetails[index]['mark'];
                  Color containerColor =
                      index % 2 == 0 ? const Color(0xffFEF5E7) : Colors.transparent;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: containerColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              module,
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff333333),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 32.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Score: $mark',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff333333),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_outline_rounded,
                                    color: Color(0xffFF7461),
                                  ),
                                  onPressed: () {
                                    user.deleteModule(module, mark);
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                const Icon(
                                  Icons.edit_note_rounded,
                                  color: Color(0xff333333),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  "No academic details added yet.",
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    color: const Color(0xff333333),
                  ),
                ),
              );
      },
    );
  }
}
