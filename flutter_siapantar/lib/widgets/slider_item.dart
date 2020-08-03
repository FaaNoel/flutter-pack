import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sss/screens/details.dart';
import 'package:flutter_sss/util/const.dart';
import 'package:flutter_sss/widgets/smooth_star_rating.dart';

class SliderItem extends StatelessWidget {

  final String name;
  final String img;
  final String model;
  final bool isFav;
  final double rating;
  final int raters;
  final String desc;
  final String price;


  SliderItem({
    Key key,
    @required this.name,
    @required this.img,
    @required this.model,
    @required this.isFav,
    @required this.rating,
    @required this.raters,
    @required this.desc,
    @required this.price})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.2,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 50,
                left: 180,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Image.asset(
                      "$model",
                      fit: BoxFit.cover,
                      width: 160,
                    )
                ),
              ),

              Positioned(
                top: 10,
                left: 9,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Text(
                      "Free Ongkir",
                      style: TextStyle(
                          fontFamily: 'Play',
                          fontSize: 19.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                      ),
                    )
                ),
              ),

              Positioned(
                top: 150,
                left: 9,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: RaisedButton(
                      onPressed: (){},
                      shape: new RoundedRectangleBorder(
                        borderRadius:  new BorderRadius.circular(30.0),
                      ),
                      textColor: Color(0xff4a648a),
                      color: Colors.white,
                      child: new Text('Gunakan'),

                    )
                ),
              ),


              Positioned(
                top: 30,
                left: 9,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Text(
                      "Gratis Ongkir Kemana aja !",
                      style: TextStyle(
                        fontFamily: 'Play',
                          fontSize: 19.0,
                          color: Colors.white,
                      ),
                    )
                ),
              ),

              Positioned(
                top: 60,
                left: 9,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Text(
                      "Periode",
                      style: TextStyle(
                          fontFamily: 'Play',
                          fontSize: 19.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                      ),
                    )
                ),
              ),

              Positioned(
                top: 80,
                left: 9,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Text(
                      "12 - 23 Feb",
                      style: TextStyle(
                        fontFamily: 'Play',
                          fontSize: 19.0,
                          color: Colors.white,
                      ),
                    )
                ),
              ),
            ],


          ),
        ],
      ),
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              return ProductDetails();
            },
          ),
        );
      },
    );
  }
}
