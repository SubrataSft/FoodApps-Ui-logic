import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        actions: const [
          Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.search)),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.product["img"],
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              widget.product["name"],
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            Text(
              widget.product["sub"],
              style:  TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                 Icon(Icons.star, color: Colors.orange, size: 20),
                 SizedBox(width: 4),
                Text(
                  widget.product["rating"].toString(),
                  style:  TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text(
              widget.product["details"].toString(),
              style:  TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                  Text("Spicy"),
                    Divider(
                      thickness: 12,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.redAccent,
                    ),

                    Text("Mis",style: TextStyle(color: Colors.green),),
                  ],
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (count > 1) count--;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$count",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (count < 20) count++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(8),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      "\$ ${(10 * count).toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "OrderNow",
                      style: TextStyle(color: Colors.white),
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
