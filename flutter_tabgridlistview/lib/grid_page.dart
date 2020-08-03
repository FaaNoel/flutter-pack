import 'package:flutter/material.dart';
import 'package:flutter_tabgridlistview/dataImage.dart';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new GridPage(),
  ));
}

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: storeItems.length ,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              //here you can add youy action on grid element Tab
            },
            child: Card(
              child: new InkWell(
                onTap: (){
                print("tertekan");
                },
              child: Stack(
                alignment: FractionalOffset.bottomCenter,
                children: <Widget>[
                  Container(

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(storeItems[index].gambar)
                        )
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    color: Colors.indigo,
                    child: Text(storeItems[index].judul,
                      style: TextStyle     (fontWeight: FontWeight.w700, fontSize: 16.0, color: Colors.white),),
                  )
                ],
              ),
            ),
            ),
          );
        },),
    );
  }
}
