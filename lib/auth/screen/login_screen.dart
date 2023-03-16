import 'package:elahan_kscs/auth/bloc/auth_bloc.dart';
import 'package:elahan_kscs/custom_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../dashboard/screen/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, CustomRoutes.dashboard, (route) => false);
            }
          },
          builder: (context, state) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xFF78ffd6),
                    Color(0xFF007991),
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset('assets/images/logo_kscs.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 325,
                    // height: 470,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "E LAHAN",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Please Login to Your Account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                suffix: Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                labelText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                            controller: userNameController,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 260,
                          height: 60,
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                suffix: Icon(
                                  Icons.key,
                                  color: Colors.red,
                                ),
                                labelText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                            controller: passwordController,
                          ),
                        ),

                        // SizedBox(child: Text('ISI Status'),),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forget Password",
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(LoginEvent(
                                  username: userNameController.text,
                                  password: passwordController.text,
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF8A2387),
                                      Color(0xFFE94057),
                                      Color(0xFFF27121),
                                    ])),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // const Text("Or Login using Social Media Account",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold
                        //   ),),
                        // const SizedBox(height: 15,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     IconButton(
                        //         onPressed: (){},
                        //         icon: const Icon(FontAwesomeIcons.facebook,color: Colors.blue)
                        //     ),
                        //     IconButton(
                        //         onPressed: (){},
                        //         icon: const Icon(FontAwesomeIcons.google,color: Colors.redAccent,)
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// const users = {
//   'admin@gmail.com': '1234',
//   'hunter@gmail.com': 'hunter',
// };
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   Duration get loginTime => const Duration(milliseconds: 60);
//
//   Future<String?> _authUser(LoginData data) {
//     debugPrint('Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(data.name)) {
//         return 'User not exists';
//       }
//       if (users[data.name] != data.password) {
//         return 'Password does not match';
//       }
//       return null;
//     });
//   }
//
//   Future<String?> _signupUser(SignupData data) {
//     debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
//     return Future.delayed(loginTime).then((_) {
//       return null;
//     });
//   }
//
//   Future<String> _recoverPassword(String name) {
//     debugPrint('Name: $name');
//     return Future.delayed(loginTime).then((_) {
//       if (!users.containsKey(name)) {
//         return 'User not exists';
//       }
//       return Future.value(null);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterLogin(
//       title: 'E LAHAN',
//       logo: const AssetImage('assets/images/logo_kscs.png'),
//       onLogin: _authUser,
//       userType: LoginUserType.name,
//       // userValidator: FormFieldValidator,
//       messages: LoginMessages(
//         userHint: 'Username',
//       ),
//       // onSignup: _signupUser,
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => DashboardScreen(),
//         ));
//       },
//       onRecoverPassword: _recoverPassword,
//     );
//   }
// }
