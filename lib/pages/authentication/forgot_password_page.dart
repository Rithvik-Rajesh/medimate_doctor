import 'package:doctor_app/components/button.dart';
import 'package:doctor_app/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _email = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email.text.trim());
      errorMessage("Password Reset Link sent Successfully! Check Your Inbox");
    } on FirebaseAuthException catch (e) {
      errorMessage(e.message.toString());
    }
  }

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: 450,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.lock,
              size: 90,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Enter Your Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "We will sent you a Password Reset Link.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              hintText: "Email Address",
              obscureText: false,
              controller: _email,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onTap: passwordReset, text: "Reset Password")
          ]),
        ),
      ),
    );
  }
}
