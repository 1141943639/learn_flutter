import 'package:flutter/material.dart';
import 'package:learn_flutter/routes/Home/widgets/FeatureTours.dart';

import '../../widgets/MyAppbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _tabs = [
    'Art & culture',
    'shop & Dine',
  ];
  final double _tabLabelGap = 15;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar(context, 'Trip Planner'),
        // appBar: AppBar(),
        body: Column(
          children: [
            Container(
              color: Color(int.parse('0xFF04619a')),
              // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topLeft,
              child: TabBar(
                controller: _tabController,
                tabs: _tabs
                    .map((e) => Container(
                          padding: EdgeInsets.fromLTRB(
                              _tabLabelGap / 2, 0, _tabLabelGap / 2, 0),
                          child: Tab(
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ))
                    .toList(),
                isScrollable: true,
                padding: EdgeInsets.symmetric(horizontal: _tabLabelGap / 2),
                labelPadding: EdgeInsets.zero,
                indicatorColor: Color(int.parse('0xFF72c6d1')),
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.fromLTRB(
                    _tabLabelGap / 2, 0, _tabLabelGap / 2, 0),
              ),
            ),
            Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: List.filled(_tabs.length, '')
                        .map((e) => const FeatureTours())
                        .toList()))
          ],
        ));
  }
}
