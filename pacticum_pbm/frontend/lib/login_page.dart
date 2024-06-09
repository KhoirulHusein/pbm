import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/input_widget.dart';
import 'package:get/get.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                'Login Page',
                // style: GoogleFonts.poppins(
                //   fontSize: size * 0.080,
                // ),
              ),
              const SizedBox(height: 30,),
              InputWidget(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 30,),
              InputWidget(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () => {
                  Get.to(() => const RegisterPage())
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 10),
                  // style: GoogleFonts.poppins(
                  //   fontSize: size * 0.040,
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
