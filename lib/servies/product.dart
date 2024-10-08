import 'dart:math';

class Product {
  /*{
        "id": 1,
        "name": "Wild Rider Layers Unisex Sneakers",
        "price": 121,
        "image": "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/380697/02/sv01/fnd/IND/fmt/png/,Wild-Rider-Layers-Unisex-Sneakers",
        "description": "With design elements inspired by the movement and motion of city life, the Wild Rider Layers Unisex Sneakers brings a fresh new dimension to the iconic Rider family. We've layered a rich mix of premium leather, suede and hairy suede onto a nylon upper to create texture and a raw edgy look that is pure street. The IMEVA midsole and rubber outsole ensure combined lightweight comfort and great traction to take you forward, further and faster through your day and beyond.",
        "quantity": 1,
        "rating": {
            "rate": 3.9,
            "count": 120
        }*/
  final int id;
  final String name;
  final String image;
  final String description;
  final String price;
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name']
          .toString()
          .substring(0, min(5, json['name'].toString().length)),
      image: json['image'],
      description: json['description'],
      price: "\$${json['price'].toString()}",
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
