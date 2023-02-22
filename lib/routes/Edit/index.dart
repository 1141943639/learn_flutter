import 'package:flutter/material.dart';
import 'package:learn_flutter/routes/Detail/widgets/StepItem.dart';
import 'package:learn_flutter/widgets/MyAppbar.dart';

import '../../models/Detail.dart';
import '../../widgets/FloatButton.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  List<bool> checkedArr = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)?.settings.arguments as DetailToEditArgs;

      checkedArr = List.filled(args.itemList?.length ?? 0, true).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as DetailToEditArgs;

    return Scaffold(
      appBar: MyAppbar(context, args.data?.title ?? ''),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tour Stops',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text('CANCEL'),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 140),
            child: Column(
              children: args.itemList?.asMap().entries.map(
                    (e) {
                      final isChecked =
                          checkedArr.isNotEmpty && checkedArr[e.key];

                      return Container(
                          margin: e.key != (args.itemList?.length ?? 0) - 1
                              ? EdgeInsets.only(bottom: 20)
                              : null,
                          child: StepItem(
                            onTap: () {
                              setState(() {
                                checkedArr[e.key] = !checkedArr[e.key];
                              });
                            },
                            image: e.value.image ?? '',
                            icon: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: isChecked
                                      ? Color.fromRGBO(0, 87, 151, 1)
                                      : null,
                                  borderRadius: BorderRadius.circular(100000),
                                  border: !isChecked
                                      ? Border.all(
                                          color: Color.fromRGBO(0, 87, 151, 1))
                                      : null),
                              width: 25,
                              height: 25,
                              child: isChecked
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                  : null,
                            ),
                          ));
                    },
                  ).toList() ??
                  [],
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatButton(
        text: 'Done',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
