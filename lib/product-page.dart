import 'package:flutter/material.dart';
import 'package:food_apps/payment_page.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double _spicy = 0.3;
  int portion = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black, size: 26)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.black, size: 26),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/pngwing.png",
                  height: 250,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Customize ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Your Burger \nto Your Tastes. Ultimate\n Experience",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Spicy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Slider(
                      value: _spicy,
                      onChanged: (value) => setState(() => _spicy = value),
                      activeColor: Colors.red,
                      inactiveColor: Colors.red.shade100,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mild", style: TextStyle(color: Colors.green)),
                         SizedBox(width: 120,),
                          Text("Hot", style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Portion",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        _portionButton(Icons.remove, () {
                          if (portion > 1) setState(() => portion--);
                        }),

                        SizedBox(width: 20),

                        Text(
                          portion.toString(),
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        _portionButton(Icons.add, () {
                          setState(() => portion++);
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),


            SizedBox(height: 30),
            Text(
              "Toppings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _toppingItem("Tomato", "assets/images/pngwing15.png"),
                  _toppingItem("Onions", "assets/images/pngwing16.png"),
                  _toppingItem("Pickles", "assets/images/pngwing17.png"),
                  _toppingItem("Bacons", "assets/images/pngwing18.png"),
                ],
              ),
            ),


            SizedBox(height: 25),
            Text(
              "Side options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _toppingItem("Tomato", "assets/images/pngwing15.png"),
                  _toppingItem("Onions", "assets/images/pngwing16.png"),
                  _toppingItem("Pickles", "assets/images/pngwing17.png"),
                  _toppingItem("Bacons", "assets/images/pngwing18.png"),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total",style: TextStyle(fontSize: 18),),
                    Text("\$ 16.40",style: TextStyle(fontSize: 28),),
                  ],
                ),
                InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                  },
                  child: Container(
                    height: 60,
                    width: 162,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text("Order Now",style: TextStyle(color: Colors.white,fontSize: 24),)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _portionButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.red),
      ),
    );
  }

  Widget _toppingItem(String title, String imgPath) {
    return Container(
      margin: EdgeInsets.only(right: 14),
      padding: EdgeInsets.all(10),
      width: 90,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imgPath, height: 45),
          SizedBox(height: 5),
          Text(title),
          Icon(Icons.add_circle, color: Colors.white),
        ],
      ),
    );
  }
}
