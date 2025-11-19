import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isChecked = false;

  void ShowSimpleDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Stack(
            children: [
              Center(child: Image.asset("assets/images/Ellipse.png")),
              Positioned(
                bottom: 25,
                left: 25,
                right: 21,
                top: 23,
                child: Center(child: Image.asset("assets/images/tick.png")),
              ),
            ],
          ),
          children: [
            Image.asset("assets/images/Success.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your payment was successfulA receipt for this purchase has been sent to your email.", textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 45,
              width: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go Back", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Summary", style: TextStyle(fontSize: 26)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order", style: TextStyle(fontSize: 17)),
                  Text("\$16.48"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Texes", style: TextStyle(fontSize: 17)),
                  Text("\$0.48"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery fee", style: TextStyle(fontSize: 17)),
                  Text("\$1.48"),
                ],
              ),
            ),
            Divider(
              indent: 26,
              endIndent: 26,
              color: Colors.white,
              thickness: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total :", style: TextStyle(fontSize: 17)),
                  Text("\$18.48"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated delivery time:",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text("\$18.48 - 11 mins"),
                ],
              ),
            ),
            Text("Payment Methods", style: TextStyle(fontSize: 26)),
            SizedBox(height: 24),
            Image.asset("assets/images/paymnet.png"),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(width: 12),
                Text("Save card details for future payments"),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total Price"),
                    SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$  ",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: "18.32",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: () => ShowSimpleDialog(context),
                  child: Container(
                    height: 65,
                    width: 180,

                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Play Now",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
