import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_apps/chat_page.dart';
import 'package:food_apps/favoriteItem_card.dart';
import 'package:food_apps/product_Details_Screen.dart';
import 'package:food_apps/product_card.dart';

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
      "details":
          "The Cheeseburger Wendy's Burger is a classic fast food burger...",
      "isFavorite": false,
    },
    {
      "name": "Hamburger",
      "sub": "Veggie Burger",
      "rating": 4.8,
      "img": "assets/images/b2.png",
      "details": "Enjoy our delicious Hamburger Veggie Burger...",
      "isFavorite": false,
    },
    {
      "name": "Chicken Burger",
      "sub": "Chicken Burger",
      "rating": 4.7,
      "img": "assets/images/b3.png",
      "details": "Our chicken burger is a delicious and healthier option...",
      "isFavorite": false,
    },
    {
      "name": "Mutton Burger",
      "sub": "Wendy’s Burger",
      "rating": 4.6,
      "img": "assets/images/b4.png",
      "details": "Indulge in our crispy and savory Fried Chicken Burger...",
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),),
          onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  Widget buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 12,
      color: Colors.red,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildBottomIcon(Icons.home, 0),
          buildBottomIcon(Icons.person, 1),
          const SizedBox(width: 60),
          buildBottomIcon(Icons.messenger, 2),
          buildBottomIcon(Icons.favorite, 3),
        ],
      ),
    );
  }

  Widget buildBottomIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: bottomNavIndex == index ? Colors.black : Colors.white,
        size: 30,
      ),
      onPressed: () {
        setState(() {
          bottomNavIndex = index;
        });
      },
    );
  }

  Widget getPage() {
    switch (bottomNavIndex) {
      case 0:
        return buildHomeTab();
      case 1:
        return buildProfileTab();
      case 2:
        return buildMassageTab();
      case 3:
        return buildFavoriteTab();
      default:
        return const Center(child: Text("Page not found"));
    }
  }

  Widget buildHomeTab() {
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
          const SizedBox(height: 10),
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
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                child: const Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),

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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
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
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
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
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      product["isFavorite"] = !(product["isFavorite"] ?? false);
                      if (product["isFavorite"]) {
                        favoriteProducts.add(product);
                      } else {
                        favoriteProducts.remove(product);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFavoriteTab() {
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
                      return FavoriteItemCard(
                        product: item,
                        onRemove: () {
                          setState(() {
                            item["isFavorite"] = false;
                            favoriteProducts.remove(item);
                          });
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileTab() {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 170),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 90,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: "Sophia Patel",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "sophiapatel@gmail.com",
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Delivery Address",
                            hintText: "123 Main St Apartment nikunjo 2 ",
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Password ",
                            hintText: "*********",
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),

                        SizedBox(height: 34),
                        Divider(
                          endIndent: 24,
                          indent: 24,
                          thickness: 4,
                          color: Colors.grey[45],
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payment Details"),
                              Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order History"),
                              Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.redAccent,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.edit_calendar,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.redAccent,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: const [
                                  Text(
                                    "Log Out",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.logout,
                                    color: Colors.redAccent,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/womens.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMassageTab() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                StaffMessage(text: "Hi, how can I help you?"),

                SizedBox(height: 16),

                CustomerMessage(
                  text:
                      "Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?",
                ),

                SizedBox(height: 16),

                StaffMessage(text: "Ok, please let me check!"),

                SizedBox(height: 16),

                CustomerMessage(text: "Sure..."),

                SizedBox(height: 16),

                StaffMessage(
                  text: "It'll get 25 minutes to arrive to your address",
                  showTime: true,
                ),
                SizedBox(height: 16),

                CustomerMessage(text: "Ok, thanks you for your support"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 8,
                  child: TextField(
                    decoration:InputDecoration(
                      prefixIcon: Icon(Icons.message),
                      hintText: "Enter your massage.....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    )
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Icon(Icons.send,color: Colors.blue,size: 38,))
              ],
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
