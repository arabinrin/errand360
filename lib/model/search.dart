import 'package:flutter/material.dart';

class SearchModel {
  String name;


  SearchModel({required this.name,});
}

List<SearchModel> searchModel = [
  SearchModel(
    name: 'All aplicants',
  ),
  SearchModel(
    name: 'Short Listed',
  ),
  SearchModel(
    name: 'Declined',
  ),
  SearchModel(
    name: 'Unsure',
  ),
];
