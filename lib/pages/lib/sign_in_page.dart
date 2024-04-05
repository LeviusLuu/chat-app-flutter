import 'package:chat_app_v_0_2/models/models.dart';
import 'package:chat_app_v_0_2/providers/lib/user_session_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late ColorScheme colorScheme = Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCtrl = TextEditingController(text: "");
    TextEditingController passwordCtrl = TextEditingController(text: "");

    return Scaffold(
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 150, 35, 50),
          child: Column(
            children: [
              const FlutterLogo(
                size: 100,
              ),
              const SizedBox(height: 50),
              TextFieldCostum(
                controller: emailCtrl,
                hintText: "Email",
              ),
              const SizedBox(height: 10),
              TextFieldCostum(
                controller: passwordCtrl,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    side: const BorderSide(width: 0),
                  ),
                  onPressed: () async {
                    UserModel user = UserModel(
                      id: "1",
                      fullname: "Tuấn Hùng",
                      birthday: "2000-10-08",
                      phoneNumber: "0979896810",
                      gender: "Male",
                      avatar: "TH",
                      email: "levius810@gmail.com",
                    );
                    Provider.of<UserSessionProvider>(context, listen: false)
                        .initUser(user);
                    context.go("/");
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(color: colorScheme.onSecondary),
                ),
              ),
              Expanded(child: Container()),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: colorScheme.primary),
                  ),
                  onPressed: () {
                    context.go("/register");
                  },
                  child: const Text(
                    "Create new account?",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
