import 'package:flutter/material.dart';
import 'package:food_apps/product_Details_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavIndex = 0;
  int categoryIndex = 0;

  List<Map<String, dynamic>> favoriteProducts = [];

  final List<String> categories = ["All", "Combos", "Sliders", "Classic"];

  final List<Map<String, dynamic>> products = [
    {
      "name": "Cheeseburger",
      "sub": "Wendy’s Burger",
      "rating": 4.9,
      "img": "assets/images/b1.png",
      "details": "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      "isFavorite": false,
    },
    {
      "name": "Hamburger",
      "sub": "Veggie Burger",
      "rating": 4.9,
      "img": "assets/images/b2.png",
      "details":"Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ",
      "isFavorite": false,
    },
    {
      "name": "Chicken Burger",
      "sub": "Chicken Burger",
      "rating": 4.8,
      "img": "assets/images/b3.png",
      "details":"Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!",
      "isFavorite": false,
    },
    {
      "name": "Mutton Burger",
      "sub": "Wendy’s Burger",
      "rating": 4.7,
      "img": "assets/images/b4.png",
      "details":"Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      "isFavorite": false,
    },
    {
      "name": "Crispy Burger",
      "sub": "Fried Chicken Burger",
      "rating": 4.6,
      "img": "assets/images/b1.png",
      "details":"Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.",
      "isFavorite": false,
    },
    {
      "name": "BBQ Burger",
      "sub": "Fried Chicken Burger",
      "rating": 4.6,
      "img": "assets/images/b4.png",
      "details":"Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ",
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(child: getPage()),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          print("Floating Button Pressed");
        },
        child: const Icon(Icons.add, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        color: Colors.red,
        shape: const CircularNotchedRectangle(),
        elevation: 20.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: bottomNavIndex == 0 ? Colors.black : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  bottomNavIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: bottomNavIndex == 1 ? Colors.black : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  bottomNavIndex = 1;
                });
              },
            ),
            const SizedBox(width: 60),
            IconButton(
              icon: Icon(
                Icons.messenger,
                color: bottomNavIndex == 2 ? Colors.black : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  bottomNavIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: bottomNavIndex == 3 ? Colors.black : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  bottomNavIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    switch (bottomNavIndex) {
      case 0:
        return homeTab();
      case 1:
        return const Center(
          child: Text("Profile Screen", style: TextStyle(fontSize: 22)),
        );
      case 2:
        return const Center(
          child: Text("Messenger Screen", style: TextStyle(fontSize: 22)),
        );
      case 3:
        return favoriteTab();

      default:
        return const Center(child: Text("Page not found"));
    }
  }

  Widget homeTab() {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo.png"),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/womanpic.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const Text(
            "Order your favourite food!",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: const Icon(Icons.tune, color: Colors.white, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = index == categoryIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      categoryIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 18,
                      vertical: 10,

                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              product["img"],
                              height: 90,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product["name"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green
                            ),
                          ),
                          Text(
                            product["sub"],
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    product["rating"].toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  product["isFavorite"] ? Icons.favorite : Icons
                                      .favorite_border,
                                  color: product["isFavorite"]
                                      ? Colors.red
                                      : Colors.black.withOpacity(0.7),
                                ),
                                onPressed: () {
                                  setState(() {
                                    product["isFavorite"] =
                                    !product["isFavorite"];
                                    if (product["isFavorite"]) {
                                      favoriteProducts.add(product);
                                    } else {
                                      favoriteProducts.remove(product);
                                    }
                                  });
                                },
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget favoriteTab() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Favorite Items",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: favoriteProducts.isEmpty
                ? const Center(child: Text("No favorites yet."))
                : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final item = favoriteProducts[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item["img"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item["sub"],
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 16, color: Colors.orange),
                                const SizedBox(width: 4),
                                Text(
                                  item["rating"].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            favoriteProducts.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }



}
