import 'package:flutter/cupertino.dart';

class CatModel{
  final int id, age;
  final String name, imageUrl;
  final bool big;
  VoidCallback? onPressed;

  CatModel(this.id, this.name, this.imageUrl, this.big, this.age);

  factory CatModel.fromJson(Map<String, dynamic> json)=>CatModel(json['id'], json['name'], json['imageUrl'], json['type']=="BIG_CARD", json['age']);

  toJson()=>{
    "id":id,
    "name":name,
    "imageUrl":imageUrl,
    "big":big,
  };

  @override
  toString()=>this.toJson().toString();
}