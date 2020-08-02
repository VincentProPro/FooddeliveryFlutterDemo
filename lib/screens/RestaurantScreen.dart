import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/widget/RatingStart.dart';

import '../models/food.dart';
import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen(this.restaurant);
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildmenuItem(Food food){

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(

            height: 175,
            width: 175,
            decoration: BoxDecoration(
image: DecorationImage( image: AssetImage(food.imageUrl),fit: BoxFit.cover
            )            ,
            borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            height:175,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin:Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),

                    Colors.black38.withOpacity(0.3)

                  ],stops: [0.1,0.4,0.6,0.9])
            ),
            child: null,
          ),
          Positioned(
            bottom: 65,
            child: Column(
              children: <Widget>[
                Text(food.name,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                    letterSpacing: 1.2

                ),),
                Text('\$ ${food.price}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 1.2

                ),)
              ],
            ),
          ),
          Positioned(
              bottom:10,
              right: 10,
              child:  Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: (){

                  },
                ),
              ))
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                  child: Image(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.restaurant.imageUrl),fit: BoxFit.cover,)),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios), color: Colors.white,iconSize: 30, onPressed: (){Navigator.pop(context);}),
                    IconButton(icon: Icon(Icons.favorite), color: Theme.of(context).primaryColor,iconSize: 30, onPressed: (){}),
                  ],
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right:20,left: 20,top:2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
Text(widget.restaurant.name,style: TextStyle(
  fontSize: 22,fontWeight: FontWeight.w600
),),
                    Text('djhvifhvf',style: TextStyle(
                      fontSize: 18
                    ),),
                  ],
                ),
                RatingStart(widget.restaurant.rating),
                SizedBox(height: 1,),
                Text(widget.restaurant.address, style: TextStyle(
                  fontSize: 18
                ),)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                onPressed: (){},
                child: Text('reviews', style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),)),
              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){},
                  child: Text('Contact', style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),))],
          )
          ,
          SizedBox(height: 1,),
          Center(
            child:
            Text('Menu',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2
            ),),
          ),
          SizedBox(height: 10,),
Expanded(
  child:   GridView.count(crossAxisCount: 2,
  children: List.generate(widget.restaurant.menu.length, (index) {
    Food food=widget.restaurant.menu[index];

    return _buildmenuItem(food);
  }),),
)
        ],
      ),
    );
  }
}
