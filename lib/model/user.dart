import 'dart:ffi';

class User {
  int? id;
  int? rank;
  int? wallet;
  String? firstName;
  String? lastName;
  String? logo_url;

  User(this.id, this.firstName, this.lastName, this.wallet, this.logo_url,
      this.rank) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.logo_url = logo_url;
    this.wallet = wallet;
    this.rank = rank;
  }

  //elimizde bir json verisi var bu sınıfa çeviriyoruz
  User.fromJson(Map json) {
    id = json['id'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    logo_url = json['logo_url'];
    wallet = json['wallet'];
    rank = json['rank'];
  }

  //productın jsona çevrilmesi veri tabanına kayıt eklemek için kullnılır

  Map toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "logo_url": logo_url,
      "wallet": wallet,
      "rank": rank
    };
  }
}
