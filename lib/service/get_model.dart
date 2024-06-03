import 'package:dio/dio.dart';
import 'package:flutter_ui_exame/model/pepolemodel.dart';

List<pepole> pepolelist = [];
Future<List<pepole>> getpepoleData() async {
  Dio req = Dio();

  try {
    Response response = await req
        .get("https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/people");
    for (var i = 0; i < response.data!.length; i++) {
      pepole pepo = pepole.fromMap(response.data![i]);

      pepolelist.add(pepo);
      print(pepo);
    }
    return pepolelist;
  } catch (e) {
    print(e);
    return pepolelist;
  }
}
