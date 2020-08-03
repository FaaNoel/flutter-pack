import 'package:flutter/material.dart';
import 'package:flutter_sss/screens/details.dart';
import 'package:flutter_sss/util/const.dart';
import 'package:flutter_sss/widgets/smooth_star_rating.dart';

class GridProduct extends StatelessWidget {

  final String name;
  final String duration;
  final String img;
  final String desc;
  final bool isFav;
  final double rating;
  final int raters;
  final String price;


  GridProduct({
    Key key,
    @required this.name,
    @required this.duration,
    @required this.img,
    @required this.desc,
    @required this.isFav,
    @required this.rating,
    @required this.raters,
    @required this.price,})
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
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: 35,
                left: 10,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Text(
                      "$duration",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900
                      ),
                    )
                  ),
              ),

              Positioned(
                top: 10,
                left: 9,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 48.0, top: 8.0),
                    child: Text(
                      "$name",
                      style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                      ),
                    )
                ),
              ),
            ],


          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "$name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Row(
              children: <Widget>[
                SmoothStarRating(
                  starCount: 5,
                  color: Constants.ratingBG,
                  allowHalfRating: true,
                  rating: rating,
                  size: 10.0,
                ),

                Text(
                  " $rating ($raters Reviews)",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),

              ],
            ),
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
