import 'package:home_sense/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:home_sense/ui/widgets/custom_button.dart';
import 'package:home_sense/ui/widgets/custom_password_form_field.dart';
import 'package:home_sense/ui/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
        emailController.value.text,
        passwordController.value.text,
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
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_outlined,
              size: 150,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            CustomTextFormField(
                labelText: "E-mail", controller: emailController),
            const SizedBox(height: 10),
            CustomPasswordFormField(
                labelText: "Senha", controller: passwordController),
            CustomButton(
              text: "Entrar",
              height: 100,
              onClick: signIn,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Não é cadastrado?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Criar conta.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
