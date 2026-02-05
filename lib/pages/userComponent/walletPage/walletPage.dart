import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application/component/test_echarts.dart';
import 'package:flutter_application/store/getX.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  MyReducer reducer = Get.put(MyReducer());
  final currencyData = Get.find<MyReducer>().currencyList;
  late String nowId = '1';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const moneyTextStyle =
        TextStyle(fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1));
    const rowListText = TextStyle(
        fontSize: 10,
        color: Color.fromRGBO(153, 153, 153, 1),
        fontWeight: FontWeight.w400);
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: const Center(
          child: Text(
            'My Wallet',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(51, 51, 51, 1),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.restart_alt_rounded,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              // 在这里添加右侧按钮的点击事件
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 17),
              padding: const EdgeInsets.only(
                  top: 16, left: 20, right: 20, bottom: 14),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 176,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.only(
                        top: 15, left: 16, bottom: 20, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.5,
                          color: Color.fromRGBO(229, 232, 255, 1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromRGBO(248, 251, 255, 1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'My Wallet',
                                style: TextStyle(
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    width: 95,
                                    height: 95,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        border: Border.all(
                                            width: 0.5,
                                            color: const Color.fromRGBO(
                                                234, 234, 234, 1))),
                                    child: testEcharts(),
                                  ),
                                  Positioned(
                                      child: Container(
                                    width: 60,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        border: Border.all(
                                            width: 0.5,
                                            color: const Color.fromRGBO(
                                                234, 234, 234, 1))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'icon/BTC.png',
                                          width: 14,
                                          height: 14,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text(
                                          '100%',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  51, 51, 51, 1)),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(bottom: 18),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'icon/BTC.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              'USDT(ERC20)',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      153, 153, 153, 1)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        const Center(
                                            child: Text(
                                          '12345',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  51, 51, 51, 1)),
                                        ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'icon/BTC.png',
                                              width: 16,
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text(
                                              'USDT(ERC20)',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      153, 153, 153, 1)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        const Center(
                                            child: Text(
                                          '66666',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  51, 51, 51, 1)),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'icon/Deposit.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Wallet',
                                  style: rowListText,
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'icon/Deposit.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Withdraw',
                                  style: rowListText,
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'icon/Deposit.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Address',
                                  style: rowListText,
                                )
                              ]),
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'icon/Deposit.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Exchang',
                                  style: rowListText,
                                )
                              ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(253, 253, 253, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/user/wallet/details');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'My wallet',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            Icon(
                              Icons.mode_edit_outline,
                              color: Colors.black,
                              size: 20,
                            )
                          ],
                        ),
                      )),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        for (var item in currencyData)
                          Container(
                            width: double.infinity,
                            height: 64,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Color.fromRGBO(
                                                247, 247, 247, 1)),
                                        child: Center(
                                          child: Image.asset(
                                            "${item['icon']}",
                                            width: 15,
                                            height: 15,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${item['name']}",
                                            style: moneyTextStyle,
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            "${item['count']}",
                                            style: moneyTextStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 28,
                                  height: 16,
                                  child: Switch(
                                    activeColor: Colors.white,
                                    inactiveTrackColor:
                                        Color.fromRGBO(232, 232, 232, 1),
                                    inactiveThumbColor: Colors.white,
                                    activeTrackColor:
                                        Color.fromRGBO(25, 116, 254, 1),
                                    value: item['id'] == nowId, // 初始状态为开启
                                    onChanged: (bool value) {
                                      // 当开关状态改变时调用
                                      print(
                                          "Switch is ${value ? 'on' : 'off'}");
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
