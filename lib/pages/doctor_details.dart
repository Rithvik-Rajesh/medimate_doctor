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
  TextEditingController experienceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();

  // Function to add user information to Firestore
  Future<void> addUserToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('doctors').add({
        'name': nameController.text,
        'dob': dobController.text,
        'aboutme': aboutMeController.text,
        'qualification': qualificationController.text,
        'field': specialityController.text,
        'contactNumber': int.parse(contactNumberController.text) ,
        'email': emailController.text,
        'Experience': int.parse(experienceController.text),
        'city': cityController.text,
        'hospital': hospitalController.text,
        'rating': 0,
        'patient_count':0
      });

      // Clear text field controllers after adding to Firestore
      nameController.clear();
      dobController.clear();
      aboutMeController.clear();
      qualificationController.clear();
      specialityController.clear();
      contactNumberController.clear();
      emailController.clear();
      experienceController.clear();
      cityController.clear();
      hospitalController.clear();

      // Show a success message or navigate to the next screen
      // You can customize this part based on your requirements
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
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
        title: const Text('Doctor Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:30,left: 30,right: 30),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  cursorColor: Colors.white,
                  controller: nameController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Name'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: dobController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Date of Birth'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: aboutMeController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'About Me'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: qualificationController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Qualification'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: specialityController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Speciality'),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: contactNumberController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Contact Number'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Email ID'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: hospitalController,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Hospital'),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller: cityController,
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'City'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                    controller: experienceController,
                    decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelText: 'Experience'),
                    keyboardType: TextInputType.number),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: const ButtonStyle(alignment: Alignment.center),
                  onPressed: addUserToFirestore,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
