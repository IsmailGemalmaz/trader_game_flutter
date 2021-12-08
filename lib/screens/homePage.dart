import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List imgList = [
    "https://www.trbinance.com/cdn/images/turkey/home/thumb4.png",
    'https://www.icrypex.com/blogfiles/what-is-cryptocurrency-exchange.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY3dHR08pf6SK0kVQzGy3Jn9xYsD3JJOfEkg&usqp=CAU',
    'https://i0.wp.com/kriptokoin.com/wp-content/uploads/2020/02/kucoin-kriptokoin-com-.jpg?fit=770%2C514&ssl=1',
    'https://www.koinbox.net/wp-content/uploads/2019/08/crypto-markets-daily.jpg',
    'https://i2.wp.com/kriptokoin.com/wp-content/uploads/2020/08/bitcoin-cash-hard-fork-crypto-crash_o.jpeg?fit=770%2C422&ssl=1'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, carouselReason) {
                      print(index);
                      setState(() {
                        _current = index;
                      });
                    }),
                items: imgList
                    .map((item) => Container(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                child: Stack(
                                  children: <Widget>[
                                    Image.network(item,
                                        fit: BoxFit.cover, width: 1000.0),
                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(200, 0, 0, 0),
                                              Color.fromARGB(0, 0, 0, 0)
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 20.0),
                                        // child: Text(
                                        //   'No. ${imgList.indexOf(item)} image',
                                        //   style: TextStyle(
                                        //     color: Colors.white,
                                        //     fontSize: 20.0,
                                        //     fontWeight: FontWeight.bold,
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ))
                    .toList()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 5.0,
                    height: 5.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
