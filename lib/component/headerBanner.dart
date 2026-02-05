import 'dart:ui';

import 'package:flutter/material.dart';

class HeadBanner extends StatefulWidget {
  const HeadBanner({super.key});

  @override
  State<HeadBanner> createState() => _HeadBannerState();
}

class _HeadBannerState extends State<HeadBanner> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    String dropdownValue = list.first;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('icon/banner.png'), fit: BoxFit.fill)),
      child: Stack(children: [
        Positioned(
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // 设置模糊程度
                  child: Container(
                    width: 274,
                    height: 160,
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '匹配队友',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(227, 227, 227, 1)),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.5,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.1)))),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Color.fromRGBO(163, 163, 164, 1),
                                ),
                                elevation: 16,
                                underline: Container(),
                                dropdownColor: Theme.of(context).canvasColor,
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Color.fromRGBO(163, 163, 164, 1),
                                ),
                                elevation: 16,
                                underline: Container(),
                                dropdownColor: Theme.of(context).canvasColor,
                                style: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            height: 36,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                '快速匹配',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(54, 255, 255, 0.82), // 背景颜色
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(4)), // 按钮形状
                              ),
                            ))
                      ],
                    ),
                  )),
            ))
      ]),
    );
  }
}
