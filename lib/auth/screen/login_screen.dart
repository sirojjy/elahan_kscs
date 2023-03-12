import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../../dashboard/screen/dashboard_screen.dart';

const users = {
  'admin@gmail.com': '1234',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 60);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return Future.value(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'E LAHAN',
      logo: const AssetImage('assets/images/logo_kscs.png'),
      onLogin: _authUser,
      userType: LoginUserType.name,
      // userValidator: FormFieldValidator,
      messages: LoginMessages(
        userHint: 'Username',
      ),
      // onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}