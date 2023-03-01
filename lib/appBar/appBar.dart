import 'package:elahan_kscs/profile/profil_user.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  final String? judul;
  MyAppBar({super.key, this.judul});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: const Color(0xff1F7093),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileUser()));
              },
            ),

          )
        ],
      ),
    );
  }
}
