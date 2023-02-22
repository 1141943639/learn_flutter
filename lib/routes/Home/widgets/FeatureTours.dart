import 'package:flutter/material.dart';
import 'package:learn_flutter/models/ListDataModel.dart';

class FeatureTours extends StatefulWidget {
  const FeatureTours({Key? key}) : super(key: key);

  @override
  State<FeatureTours> createState() => _FeatureToursState();
}

class _FeatureToursState extends State<FeatureTours> {
  final _listData = [
    ListDataModel(
      title: 'Food Story of Hong Kong',
      image: 'assets/images/tour1.png',
    ),
    ListDataModel(
      title: 'Hong Kong',
      image: 'assets/images/tour2.jpg',
    ),
    ListDataModel(
      title: 'Food Story of Hong Kong',
      image: 'assets/images/tour1.png',
    ),
    ListDataModel(
      title: 'Hong Kong',
      image: 'assets/images/tour2.jpg',
    ),
    ListDataModel(
      title: 'Food Story of Hong Kong',
      image: 'assets/images/tour1.png',
    ),
    ListDataModel(
      title: 'Hong Kong',
      image: 'assets/images/tour2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text('Feature tours',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ListView.separated(
                            itemCount: _listData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext build, int index) =>
                                InkWell(
                              child: SizedBox(
                                width: 300,
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                _listData[index].image ?? ''),
                                            fit: BoxFit.cover,
                                          )),
                                      margin: const EdgeInsets.only(bottom: 20),
                                    )),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        _listData[index].title ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed('detail',
                                    arguments: _listData[index]);
                              },
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              // 间距
                              return Container(
                                width: 10,
                              );
                            },
                          )),
                    ],
                  ))
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
