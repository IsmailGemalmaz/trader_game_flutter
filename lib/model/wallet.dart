import 'package:flutter/material.dart';

class Wallet{
  int? id;
   String? currency;
  String? name;
  String? logo_url;
  String? price;
  String? market_cap;

  Wallet(this.id, this.currency, this.name, this.price, this.market_cap,
      this.logo_url) {
    this.id = id;
    this.currency = currency;
    this.name = name;
    this.logo_url = logo_url;
    this.price = price;
    this.market_cap = market_cap;
  }

  //elimizde bir json verisi var bu sınıfa çeviriyoruz
  Wallet.fromJson(Map json) {
    id = json['id'];
    currency = json['currency'];
    name = json['name'];
    logo_url = json['logo_url'];
    price = json['price'];
    market_cap = json['market_cap'];
  }

  //productın jsona çevrilmesi veri tabanına kayıt eklemek için kullnılır

  Map toJson() {
    return {
      "id": id,
      "currency": currency,
      "name": name,
      "logo_url": logo_url,
      "price": price,
      "market_cap": market_cap
    };
  }
}