import 'dart:convert';
import 'dart:io';
import 'package:RendicontationPlatformLeo_Client/model/objects/Club.dart';
import 'package:RendicontationPlatformLeo_Client/model/objects/Quantity.dart';
import 'package:RendicontationPlatformLeo_Client/model/support/Constants.dart';
import 'package:http/http.dart';


class RestManager {


  Future<Club> makeClubRequest(String url, String name) async {
    Uri uri = Uri.http(Constants.BASE_URL, url, {"name": name});
    var response = await get(uri, headers: {
      //HttpHeaders.authorizationHeader: 'Token $token',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    return Club.fromJson(jsonDecode(response.body));
  }

  Future<Quantity> makeQuantityRequest(String url, int clubId) async {
    Uri uri = Uri.http(Constants.BASE_URL, url, {"club_id": clubId.toString()});
    var response = await get(uri, headers: {
      //HttpHeaders.authorizationHeader: 'Token $token',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    return Quantity.fromJson(jsonDecode(response.body));
  }


}




// Map<String, String> params