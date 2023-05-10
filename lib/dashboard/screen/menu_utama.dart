import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

List<AdminMenuItem> adminMenuItems = [
  const AdminMenuItem(
    title: 'Dashboard',
    route: '/dashboard',
    icon: Icons.dashboard,
  ),
  const AdminMenuItem(
    title: 'Inventarisasi',
    route: '/inventarisasi',
    icon: Icons.person,
  ),
  const AdminMenuItem(
    title: 'Profil',
    route: '/profil',
    icon: Icons.shopping_cart,
  ),
];
