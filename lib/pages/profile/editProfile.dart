import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController designationController =
      TextEditingController(text: 'Software Developer');
  final TextEditingController employeeIdController =
      TextEditingController(text: 'E20028');
  final TextEditingController departmentController =
      TextEditingController(text: 'Technology Solutions');
  final TextEditingController mobileController =
      TextEditingController(text: '09876543234');
  final TextEditingController emailController =
      TextEditingController(text: 'test@gmail.com');
  final TextEditingController shiftController =
      TextEditingController(text: 'TGeneral');
  final TextEditingController locationController =
      TextEditingController(text: 'Pune');
  final TextEditingController addedByController =
      TextEditingController(text: 'John Smith');
  final TextEditingController addedTimeController =
      TextEditingController(text: '2024-11-11 10:00 AM');
  final TextEditingController firstNameController =
      TextEditingController(text: 'Jane');
  final TextEditingController linkedInController =
      TextEditingController(text: 'https://www.linkedin.com/in/janedoe');
  final TextEditingController timeZoneController =
      TextEditingController(text: 'GMT+5:30');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: designationController,
              decoration: InputDecoration(labelText: 'Designation'),
            ),
            TextField(
              controller: employeeIdController,
              decoration: InputDecoration(labelText: 'Employee ID'),
            ),
            TextField(
              controller: departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email ID'),
            ),
            TextField(
              controller: shiftController,
              decoration: InputDecoration(labelText: 'Shift'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            Text(
              'Basic Info',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: employeeIdController,
              decoration: InputDecoration(labelText: 'Employee ID'),
            ),

            TextField(
              controller: addedByController,
              decoration: InputDecoration(labelText: 'Added By'),
            ),
            TextField(
              controller: addedTimeController,
              decoration: InputDecoration(labelText: 'Added Time'),
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email ID'),
            ),
            TextField(
              controller: linkedInController,
              decoration: InputDecoration(labelText: 'LinkedIn'),
            ),
            TextField(
              controller: timeZoneController,
              decoration: InputDecoration(labelText: 'Time Zone'),
            ),

            // Add more text fields for other details...
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to save the edited details
                // This could involve calling an API or updating state
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
