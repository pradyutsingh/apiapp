import 'package:flutter/material.dart';

class RestroTile extends StatelessWidget {
  RestroTile({this.name,this.rating,this.costfortwo,this.imagelink});
  final name;
  final costfortwo;
  final rating;
  final imagelink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imagelink),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
          ),
      ),
      subtitle: Text(
        "Cost for two : $costfortwo"
      ),
      trailing: Text(rating),
    );
  }
}