import 'package:flutter/material.dart';

class TitleCardComponent extends StatelessWidget {
  final String? titleCard;
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  const TitleCardComponent(
      {Key? key,
      this.text1,
      this.text2,
      required,
      this.titleCard,
      this.color1,
      this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: const Alignment(0.8, 1),
                      colors: <Color>[
                        color1!,
                        color2!,
                      ]),
                ),
                width: double.infinity,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$titleCard',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    color: Colors.white,
                  ),
                  // height: 40,
                  child: Column(children: [
                    Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: <TableRow>[
                        TableRow(children: [
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                'Kebutuhan Lahan ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 1.642 Bidang',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          const SizedBox(
                            height: 30,
                            child: Text(' '),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 116,61 Ha',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          SizedBox(
                            height: 30,
                            child: Text(
                              'Sudah Bebas',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 374  Bidang',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          const SizedBox(
                            height: 30,
                            child: Text(' '),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 24,99  Ha',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          SizedBox(
                            height: 30,
                            child: Text(
                              'Belum Bebas',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 1.268  Bidang',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          const SizedBox(
                            height: 30,
                            child: Text(' '),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 91,62  Ha',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                      ],
                    ),
                    Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: <TableRow>[
                        TableRow(children: [
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                'Progress lahan bebas (Luas)',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 21,43%',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                'Progress lahan bebas (Bidang)',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              ': 22,78%',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ]),
                      ],
                    )
                  ]))
            ],
          ),
        )),
      ],
    );
  }
}
