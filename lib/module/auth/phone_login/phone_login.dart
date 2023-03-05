import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/auth_notification_provider.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  /// A controller for the text field.
  TextEditingController phoneController = TextEditingController();

  /// A controller for the text field.
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp Verification"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              hintText: "Enter the phone number",
            ),
          ),
          TextFormField(
            controller: otpController,
            decoration: const InputDecoration(
              hintText: "Enter the Otp",
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String? phone = "91${phoneController.text}";
                await authenticationNotifier.sendOtp(phone: phone);
              },
              child: const Text('Send OTP')),
          ElevatedButton(
              onPressed: () async {
                String? token = otpController.text;
                String? phone = "91${phoneController.text}";
                authenticationNotifier.verifyOtp(phone: phone, token: token);
              },
              child: const Text('Verify OTP')),
        ],
      ),
    );
  }
}
