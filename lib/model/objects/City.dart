import 'dart:convert';

import 'package:RendicontationPlatformLeo_Client/model/objects/Cap.dart';


class City {
  int id;
  String name;
  Set<Cap> caps;


  City({this.id, this.name, this.caps});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['title'],
      caps: json['cap'],
    );
  }

  Map<String, String> toJson() => {
    'id': id.toString(),
    //'name': name, unnecessary
    //'caps': jsonEncode(caps), unnecessary
  };


}