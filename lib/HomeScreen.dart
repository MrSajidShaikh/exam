import 'package:flutter/material.dart';
import 'Global.dart';
import 'Lists.dart';
import 'itemlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Colors.white,
        title: const Text(
          'Grocery Store',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: const Icon(
          Icons.menu_open,
          size: 30,
          color: Colors.black,
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/cart');
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 190,
                      width: 350,
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/banner.png"),
                            fit: BoxFit.fill),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 2)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.more_horiz_sharp,
              ),
              Container(
                alignment: Alignment.topRight,
                child: const Text(
                  'See All     ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tab_Bar(img: 'assets/images/vegetables.png', name: 'Vegetables'),
                    tab_Bar(img: 'assets/images/fruits.png', name: 'Fruits'),
                    tab_Bar(img: 'assets/images/diary.png', name: 'Dairy'),
                    tab_Bar(img: 'assets/images/bakery_icon.png', name: 'Bakery'),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 8),
                child: const Text(
                  '  Vegetables',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 25),
                ),
              ),
              Column(
                  children: List.generate(
                    itemslist.length,
                        (index) => GestureDetector(onTap: () {
                      selectedindex = index ;
                      Navigator.of(context).pushNamed('/detail');
                    },
                      child: item_Lists(
                        img: itemslist[index]['img'],
                        name: itemslist[index]['name'],
                        weight: itemslist[index]['weight'],
                        price: itemslist[index]['price'],
                      ),),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}