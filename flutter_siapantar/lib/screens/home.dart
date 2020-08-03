import 'package:flutter/material.dart';
import 'package:flutter_sss/screens/arival.dart';
import 'package:flutter_sss/widgets/grid_product.dart';
import 'package:flutter_sss/widgets/home_category.dart';
import 'package:flutter_sss/widgets/slider_item.dart';
import 'package:flutter_sss/util/shoes.dart';
import 'package:flutter_sss/util/delivery.dart';
import 'package:flutter_sss/util/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sss/util/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sss/widgets/CustomShapeClipper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add((handler(i, list[i])));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            color: Color(0xff4a648a),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget>[
                Text(
                  "My Balance",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Play',
                    fontWeight: FontWeight.w800,color: Colors.white
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Rp. 1.500.000",
                    style: TextStyle(
                      fontFamily: 'Play',
                        fontSize: 20,
                        fontWeight: FontWeight.w800, color: Colors.white
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      height: 250.0,
                      width: double.infinity,
                      color: Color(0xff557199)
                    ),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color(0xff557199)
                              .withOpacity(0.4)),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 150.0,
                    child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150.0),
                            color: Colors.white
                                .withOpacity(0.5),)),
                  ),
                  Positioned(
                    bottom: 80.0,
                    left: 150.0,
                    child: Image(
                      height: 150.0,
                        width: 200.0,
                      image: AssetImage('assets/main.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15.0),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 120.0),
                          SizedBox(height: 15.0),
                        ],
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Hai !',
                          style: TextStyle(
                              fontFamily: 'Play',
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Bagas Chandra',
                          style: TextStyle(
                            color: Colors.white,
                              fontFamily: 'Play',
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search,
                                      color: Color(0xffDBC284),
                                      size: 30.0),
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 15.0),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Quicksand'))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: 100.0,
                    width: 300.0,
                    margin: new EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0, // has the effect of softening the shadow
                          spreadRadius: 1.0, // has the effect of extending the shadow
                          offset: Offset(
                            1.0, // horizontal, move right 10
                            1.0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Color(0xff557199),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              Text(
                                "Cek Resi",
                                style: TextStyle(
                                  fontFamily: 'Play',
                                  fontSize: 20,
                                  color:Colors.white,
                                  fontWeight: FontWeight.w800,


                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(1.0),
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.search
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.barcode),
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Divider(),
              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Material(
                      elevation: 1.0,
                      child: Container(height: 75.0, color: Color(0xfffcfcff))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {},
                              fillColor: Colors.white,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 1.0,style: BorderStyle.solid)
                              ),
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/TopUp.png'))),
                              ),
                            ),
                            Text(
                              'Top Up',
                              style: TextStyle(fontFamily: 'Quicksand',color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {},
                              fillColor: Colors.white,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 1.0,style: BorderStyle.solid)
                              ),
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage('assets/Booking.png'))),
                              ),
                            ),
                            Text(
                              'Booking',
                              style: TextStyle(fontFamily: 'Quicksand', color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {},
                              fillColor: Colors.white,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 1.0,style: BorderStyle.solid)
                              ),
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/CekTarif.png'))),
                              ),
                            ),
                            Text(
                              'Cek Tarif',
                              style: TextStyle(fontFamily: 'Quicksand', color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {},
                              fillColor: Colors.white,
                              shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.black, width: 1.0,style: BorderStyle.solid)
                              ),
                              elevation: 4.0,
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage('assets/Lainnya.png'))),
                              ),
                            ),
                            Text(
                              'Lainnya',
                              style: TextStyle(fontFamily: 'Quicksand', color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Penawaran",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "View More",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              CarouselSlider(
                height: MediaQuery.of(context).size.height / 3.1,
                items: map<Widget>(
                  shoes,
                  (index, i) {
                    Map food = shoes[index];
                    return SliderItem(
                      img: food['img'],
                      isFav: false,
                      name: food['name'],
                      model: food['model'],
                    );
                  },
                ).toList(),
                autoPlay: true,
//                enlargeCenterPage: true,
                viewportFraction: 1.0,
//              aspectRatio: 2.0,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Delivery",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "View More",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: delivery == null ? 0 : delivery.length,
                itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(shoes[index]);
                  Map food = delivery[index];
//                print(shoes);
//                print(shoes.length);
                  return GridProduct(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    duration: food['duration'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
