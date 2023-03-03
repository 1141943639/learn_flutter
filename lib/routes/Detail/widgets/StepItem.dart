import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  late String image;
  late int? index;
  late Widget? icon;
  late GestureTapCallback? onTap = () {};
  late double height;

  StepItem(
      {Key? key,
      this.image = '',
      this.index,
      this.icon,
      this.onTap,
      this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: icon ??
                  ClipOval(
                    child: Container(
                      alignment: Alignment.center,
                      color: const Color.fromRGBO(0, 87, 151, 1),
                      width: 25,
                      height: 25,
                      child: Text(
                        ((index ?? 0) + 1).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
            ),
            Expanded(
              child: Container(
                height: height,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5, spreadRadius: 0, color: Colors.grey)
                    ],
                    color: const Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage(image), fit: BoxFit.cover)),
                        )),
                    Expanded(
                        flex: 7,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tea Ware Ex',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: const Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: '20 mains · ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              144, 144, 144, 1))),
                                  TextSpan(
                                      text: 'Open Now',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(82, 133, 111, 1)))
                                ])),
                              ),
                              const Text('Terminal 1, Non-Restricted Area',
                                  style: TextStyle(
                                      color: Color.fromRGBO(144, 144, 144, 1)))
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
