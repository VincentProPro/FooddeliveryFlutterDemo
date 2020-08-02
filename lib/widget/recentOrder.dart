import 'package:flutter/material.dart';

import '../data/data.dart';
import '../data/data.dart';
import '../models/order.dart';
import '../models/order.dart';

class recentOrders extends StatelessWidget {
  _buildRecentOrders(BuildContext context, Order order){

    return Container(
      width: 320,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200],
        width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: AssetImage(order.food.imageUrl,),
              height: 100,width: 100,fit: BoxFit.cover,
            )),
        Container(
          margin: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(order.food.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,

              ),),
              SizedBox(height: 4,),

              Text(order.restaurant.name,
    overflow: TextOverflow.ellipsis
    ,style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),),
              SizedBox(height: 4,),
              Text(order.date,              overflow: TextOverflow.ellipsis,
                style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right:20),
          width: 48,
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
        )
      ],),
    );


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Text('Recent Orders', style: TextStyle(
            fontSize: 24,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600
          ),),
        ),
        Container(
          height: 120,
          color: Colors.blue,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20),

              itemCount:currentUser.orders.length
              ,
              scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context, int index){
            Order order=currentUser.orders[index];
            return _buildRecentOrders(context,order);
              }),
        ),
      ],
    );
  }
}
