import 'package:elahan_kscs/auth/bloc/auth_bloc.dart';
import 'package:elahan_kscs/auth/screen/login_screen.dart';
import 'package:elahan_kscs/custom_routes.dart';
import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:elahan_kscs/dashboard/screen/dashboard_screen.dart';
import 'package:elahan_kscs/menu/inventarisasi/screen/detail_inven.dart';
import 'package:elahan_kscs/menu/inventarisasi/screen/inventarisasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (BuildContext context) => AuthBloc()),
      BlocProvider(create: (BuildContext context) => DashboardBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Lahan KSCS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
        )
      ),
      home: LoginScreen(),
      routes: {
        CustomRoutes.dashboard : (context) => DashboardScreen(),
        CustomRoutes.inventarisasi : (context) => Inventarisasi(),
        CustomRoutes.detailInventarisasi : (context) => DetailInventarisasi(),
      },
    );
  }
}
