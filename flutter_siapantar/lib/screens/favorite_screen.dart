import 'package:flutter/material.dart';
import 'package:flutter_sss/util/categories.dart';
import 'package:flutter_sss/util/shoes.dart';
import 'package:flutter_sss/widgets/grid_product.dart';
import 'package:flutter_sss/widgets/home_category.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with AutomaticKeepAliveClientMixin<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Best Brands",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),

            Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null?0:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];
                  return HomeCategory(
                    icon: cat['icon'],
                    title: cat['name'],
                    items: cat['items'].toString(),
                    isHome: true,
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),
            Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0,),

            GridView.builder(
              shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: shoes == null ? 0 :shoes.length,
              itemBuilder: (BuildContext context, int index){
                Map food = shoes[index];
                return GridProduct(
                  img: food['img'],
                  isFav: true,
                  name: food['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
