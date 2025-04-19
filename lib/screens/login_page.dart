import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:newapp/controllers/auth_controller.dart';
import 'package:newapp/models/user_model.dart';
import 'package:newapp/screens/add_employeur.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formkey;
  bool _isObscure = true;

  final controller = Get.put(AuthController());
  late SharedPreferences prefs;
  String? mytoken; // ✅ Declare token as a class variable

  void initsharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formkey = GlobalKey<FormState>();
    initsharedPref();
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
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: const Color(0xFFF8F9FA),
          title: const Text(
            "Log in",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "E-mail or Username",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 244, 244, 244),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "E-mail or Username",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 20),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    validator: MultiValidator([
                      EmailValidator(errorText: 'Enter a valid email address'),
                      RequiredValidator(errorText: "Email is required")
                    ]).call,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      fillColor: const Color.fromARGB(255, 244, 244, 244),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Password",
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 20),
                      prefixIcon: const Icon(
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
                          _isObscure
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                      MinLengthValidator(8,
                          errorText: 'Password must be at least 8 digits long'),
                      MaxLengthValidator(15,
                          errorText: 'Password must be at most 15 digits long'),
                    ]).call,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          color: const Color.fromARGB(255, 76, 76, 76),
                          borderRadius: BorderRadius.circular(30),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              final user = UserModel(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              var result =
                                  await controller.loginController(user);
                              if (result['status'] == true) {
                                mytoken = result['token']; 
                                prefs.setString('token', mytoken!);
                                print("stored token: $mytoken");

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddEmployeurPage(token: mytoken!),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          result['error'] ?? 'Login error')),
                                );
                              }
                            }
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            if (mytoken != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddEmployeurPage(token: mytoken!),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Please login first to get token")),
                              );
                            }
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.headlineSmall,
                              children: const <TextSpan>[
                                TextSpan(text: "Don't have an account? "),
                                TextSpan(
                                  text: "Log out",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
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
