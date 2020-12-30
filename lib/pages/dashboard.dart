import "package:flutter/material.dart";
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:shoes_store/pages/detail.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var category = [
    {"category_name": "Sneakers", "category_img": "shoes.png"},
    {"category_name": "Watch", "category_img": "watch.png"},
    {"category_name": "Backpack", "category_img": "backpack.png"},
  ];

  var products = [
    {
      "product_name": "Nike Air Max 20",
      "price": "240.000",
      "is_favorite": false,
      "discount": "30%",
      "rating": 5.0,
      "description": 'Built for natural motion',
      'size': ['40', '41', '42'],
      "product_img": "shoes1.jpg",
      "images": ['assets/shoes1.jpg', 'assets/shoes4.jpg', 'assets/shoes5.jpg'],
      "color": ['0XFFFF5733', '0XFF962C16', '0XFF150C5A'],
    },
    {
      "product_name": "Extee Sneaker",
      "price": "260.000",
      "is_favorite": true,
      "discount": "0%",
      "rating": 4.0,
      "description": 'Elastic for active people',
      'size': ['40', '41', '43'],
      "product_img": "shoes2.jpg",
      "images": ['assets/shoes2.jpg', 'assets/shoes3.jpg', 'assets/shoes7.jpg'],
      "color": ['0XFF150C5A', '0XFFFF5733', '0XFF962C16'],
    },
    {
      "product_name": "Air Max Motion 2",
      "price": "290.000",
      "is_favorite": false,
      "discount": "0%",
      "rating": 3.0,
      "description": 'Cozy and Stylish',
      'size': ['40', '40.5', '42'],
      "product_img": "shoes3.jpg",
      "images": ['assets/shoes3.jpg', 'assets/shoes7.jpg', 'assets/shoes8.jpg'],
      "color": ['0XFFFF5733', '0XFF150C5A', '0XFF962C16'],
    },
    {
      "product_name": "Leather Sneaker",
      "price": "270.000",
      "is_favorite": false,
      "discount": "40%",
      "rating": 4.5,
      "description": 'Built with hearth',
      'size': ['39', '41', '42'],
      "product_img": "shoes4.jpg",
      "images": ['assets/shoes4.jpg', 'assets/shoes1.jpg', 'assets/shoes3.jpg'],
      "color": ['0XFFFF5733', '0XFF962C16', '0XFF150C5A'],
    },
  ];

  var currentCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 24),
              children: <TextSpan>[
                TextSpan(text: "X", style: TextStyle(color: Colors.purple)),
                TextSpan(text: "E", style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white10,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.grid_view, color: Colors.black),
            onPressed: () {},
          ),
        ),
        backgroundColor: Colors.white10,
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Our Products",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    Row(
                      children: [
                        Text("Sort by",
                            style: TextStyle(color: Colors.grey, fontSize: 14)),
                        Icon(Icons.arrow_drop_down, color: Colors.grey)
                      ],
                    )
                  ]),
              Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      var categ = category[index];
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentCategory = index;
                            });
                          },
                          child: Container(
                              margin:
                                  EdgeInsets.only(right: 10, top: 5, bottom: 5),
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 25),
                              decoration: currentCategory == index
                                  ? BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    )
                                  : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 8),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Image.asset(
                                          'assets/' + categ['category_img'])),
                                  Text(
                                    categ["category_name"],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              )));
                    },
                  )),
              Container(
                  height: 518,
                  margin: EdgeInsets.only(top: 25),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var product = products[index];
                      if (currentCategory != 0) {
                        return null;
                      }
                      return GestureDetector(
                          onTap: () async {
                            var result = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Detail(data: product);
                            }));
                            if (result != null) {
                              setState(() {});
                            }
                          },
                          child: Container(
                              height: 300,
                              padding: EdgeInsets.all(10),
                              margin: index.isEven
                                  ? EdgeInsets.only(bottom: 16, right: 8)
                                  : EdgeInsets.only(bottom: 16, left: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      product['discount'] != '0%'
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                  color: Colors.cyan,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Text(product['discount'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12)))
                                          : Container(),
                                      Icon(Icons.favorite,
                                          color: product['is_favorite'] == true
                                              ? Colors.red
                                              : Colors.grey)
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Image.asset(
                                          'assets/' + product['product_img'],
                                          height: 100)),
                                  Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 10),
                                      child: Text(product['product_name'],
                                          style: TextStyle(fontSize: 16))),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Text('Rp ' + product['price'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))),
                                  RatingBar(
                                    rating: product['rating'],
                                    icon: Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    starCount: 5,
                                    spacing: 2.0,
                                    size: 20,
                                    isIndicator: false,
                                    allowHalfRating: false,
                                    color: Colors.yellow,
                                  )
                                ],
                              )));
                    },
                  ))
            ])));
  }
}
