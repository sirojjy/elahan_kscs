import 'package:elahan_kscs/dashboard/bloc/dashboard_bloc.dart';
import 'package:elahan_kscs/dashboard/component/slider_card_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SliderCard extends StatefulWidget {
  const SliderCard({Key? key}) : super(key: key);

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  final _controller = PageController(
    viewportFraction: 0.9,
    initialPage: 1,
  );

  late TabController _tabController;
  SharedPreferences? pref;

  @override
  void initState() {
    // BlocProvider.of<DashboardBloc>(context).add(OnDashboardEvent());
    getPref();
    super.initState();
  }

  Future<void> getPref() async {
    pref = await SharedPreferences.getInstance();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        BlocBuilder<DashboardBloc, DashboardState>(
          bloc:BlocProvider.of<DashboardBloc>(context)..add(OnDashboardEvent()),
          builder: (context, state) {
            return SizedBox(
              height: 150,
              child: PageView(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                controller: _controller,
                children: [
                  SliderCardComponent(
                      titleCard: 'KABUPATEN LEBAK',
                      jumlahBidang: '${state.lebak}',
                      jumlahLuas: '${state.luasLebak}',
                      jumlahNilai: '500000000',
                      color: const Color(0x0ff2da69b)),
                  SliderCardComponent(
                      titleCard: 'KABUPATEN SERANG',
                      jumlahBidang: '${state.serang}',
                      jumlahLuas: '500',
                      jumlahNilai: '500000000',
                      color: const Color(0x0ff34C5D8)),
                  SliderCardComponent(
                      titleCard: 'KABUPATEN TANGERANG',
                      jumlahBidang: '2',
                      jumlahLuas: '500',
                      jumlahNilai: '500000000',
                      color: const Color(0x0ffB3B300))
                ],
              ),
            );
          },
        )
      ],
    );
  }


}
