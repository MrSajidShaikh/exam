import 'package:flutter/material.dart';
import 'Details.dart';
import 'Global.dart';
import 'Lists.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen.shade500,
        title: const Text(
          'Product Details',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        details(
          img: itemslist[selectedindex]['img'],
          name: itemslist[selectedindex]['name'],
          weight: itemslist[selectedindex]['weight'],
          price: itemslist[selectedindex]['price'],
          description: itemslist[selectedindex]['description'],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            bool a = false;
            int index =0;
            for(int i=0; i<cartitems.length; i++)
            {
              if(cartitems[i]['name']==itemslist[selectedindex]['name'])
              {
                a = true;
                index=i;
              }
            }
            if(a)
            {
              cartitems[index]['qty']++;
            }
            else{
              cartitems.add(itemslist[selectedindex]);
            }

            Navigator.of(context).pushNamed('/cart');
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.green,
                Colors.orange.shade200,
                Colors.green,
              ]),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 2)
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              'Add to Cart ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
