import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/btns/add_btn.dart';
import 'package:sabil/components/academic_details_list.dart';
import 'package:sabil/components/add_student_header.dart';
import 'package:sabil/components/module_mark.dart';
import 'package:sabil/components/modules_selector.dart';
import 'package:sabil/model/user_provider.dart';

class StudentAcademicInfo extends StatefulWidget {
  const StudentAcademicInfo({super.key});

  @override
  State<StudentAcademicInfo> createState() => _StudentAcademicInfoState();
}

class _StudentAcademicInfoState extends State<StudentAcademicInfo> {
  final TextEditingController _moduleMarkController = TextEditingController();
  final bool _isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: Text(
          'Add a Student',
          style: GoogleFonts.poppins(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: const Color(0xff333333),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderDesign(
                colorOne: Color(0xff16A085), colorTwo: Color(0xff16A085)),
            const SizedBox(
              height: 24.0,
            ),
            Image.asset(
              'assets/images/academic_data.png',
              width: 264,
              height: 176,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(width: 16.0),
                const Expanded(flex: 2, child: ModulesDropDwonList()),
                const SizedBox(width: 32.0),
                Expanded(
                  flex: 1,
                  child: ModuleMark(
                    controller: _moduleMarkController,
                  ),
                ),
                const SizedBox(width: 16.0)
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: AddBtn(
                      iconName: Icons.arrow_forward_ios_outlined,
                      iconColor: const Color(0xff2B3990),
                      title: "Done",
                      backGroundColor: Colors.transparent,
                      titleColor: const Color(0xff2B3990),
                      borderColor: const Color(0xff2B3990),
                      onPressed: () {
                        final user =
                            Provider.of<UserProvider>(context, listen: false);
                        if (user.availableModules.isEmpty) {
                          user.printAcademicDetails();
                        } else {
                          // Show error message
                          print("Error, Fill all the modules mark");
                        }
                      }),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: AddBtn(
                      iconName: Icons.check,
                      iconColor: const Color(0xffEFE6FD),
                      title: "Add",
                      backGroundColor: const Color(0xff2B3990),
                      titleColor: const Color(0xffEFE6FD),
                      borderColor: Colors.transparent,
                      onPressed: () {
                        final user =
                            Provider.of<UserProvider>(context, listen: false);
                        if (user.module != null) {
                          user.setMark(_moduleMarkController.text);
                          user.addModuleList();
                          _moduleMarkController.text = '0';
                          // setState(() {
                          //   _isContainerVisible = true;
                          // });
                        } else {
                          print("Please select the Module");
                        }
                      }),
                ),
                const SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            // the academic scores of the student
            const AcademicDetailsList()
          ],
        ),
      ),
    );
  }
}
