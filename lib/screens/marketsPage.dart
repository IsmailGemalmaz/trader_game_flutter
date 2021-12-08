import 'dart:convert';

import 'package:borsa_oyunu/apis/api.dart';
import 'package:borsa_oyunu/apis/api_utils.dart';
import 'package:borsa_oyunu/model/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MarketsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarketsPageState();
}

class MarketsPageState extends State {
  List<Crypto> list = [];

  //açıldığında başlaması için
  @override
  void initState() {
    super.initState();
    getCrypto();
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
                            Text("P.hac : " + list[index].market_cap!)
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

  getCrypto() {
    //future olduğu için then kullanılabilir
    getRequest(Api.CRYPTO_API_URL).then((res) {
      setState(() {
        Iterable list = json.decode(res
            .body); //bun itarete edilebilir olması için bu değişkene atadık gezilebilir tekrarlanabilir
        this.list = list.map((crypto) => Crypto.fromJson(crypto)).toList();
      });
    });
  }
}

//flutter run --no-sound-null-safety

// Stack(
//       children: <Widget>[
//         ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (context, poisition) {
//               return ListTile(
//                 title: Text(list[poisition].name!),
//               );
//             }),
//         //Center(child: CircularProgressIndicator())
//       ],
//     )

//  ListView.separated(
//               controller: scrollController,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(list[index]),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Divider(
//                   height: 1,
//                 );
//               },
//               itemCount: list.length);


