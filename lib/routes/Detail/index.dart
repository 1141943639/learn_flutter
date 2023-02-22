import 'package:flutter/material.dart';
import 'package:learn_flutter/models/ListDataModel.dart';
import 'package:learn_flutter/routes/Detail/widgets/StepItem.dart';
import 'package:learn_flutter/widgets/FloatButton.dart';

import '../../models/Detail.dart';
import '../../widgets/MyAppbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<ListDataModel> itemList = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments as ListDataModel;

      setState(() {
        itemList = List.filled(5, ListDataModel(image: args.image));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ListDataModel;

    return Scaffold(
      appBar: MyAppbar(context, args.title ?? ''),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 140),
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
              margin: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tour Stops',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () async {
                      final result = await Navigator.of(context).pushNamed(
                          'edit',
                          arguments:
                              DetailToEditArgs(itemList: itemList, data: args));

                      if (result == null) return;

                      print(result);
                    },
                    child: Column(
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Color.fromRGBO(0, 87, 151, 1),
                        ),
                        Text('Edit',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
            ...itemList
                .asMap()
                .entries
                .map((e) => Container(
                      margin: e.key != 4 ? EdgeInsets.only(bottom: 20) : null,
                      child: StepItem(
                        index: e.key,
                        image: args.image ?? '',
                      ),
                    ))
                .toList()
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
