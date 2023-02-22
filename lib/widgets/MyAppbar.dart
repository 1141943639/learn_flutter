import 'dart:io';

import 'package:flutter/material.dart';

class MyAppbar extends AppBar {
  MyAppbar(BuildContext context, String titleName, {super.key})
      : super(
            title: Text(titleName),
            centerTitle: true,
            leading: IconButton(
                icon: Navigator.of(context).canPop()
                    ? const Icon(Icons.arrow_back)
                    : const Icon(Icons.close),
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                    return;
                  }

                  exit(0);
                }),
            actions: Navigator.of(context).canPop()
                ? [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.location_on))
                  ]
                : null,
            backgroundColor: Color(int.parse('0xFF04619a')),
            elevation: 0);
}
