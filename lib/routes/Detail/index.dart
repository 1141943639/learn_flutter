import 'package:flutter/material.dart';
import 'package:learn_flutter/models/ListDataModel.dart';
import 'package:learn_flutter/routes/Detail/widgets/StepItem.dart';
import 'package:learn_flutter/widgets/FloatButton.dart';

import '../../models/Detail.dart';
import '../../widgets/DashedLine.dart';
import '../../widgets/MyAppbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<ListDataModel> itemList = [];
  List<ListDataModel> oriItemList = [];

  bool showSteps = true;
  double itemHeight = 110;
  double itemMargin = 20;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments as ListDataModel;

      setState(() {
        create() => List.filled(5, null)
            .map((e) => ListDataModel(image: args.image, checked: true))
            .toList();

        itemList = create();
        oriItemList = create();
      });
    });
  }

  get showItemList {
    return itemList
        .asMap()
        .entries
        .where((element) => element.value.checked ?? false)
        .map((e) => e.value)
        .toList()
        .asMap()
        .entries;
  }

  bool get isChange {
    if (itemList.isEmpty) return false;

    return !itemList.asMap().entries.every((element) =>
        itemList[element.key].checked == oriItemList[element.key].checked);
  }

  double get dashedHeight {
    final height = (showItemList.length * itemHeight) +
        ((showItemList.length - 1) * itemMargin) -
        itemHeight;

    return height < 0 ? 0 : height;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ListDataModel;

    return Scaffold(
      appBar: MyAppbar(context, args.title ?? ''),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 140),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 200,
                  child: Image(
                    image: AssetImage(args.image ?? ''),
                    fit: BoxFit.cover,
                  ),
                ))
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(args.title ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text('2 hours · 4 stops',
                            style: TextStyle(
                                color: Color.fromRGBO(144, 144, 144, 1))),
                      ),
                      const Text(
                          '2 hours · 4 stops 2 hours · 4 stops2 hours · 4 stops2 hours · 4 stops2 hours · 4 stops2 hours · 4 stops2 hours · 4 stops2 hours · 4 stops',
                          style: TextStyle(
                              color: Color.fromRGBO(144, 144, 144, 1)))
                    ],
                  ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tour Stops',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () async {
                      if (isChange) {
                        setState(() {
                          itemList = [...oriItemList]
                              .map((e) => ListDataModel.fromJson(e.toJson()))
                              .toList();

                          showSteps = true;
                        });
                        return;
                      }

                      final result = (await Navigator.of(context).pushNamed(
                          'edit',
                          arguments: DetailToEditArgs(
                              itemList: [...itemList]
                                  .map(
                                      (e) => ListDataModel.fromJson(e.toJson()))
                                  .toList(),
                              data: args))) as List<ListDataModel>?;

                      if (result == null) return;

                      setState(() {
                        itemList = result;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          isChange ? Icons.restart_alt : Icons.edit,
                          color: const Color.fromRGBO(0, 87, 151, 1),
                        ),
                        Text(isChange ? 'RESET' : 'Edit',
                            style: const TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: isChange
                  ? Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 2,
                                  color: const Color.fromRGBO(239, 239, 239, 1),
                                ))
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showSteps = !showSteps;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: const Color.fromRGBO(
                                            239, 239, 239, 1)),
                                    child: const Text(
                                      'Show Steps',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(137, 137, 137, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  : null,
            ),
            Stack(
              children: [
                Positioned(
                    left: 32,
                    top: itemHeight / 2,
                    child: SizedBox(
                      height: dashedHeight,
                      child: DashedLine(
                        axis: Axis.vertical,
                        color: const Color.fromRGBO(31, 87, 146, 1),
                        dashedInterval: 3,
                        dashedWeight: 1,
                        dashedWidth: 1,
                      ),
                    )),
                Positioned(
                    child: Column(
                  children: [
                    ...(showSteps
                        ? showItemList
                            .map((e) => Container(
                                  margin: e.key != showItemList.length - 1
                                      ? EdgeInsets.only(bottom: itemMargin)
                                      : null,
                                  child: StepItem(
                                      index: e.key,
                                      image: args.image ?? '',
                                      height: itemHeight),
                                ))
                            .toList()
                        : [])
                  ],
                ))
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatButton(
        text: 'Start navigation',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
