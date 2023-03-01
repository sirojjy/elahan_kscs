import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: MyAppBar(
        judul: 'Profil User',
      ),
      body: Column(),
    )
    );
  }
}
