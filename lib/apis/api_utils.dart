import 'package:http/http.dart' ;

Future getRequest(String endPoint) async {
  return await get(endPoint);
}
