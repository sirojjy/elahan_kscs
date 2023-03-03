import 'package:flutter/material.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

HawkFabMenuController hawkFabMenuController = HawkFabMenuController();

Widget MenuButton1(BuildContext context) {
  return HawkFabMenu(
    icon: AnimatedIcons.menu_arrow,
    fabColor: Colors.yellow,
    iconColor: Colors.green,
    hawkFabMenuController: hawkFabMenuController,
    items: [
      HawkFabMenuItem(
        label: 'Item 1',
        ontap: () {
          // aksi saat item 1 di tekan
        },
        icon: Icon(Icons.camera_alt),
        color: Colors.red,
        labelColor: Colors.white,
      ),
      HawkFabMenuItem(
        label: 'Item 2',
        ontap: () {
          // aksi saat item 2 di tekan
        },
        icon: Icon(Icons.map),
        color: Colors.blue,
        labelColor: Colors.white,
      ),
      HawkFabMenuItem(
        label: 'Menu 2',
        ontap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Menu 2 selected')),
          );
        },
        icon: const Icon(Icons.comment),
        labelColor: Colors.white,
        labelBackgroundColor: Colors.blue,
      ),
      HawkFabMenuItem(
        label: 'Menu 3 (default)',
        ontap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Menu 3 selected')),
          );
        },
        icon: const Icon(Icons.add_a_photo),
      ),
    ],
    body: const Center(
      child: Text('Center of the screen'),
    ),
  );
}
