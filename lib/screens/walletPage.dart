import 'dart:convert';

import 'package:borsa_oyunu/apis/api.dart';
import 'package:borsa_oyunu/apis/api_utils.dart';
import 'package:borsa_oyunu/model/crypto.dart';
import 'package:borsa_oyunu/model/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WalletPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WalletPageState();
}

class WalletPageState extends State {
  List<Wallet> list = [];

  @override
  void initState() {
    super.initState();
    getWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (list.isNotEmpty) {
          return Stack(
            children: [
              Row(
                children: <Widget>[
                  Container(
                    child: Image.network(
                        "https://img.freepik.com/free-icon/important-person_318-10744.jpg?size=338&ext=jpg"),
                    height: 50.0,
                    width: 50.0,
                    margin: EdgeInsets.only(top: 40.0, left: 5.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40.0, left: 15.0),
                    child: Text(
                      "İsmail Gemalmaz ",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 110.0, left: 60.0),
                child: Text(
                  "Bakiye : ",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 170.0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        focusColor: Colors.amber,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(list[index].currency!),
                            Text(list[index].price!)
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(list[index].name!),
                            Text("P.hac : " + list[index].id!.toString())
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1,
                      );
                    },
                    itemCount: list.length),
              )
            ],
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    ));
  }

  getWallet() {
    //future olduğu için then kullanılabilir
    getRequest(Api.USER_WALLET_URL).then((res) {
      setState(() {
        Iterable list = json.decode(res
            .body); //bun itarete edilebilir olması için bu değişkene atadık gezilebilir tekrarlanabilir
        this.list = list.map((wallet) => Wallet.fromJson(wallet)).toList();
      });
    });
  }
}
