import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Function to add user information to Firestore
  Future<void> addUserToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('doctors').add({
        'name': nameController.text,
        'dob': dobController.text,
        'aboutMe': aboutMeController.text,
        'qualification': qualificationController.text,
        'speciality': specialityController.text,
        'contactNumber': contactNumberController.text,
        'email': emailController.text,
      });

      // Clear text field controllers after adding to Firestore
      nameController.clear();
      dobController.clear();
      aboutMeController.clear();
      qualificationController.clear();
      specialityController.clear();
      contactNumberController.clear();
      emailController.clear();

      // Show a success message or navigate to the next screen
      // You can customize this part based on your requirements
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User information added successfully'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding user to Firestore: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        title: Text('Doctor Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                cursorColor: Colors.white,
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: aboutMeController,
                decoration: InputDecoration(labelText: 'About Me'),
              ),
              TextField(
                controller: qualificationController,
                decoration: InputDecoration(labelText: 'Qualification'),
              ),
              TextField(
                controller: specialityController,
                decoration: InputDecoration(labelText: 'Speciality'),
              ),
              TextField(
                controller: contactNumberController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email ID'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addUserToFirestore,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
