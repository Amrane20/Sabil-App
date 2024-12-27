import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabil/model/user_provider.dart';

class ModulesDropDwonList extends StatefulWidget {
  const ModulesDropDwonList({super.key});

  @override
  State<ModulesDropDwonList> createState() => _ModulesDropDwonListState();
}

class _ModulesDropDwonListState extends State<ModulesDropDwonList> {
  // List of modules
  // final List<String> modules = ['Biology', 'Chemistry', 'Math','history','physics', 'english','geography'];

  // Currently selected module
  String? selectedModule;
  @override
 Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return DropdownButtonFormField<String>(
      value: user.selectedModule,
      hint: const Text('Select Module'),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xff290064),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xff290064),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xff290064),
            width: 2.0,
          ),
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded,
          color: Color(0xff333333)),
      isExpanded: true,
      items: user.availableModules.map((module) {
        return DropdownMenuItem<String>(
          value: module,
          child: Text(module),
        );
      }).toList(),
      onChanged: (newValue) {
        user.selectedModule = newValue; // Sync with selectedModule
        user.setModule(newValue!); // Update the current module
      },
    );
  }
}
