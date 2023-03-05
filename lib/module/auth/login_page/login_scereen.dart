import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_auth/utils/auth_notification_provider.dart';

import '../../../utils/app_routes.dart';
import '../../../utils/navigator_key.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String? email = emailController.text;
                String? password = passwordController.text;
                if (email.isNotEmpty && password.isNotEmpty) {
                  await authenticationNotifier.login(
                      email: email, password: password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Fill the credentials")));
                }
              },
              child: const Text('Login')),
          ElevatedButton(
              onPressed: () {
                NavigatorKey.navigatorKey.currentState!
                    .pushReplacementNamed(AppRoutes.phoneLogin, arguments: 0);
              },
              child: const Text('Login with Phone')),
          TextButton(
              onPressed: () {
                NavigatorKey.navigatorKey.currentState!
                    .pushNamed(AppRoutes.signupScreen, arguments: 0);
              },
              child: const Text('Don\'t an account? Sign Up.'))
        ],
      ),
    );
  }
}
