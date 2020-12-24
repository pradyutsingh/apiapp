import 'package:apiapp/widgets/restroList.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestroList extends StatefulWidget {
  RestroList({this.latitude , this.longitude});
  final double latitude;
  final double longitude;
  @override
  _RestroListState createState() => _RestroListState();
}

class _RestroListState extends State<RestroList> {

  List _restaurants;
  
  void locationData() async{
    http.Response response = await http.get(
      'https://developers.zomato.com/api/v2.1/geocode?lat=${widget.latitude}&lon=${widget.longitude}'
      ,headers: {
        'user-key' : '1fdce48efef38534bb2decf3cae242b6'
      }
    );
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      print(decodedData);
      setState(() {
        _restaurants = decodedData["nearby_restaurants"];
        print(_restaurants.length);
      });
    }
    else{
      print("invalid");
    }
  }
  @override
  void initState() {
    locationData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Container(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Near you",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                ), 
                ),
              SizedBox(
                height: 10,
              ),
              _restaurants == null
              ? CircularProgressIndicator()
              :Flexible(
                  child: ListView(
                  children: _restaurants.map((restaurant){
                      return RestroTile(
                        name: restaurant["restaurant"]["name"],
                        rating: restaurant["restaurant"]["user_rating"]["aggregate_rating"],
                        costfortwo: restaurant["restaurant"]["average_cost_for_two"],
                        imagelink:  restaurant["restaurant"]["featured_image"],
                      );
                    }).toList()
                  ,
                ),
              )
            ],
          ),
        ),
      );
  }
}