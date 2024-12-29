import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:home_sense/services/auth_service.dart';
import 'package:home_sense/ui/pages/register.dart';
import 'package:provider/provider.dart';

import '../../domain/user.dart';
import '../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void SignIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      User.username = usernameController.value.text;
      User.email = emailController.value.text;
      await authService.signInWithEmailAndPassword(
        emailController.value.text,
        passwordController.value.text
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  const SizedBox(height: 10,),
                  FadeInUp(duration: const Duration(milliseconds: 1300), child: const Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60,),
                        FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [ 
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                              )
                            ]
                          ),
                          child: Column(
                            children: [
                              CustomTextField(hintText: "Username", obscure: false, controller: usernameController),
                              CustomTextField(hintText: "Email", obscure: false, controller: emailController),
                              CustomTextField(hintText: "Password", obscure: true, controller: passwordController),
                            ],
                          ),
                        )),
                        const SizedBox(height: 40,),
                        FadeInUp(duration: const Duration(milliseconds: 1500), 
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "don't have an account? ", 
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign up",
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                              )
                            )
                          )
                        ),
                        const SizedBox(height: 40,),
                        FadeInUp(duration: const Duration(milliseconds: 1600), child: MaterialButton(
                          onPressed: () {
                            SignIn();
                          },
                          height: 50,
                          color: Colors.orange[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text("Sign in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      ],
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}