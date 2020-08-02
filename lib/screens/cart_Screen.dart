import 'package:flutter/material.dart';

import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';
import '../data/data.dart';
import '../models/order.dart';

class cart_Screen extends StatefulWidget {
  @override
  _cart_ScreenState createState() => _cart_ScreenState();
}

class _cart_ScreenState extends State<cart_Screen> {
  double totalprice=0;
  _buildCardItem(Order order){

    return Container(
      padding: EdgeInsets.all(20),
      height: 180,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      Text(order.food.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Text(order.restaurant.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)
                      ,SizedBox(height: 10,),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.8,
                          color: Colors.black38),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                                onTap: (){},

                                child: Text('-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor))),
                            SizedBox(width: 20,),

                            Text(order.quantity.toString()),
                            SizedBox(width: 20,),

                            GestureDetector(
                                onTap: (){},
                                child: Text('+',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor)))
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Text('\$ ${order.quantity*order.food.price}',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    currentUser.cart.forEach((Order order) {
      totalprice+=order.food.price*order.quantity;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Card (${currentUser.cart.length})',style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
      ),
      body: ListView.separated(
      itemCount: currentUser.cart.length+1,

          itemBuilder: (BuildContext context, int index){
if(index<currentUser.cart.length){
  Order order=currentUser.orders[index];

  return _buildCardItem(order);

}
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Estimetied Delivery Time',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),),
          Text('25 min',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
          )),
        ],
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Text('Total Cost',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),),
          Text('\$ ${totalprice.toStringAsFixed(2)}',style: TextStyle(
              fontSize: 20,
              color: Colors.green[600],
              fontWeight: FontWeight.w600
          )),
        ],
      ),
      SizedBox(height: 80,)
    ],
  );

      }, separatorBuilder: (BuildContext context, int index){
        return Divider(height: 10,
        color: Colors.grey,);
      }),
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,

            boxShadow: [BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6,
            )]
        ),
        child: Center(
          child: FlatButton(onPressed: (){}, child: Text('CHECKOUT',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 2
          ),)),
        ),
      ),
    );
  }
}
