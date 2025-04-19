import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newapp/controllers/auth_controller.dart';
import 'package:newapp/models/user_model.dart';
import 'package:newapp/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

late TextEditingController _usernameController;
late TextEditingController _emailController;
late TextEditingController _passwordController;
late GlobalKey<FormState> _formkey;
final controller = Get.put(AuthController());
bool _isObscure = true;

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formkey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: const Color(0xFFF8F9FA),
          title: Text(
            "Log out",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 244, 244, 244),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 244, 244, 244),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(255, 244, 244, 244),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 digits long';
                      } else if (value.length > 15) {
                        return 'Password must be at most 15 digits long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          color: Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(30),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              final user =UserModel(
                                nom: _usernameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              var result = await controller.logoutController(user);
                              if (result['status'] == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result['success'])),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result['error'] ?? 'Error')),
                                );
                              }
                            }
                          },
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headlineSmall,
                              children: const <TextSpan>[
                                TextSpan(text: "Have an account? "),
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
