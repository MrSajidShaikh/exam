import 'package:flutter/material.dart';
import 'Global.dart';
import 'Lists.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(color: Colors.white,height: 80,child: GestureDetector(
        onTap: () { total=0;

        setState(() {
          amt =0;
          for(int i=0; i<cartitems.length;i++)
          {
            qty = (qty + cartitems[i]['qty']).toInt();
            amt=amt+cartitems[i]['price']*cartitems[i]['qty'];
          }

          total = (((amt*18)/100)+amt).toInt();
        });
        Navigator.of(context).pushNamed('/checkout');
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.orange.shade200,
              Colors.green
            ]),
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(color: Colors.black, spreadRadius: 2, )
            ],
          ),
          alignment: Alignment.center,
          child: const Text(
            '  Checkout ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          'Vegetables',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              cartitems.length,
                  (index) =>
                  cartlist(
                    index: index,
                    img: cartitems[index]['img'],
                    name: cartitems[index]['name'],
                    weight: cartitems[index]['weight'],
                    price: cartitems[index]['price'],
                  ),
            ),
          ],
        ),
      ),
    );
  }


  Row cartlist({required String img,
    required String name,
    required int index,
    required String weight,
    required int price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          height: 210,
          width: 347,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 1.5)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 210,
                width: 125,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                height: 210,
                width: 165,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                     Text(
                      weight,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    Text(
                      'Rs. $price/-\n',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if(cartitems[index]['qty']>1)
                              {
                                cartitems[index]['qty']--;
                              }
                            });
                          },
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${cartitems[index]['qty']}',
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              cartitems[index]['qty']++;
                            });
                          },
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    cartitems.removeAt(index);
                  });
                },
                child: Container(
                    height: 210,
                    width: 52,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25))),
                    child: const Icon(Icons.delete)),
              ),
            ],
          ),
        ),
      ],
    );
  }}

int index = 0;
int count = 0;
int qty = 0;
int total = 0;
