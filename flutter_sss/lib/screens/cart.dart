import 'package:flutter/material.dart';
import 'package:flutter_sss/screens/checkout.dart';
import 'package:flutter_sss/util/const.dart';
import 'package:flutter_sss/util/shoes.dart';
import 'package:flutter_sss/widgets/cart_item.dart';
import 'package:flutter_sss/widgets/smooth_star_rating.dart';


class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with AutomaticKeepAliveClientMixin<CartScreen> {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView.builder(
          itemCount: shoes == null ? 0 :shoes.length,
          itemBuilder: (BuildContext context, int index){
            Map food = shoes[index];
            return CartItem(
              img: food['img'],
                isFav: false,
                name: food['name'],
                rating: 5.0,
                raters: 23,
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Checkout",
        onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context){
                return Checkout();
              }
            ));
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        heroTag: Object(),
      ),
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
