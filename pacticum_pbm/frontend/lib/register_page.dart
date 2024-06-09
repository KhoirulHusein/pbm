import 'package:flutter/material.dart';
import 'package:frontend/login_page.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'input_widget.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
	  // ignore: unused_local_variable
	  var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
              'Register Page',
              // style: GoogleFonts.poppins(fontSize: size * 0.080),
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: 'Name',
                obscureText: false,
                controller: _nameController,
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: 'Username',
                obscureText: false,
                controller: _usernameController,
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 30),
              InputWidget(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () => {Get.to(() => const LoginPage())},
                child: const Text(
                  'Register',
                  // style: GoogleFonts.poppins(
                  //   fontSize: size * 0.040,
                  // ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      )
    );
  }
}