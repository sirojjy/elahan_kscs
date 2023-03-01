import 'package:elahan_kscs/appBar/appBar.dart';
import 'package:elahan_kscs/dashboard/screen/klasifikasi_jenis_tanah.dart';
import 'package:elahan_kscs/dashboard/screen/progres_tanah.dart';
import 'package:elahan_kscs/dashboard/screen/kabupaten.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        judul: 'Dashboard',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(height: 10,),

              SliderCard(),
              SizedBox(height: 10,),

              ProgresTanahAll(),
              SizedBox(height: 10,),

              KlasifikasiJenisTanah(),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
