import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the fetching of student data when the screen is built
    // We can call the getStds method here to ensure it's fetched when the screen is first loaded
    Provider.of<UserProvider>(context, listen: false).getStds;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
              // Trigger the fetch and wait for it to complete
              await Provider.of<UserProvider>(context, listen: false).getStds;
            },
            child: Text(
              'Test',
              style: GoogleFonts.poppins(fontSize: 24.0),
            ),
          ),
          Consumer<UserProvider>(
            builder: (context, studentProvider, child) {
              // Check if the students data is being fetched or is empty
              if (studentProvider.students.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              // Display student list when data is fetched
              return Expanded(
                child: ListView.builder(
                  itemCount: studentProvider.students.length,
                  itemBuilder: (context, index) {
                    final student = studentProvider.students[index];
                    return ListTile(
                      title: Text(student.name ?? 'none'),
                      subtitle: Text(student.email ?? 'none'),
                      trailing: Text('Absences: $student'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
