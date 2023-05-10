import 'package:elahan_kscs/profile/screen/profil_user.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../profile/screen/profil.dart';

class MyAppBar extends AppBar{
  final String? judul;
  MyAppBar({super.key, this.judul});
  @override

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/images/logo_kscs.png',
            scale: 1,
            // height: 10,
          ),
        ),
      ),
      title: Text(
        '$judul',
        style: const TextStyle(fontSize: 18),
      ),
      actions: [
        SizedBox(
          width: 50,
          child: IconButton(
            icon: const Icon(Icons.person),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()));
            },
          ),

        )
      ],
    );
  }
}
