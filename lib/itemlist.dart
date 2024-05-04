import 'package:flutter/material.dart';

Row item_Lists({required String img,required String name,required String weight,required int price}) {
  return Row(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 210,
            width: 347,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 1.5)
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 210,
                  width: 145,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(img),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25,left: 12),
                  height: 210,
                  width: 175,
                  color: Colors.white,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$name\n',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),
                        ),
                        TextSpan(
                          text: '\n$weight\n',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                        TextSpan(
                          text: '\nRs. $price/-',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Column tab_Bar({required String img, required String name}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        // margin: EdgeInsets.only(right: 10),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(img),
            ),
            boxShadow: const [BoxShadow(color: Colors.black, spreadRadius: 1)]),
      ),
      Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ],
  );
}