import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.categoryName,
    this.categoryImg,
    this.products,
  });

  String categoryName;
  String categoryImg;
  List<Product> products;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
        categoryImg: json["category_img"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "category_img": categoryImg,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productName,
    this.price,
    this.isFavorite,
    this.discount,
    this.rating,
    this.productImg,
  });

  String productName;
  String price;
  bool isFavorite;
  String discount;
  int rating;
  String productImg;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"],
        price: json["price"],
        isFavorite: json["is_favorite"],
        discount: json["discount"],
        rating: json["rating"],
        productImg: json["product_img"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "price": price,
        "is_favorite": isFavorite,
        "discount": discount,
        "rating": rating,
        "product_img": productImg,
      };
}
