import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(),
          TextFormField(),
          const SizedBox(height: 10,),
          TextFormField(),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () => null, child: const Text("Login")),
          const SizedBox(height: 10,),
          const Text("or"),
          const SizedBox(height: 10,),
          TextButton(onPressed: () => null, child: const Text("Register")),
          const SizedBox(height: 10,),
          TextButton(onPressed: () => null, child: const Text("Forgot your password?")),
          const SizedBox(height: 10,),

        ],
      ),
    );
  }
}