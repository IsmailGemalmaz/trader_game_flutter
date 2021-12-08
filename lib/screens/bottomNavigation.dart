import 'package:borsa_oyunu/screens/settingsPage.dart';
import 'package:borsa_oyunu/screens/walletPage.dart';
import 'package:borsa_oyunu/screens/homePage.dart';
import 'package:borsa_oyunu/screens/marketsPage.dart';
import 'package:borsa_oyunu/screens/rankPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigaionState();
}

class BottomNavigaionState extends State<BottomNavigation> {
  int _index = 0;
  String _title = "";
  final screens = [
    HomePage(),
    MarketsPage(),
    WalletPage(),
    RankPage(),
    SettingsPage()
  ];

  final items = <Widget>[
    Icon(
      Icons.home_outlined,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.account_balance_outlined,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.account_balance_wallet_outlined,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.person_outline_sharp,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.settings_outlined,
      size: 30,
      color: Colors.white,
    )
  ];

  @override
  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        _title = "Anasayfa";
        break;
      case 1:
        _title = "Piyasalar";
        break;
      case 2:
        _title = "Cüzdan";
        break;
      case 3:
        _title = "Sıralama";
        break;
      case 4:
        _title = "Ayarlar";
        break;
      default:
    }

    return Scaffold(
      extendBody: true, //botton-m navigation yuvarlağına girmesi için
      backgroundColor: Color(0xff212022),
      appBar: AppBar(
        title: Text(_title),
        elevation: 0,
        centerTitle: true,
      ),
      body: screens[_index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.yellow, //seçilen buton yuvarlak rengi
        color: Color(0xffF9D943),
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: _index,
        items: items,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
