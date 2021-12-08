// import 'dart:convert';

// import 'package:borsa_oyunu/apis/api.dart';
// import 'package:borsa_oyunu/apis/api_utils.dart';
// import 'package:borsa_oyunu/model/crypto.dart';

// class MarketsUtility {
//   getCrypto(List<>) {
//     //future olduğu için then kullanılabilir
//     getRequest(Api.CRYPTO_API_URL).then((res) {
    
//         Iterable list = json.decode(res
//             .body); //bun itarete edilebilir olması için bu değişkene atadık gezilebilir tekrarlanabilir
//         this.list = list.map((crypto) => Crypto.fromJson(crypto)).toList();    
//     });
//   }
// }
