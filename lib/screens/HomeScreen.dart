import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widget/recentOrder.dart';

import '../data/data.dart';
import '../models/restaurant.dart';
import '../widget/RatingStart.dart';
import 'RestaurantScreen.dart';
import 'cart_Screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurant(){
    List <Widget> restaurantlist=[];
    restaurants.forEach((Restaurant restaurant) {
      restaurantlist.add(
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> RestaurantScreen(restaurant)));
            },
            child: Container(
              //width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1,
        color: Colors.grey[200])
      ),
      child: Row(
        children: <Widget>[

            ClipRRect(borderRadius:BorderRadius.circular(15),child: Hero(
                tag: restaurant.imageUrl,
                child: Image(image: AssetImage(restaurant.imageUrl),height: 100,width: 100,fit: BoxFit.cover,)))
        ,Container(
              width: 200,
            margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(restaurant.name, overflow: TextOverflow.ellipsis
                    ,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ), ),
                  //rating start
                  RatingStart(restaurant.rating),
                  Text(restaurant.address , overflow: TextOverflow.ellipsis,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(right: 0),
                    //padding: EdgeInsets.only(right: 10),
                    child: Text('wiuytrt overflow: TextOverflow.ellipsis', overflow: TextOverflow.ellipsis ,style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),),
                  ),


                ],
              ),
        ),
        ],
      ),),
          )
      );
    });
    return Column(
      children: restaurantlist,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon( Icons.account_circle),iconSize: 30, onPressed: (){}),
        title: Text('Food Delivery'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>cart_Screen()));
          }, child: Text('Card (${currentUser.cart.length})',style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),)),

        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8, color: Theme.of(context).primaryColor)
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: Icon(Icons.search, size: 30),
                suffixIcon: IconButton(icon:Icon(Icons.clear, size: 30,),onPressed: (){},)
              ),
            ),
          ),
          recentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:20.0),
                child: Text('NearBy Restaurant',style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),),
              ),
              _buildRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}
