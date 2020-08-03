import 'package:flutter/cupertino.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile/CustomShapeClipper.dart';
import 'package:flutter_profile/CustomAppBar.dart';
import 'package:flutter_profile/DetailPage.dart';
import 'package:flutter_profile/item_list.dart';
import 'favorite.dart';
import 'account.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new SelectorPage(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new HomeScreen()
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
    );
  }
}

Color firstColor = Color(0xFFFF66AA);
Color secondColor = Color(0xFFCF4DFF);

ThemeData appTheme =
ThemeData(primaryColor: Color(0xFFFF66AA), fontFamily: 'Oxygen');

List<String> locations = ['osu!Achievement', 'osu!Medals'];

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CustomBottomAppBar(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                HomeScreenTopPart(),
                homeScreenBottomPart,
                homeScreenBottomPart2,
              ],
            ),
          )),
    );
  }
}

const TextStyle dropDownLabelStyle =
TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;
  var isOssSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.category, color: Colors.white),
                    SizedBox(
                      width: 16.0,
                    ),
                    PopupMenuButton(
                      onSelected: (index) {
                        setState(() {
                          selectedLocationIndex = index;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            locations[selectedLocationIndex],
                            style: dropDownLabelStyle,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<int>>[
                        PopupMenuItem(
                          child: Text(
                            locations[0],
                            style: dropDownMenuItemStyle,
                          ),
                          value: 0,
                        ),
                        PopupMenuItem(
                          child: Text(
                            locations[1],
                            style: dropDownMenuItemStyle,
                          ),
                          value: 0,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Search Achievements \nthat you havent gotten yet !',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: null),
                    style: dropDownMenuItemStyle,
                    cursorColor: appTheme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AchievementsListingScreen()));
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('osu!'),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/mode-osu.png",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )
                        ],
                      )),
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('osu!mania'),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/mode-mania.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('osu!catch'),
                            ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/mode-fruits.png",
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              )
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('osu!taiko'),
                          ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/mode-taiko.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ))
          : null,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              widget.icon,
              size: 20.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ]),
    );
  }
}

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Popular osu!Achievements",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.0),
          ),
          Spacer(),
        ],
      ),
    ),
    Container(
      height: 220.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: itemCard,
      ),
    ),
    SizedBox(
      height: 20.0,
    ),
  ],
);

List<ItemCard> itemCard = [
  ItemCard(
    "http://haitai.jp/img/all-secret-challenge_accepted@2x.png",
    "Challenge Accepted",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-quickmaffs@2x.png",
    "Quick Maths",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-dancer@2x.png",
    "Non-Stop Dancer",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-ftb@2x.png",
    "Feel The Burn",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-jack@2x.png",
    "Jack of All Trades",
  ),
];

class ItemCard extends StatelessWidget {
  final String imagePath, itemName;

  ItemCard(this.imagePath,
      this.itemName,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 210.0,
                    width: 160.0,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                width: 160.0,
                height: 60.0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.grey.withOpacity(0.1),
                          ])),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      child: Text(
                        itemName,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


var pageList = [
  PageModel(
      imageUrl: "assets/images/mode-osu.png",
      title: "osu!Std",
      body: "Tap, Slide, and Spin to the Beat!",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/images/mode-mania.png",
      title: "osu!Mania",
      body: "Make the notes play a melody of the Beat!",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/images/mode-fruits.png",
      title: "osu!Catch",
      body: "Collect falling fruits by moving the catcher with a plate. Keep dancing and do not miss the step of the Beat!",
      titleGradient: gradients[2]),
  PageModel(
      imageUrl: "assets/images/mode-taiko.png",
      title: "osu!Taiko",
      body: "Drum, and roll the taiko drumroll to the Beat!",
      titleGradient: gradients[3]),
];


List<List<Color>> gradients = [
  [Color(0xFFFF66AA), Color(0xFFCF4DFF)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];

  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;

  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 4.0,
          decoration: BoxDecoration(
              color: isActive ? Colors.white : Color(0xFF3E4750),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicators(),
    );
  }
}

class SelectorPage extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<SelectorPage> with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                  print(lastPage);
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;

                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(page.imageUrl),
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                      colors: pageList[index].titleGradient),
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontFamily: "Montserrat-Black",
                                      letterSpacing: 1.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0, left: 22.0),
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                      colors: pageList[index].titleGradient),
                                  style: TextStyle(
                                    fontSize: 70.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                          child: Transform(
                            transform:
                            Matrix4.translationValues(0, 50.0 * (1 - y), 0),
                            child: Text(
                              page.body,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Montserrat-Medium",
                                  color: Color(0xFF9B9B9B)),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                  width: 160.0,
                  child: PageIndicator(currentPage, pageList.length)),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ? FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Store {
  String judul;
  String gambar;

  Store.items({
    this.gambar,
    this.judul,
  });
}

List<Store> storeItems = [
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-challenge_accepted.png",
    judul: "",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-consolation_prize.png",
    judul: "Consolation Prize",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-dancer.png",
    judul: "Non-Stop Dancer",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-improved.png",
    judul: "Most Improved",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-rank-s.png",
    judul: "S-Ranker",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-jack.png",
    judul: "Jack of All Trades",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-nonstop.png",
    judul: "Nonstop",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-obsessed.png",
    judul: "Obsessed",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-quick_draw.png",
    judul: "Quick Draw",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-jackpot.png",
    judul: "Jackpot",
  ),
];

var homeScreenBottomPart2 = Container(
  height: 300,
  color: Colors.white30,
  child: GridView.builder(
    shrinkWrap: true,
    itemCount: storeItems.length,
    gridDelegate:
    new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(

        child: Container(
          child: GestureDetector(
            child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: storeItems[index].gambar),
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
      );
    },
  ),
);