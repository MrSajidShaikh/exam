import 'package:flutter/material.dart';

Container details({
  required String img,
  required String name,
  required int price,
  required String weight,
  required String description,
}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.all(7),
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(color: Colors.black, spreadRadius: 2, blurRadius: 2)
            ],
            image: DecorationImage(
              image: AssetImage(img),
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 3,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Price      :',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: "  " + 'Rs. '+price.toString()+'/-',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Weight   :',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: "  $weight",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
