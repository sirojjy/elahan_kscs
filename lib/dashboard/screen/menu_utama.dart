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
    icon: Icons.format_list_bulleted,
  ),
  const AdminMenuItem(
    title: 'Profil',
    route: '/profil',
    icon: Icons.person,
  ),
];
