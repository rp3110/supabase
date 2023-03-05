import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import '../../../utils/app_routes.dart';
import '../../../utils/auth_notification_provider.dart';
import '../../../utils/navigator_key.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  @override
  void initState() {
    initUniLinks();
    super.initState();
  }

  /// A controller for the text field.
  TextEditingController passwordController = TextEditingController();

  /// A controller for the text field.
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///Notifier
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);

    /// It prints the link of the current page.
    void getLink() {
      uriLinkStream.listen((Uri? uri) {
        if (!mounted) return;
        log('got uri: ${uri!}');
        var re = RegExp(r'(?<=provider_token=)(.*)(?=&refresh_token)');
        var match = re.firstMatch(uri.toString());
        if (match != null) {
          String? token = match.group(0);
          debugPrint('token------------$token');
          NavigatorKey.navigatorKey.currentState!.pushNamed("/homeScreen");
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    await authenticationNotifier.signup(
                        email: email, password: password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fill the credentials")));
                  }
                },
                child: const Text('Signup')),
            ElevatedButton(
                onPressed: () async {
                  authenticationNotifier.githubLogin().then((value) {
                    getLink();
                  });
                },
                child: const Text('Github Login')),
            ElevatedButton(
                onPressed: () async {
                  authenticationNotifier.facebookLogin().then((value) {
                    getLink();
                  });
                },
                child: const Text('Facebook Login')),
            ElevatedButton(
                onPressed: () {
                  NavigatorKey.navigatorKey.currentState!
                      .pushNamed(AppRoutes.phoneLogin, arguments: 0);
                },
                child: const Text('Login with Phone')),
            TextButton(
                onPressed: () {
                  NavigatorKey.navigatorKey.currentState!.pushNamed(
                    AppRoutes.loginScreen,
                  );
                },
                child: const Text('Already have an account? Login.'))
          ],
        ),
      ),
    );
  }
}

/// It's a function that initializes the UniLinks package
Future<void> initUniLinks() async {
  try {
    final initialLink = await getInitialLink();
    debugPrint("initialLink--------------$initialLink");
  } on PlatformException catch (e) {
    debugPrint("error---------------$e");
  }
}
