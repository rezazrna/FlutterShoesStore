import 'package:flutter/material.dart';
import 'package:carousel_images/carousel_images.dart';

class Detail extends StatefulWidget {
  var data;

  Detail({this.data});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  var selectedSize = 0;
  var selectedColor = 0;

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
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Container(
              child: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.favorite,
                    color:
                        widget.data['is_favorite'] ? Colors.red : Colors.grey))
          ],
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.data['discount'] != '0%'
                    ? Container(
                        margin: EdgeInsets.only(top: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(widget.data['discount'],
                            style:
                                TextStyle(color: Colors.black, fontSize: 14)))
                    : Container(),
                Container(
                    margin: EdgeInsets.only(top: 35),
                    child: CarouselImages(
                      listImages: widget.data['images'],
                      height: 300.0,
                    )),
                Expanded(
                  child: Container(),
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 360,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.data['product_name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                        '(' +
                                            widget.data['rating'].toString() +
                                            ')',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14)),
                                  ],
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            margin: EdgeInsets.only(top: 15),
                            child: Text(widget.data['description'],
                                style: TextStyle(fontSize: 15))),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            margin: EdgeInsets.only(top: 35),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: Text('Size',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ))),
                                Container(
                                    width: 330,
                                    height: 40,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.data['size'].length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedSize = index;
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 25),
                                                decoration: BoxDecoration(
                                                  color: selectedSize == index
                                                      ? Colors.lightBlue
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    widget.data['size'][index],
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ));
                                        }))
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            margin: EdgeInsets.only(top: 35),
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: Text('Available Color',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ))),
                                Container(
                                    width: 260,
                                    height: 40,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget.data['color'].length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedColor = index;
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0,
                                                    horizontal: 25),
                                                decoration: selectedColor ==
                                                        index
                                                    ? BoxDecoration(
                                                        color: Color(int.parse(
                                                            widget.data['color']
                                                                [index])),
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          new BoxShadow(
                                                            color: Color(
                                                                int.parse(widget
                                                                            .data[
                                                                        'color']
                                                                    [index])),
                                                            blurRadius: 10.0,
                                                          ),
                                                        ],
                                                      )
                                                    : BoxDecoration(
                                                        color: Color(int.parse(
                                                            widget.data['color']
                                                                [index])),
                                                        shape: BoxShape.circle),
                                              ));
                                        })),
                              ],
                            )),
                        Expanded(child: Container()),
                        Container(
                            padding: EdgeInsets.all(18),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Text('Rp ' + widget.data['price'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25))),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(right: 7),
                                            child: Icon(
                                                Icons.add_shopping_cart_rounded,
                                                color: Colors.purple)),
                                        Text('Add To Cart',
                                            style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 12,
                                            ))
                                      ],
                                    ))
                              ],
                            ))
                      ],
                    )),
              ],
            )));
  }
}
