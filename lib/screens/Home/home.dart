import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lapcare/Json/constants.dart';
import 'package:lapcare/services/Auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(item, fit: BoxFit.cover, width: 1000.0)),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final AuthServices _auth = AuthServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Image.network(
          appicon,
          height: 50,
          width: 100,
        ),
        actions: [
          //search
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          //add cart icon
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _auth.signout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: imageSliders,
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('This Month\'s Picks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(homeImg),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text("DISCOVER",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Trending Products",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Text("All", style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(TrendingProducts.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      width: 180,
                      height: 220,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        TrendingProducts[index]['imgUrl']
                                            as String,scale:0.5),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Positioned(
                            bottom:1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                TrendingProducts[index]['title']
                                    as String,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Headset",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Text("All", style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 16,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(Headsets.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 170,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                  Headsets[index]['imgUrl'] as String,
                                ),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Headsets[index]['title'] as String,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  height: 1.5),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "₹ ${Headsets[index]['price']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
