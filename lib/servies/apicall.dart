import 'dart:convert';

import 'package:http/http.dart' as http;

import '/servies/product.dart';

class Apicall {
  //https://shoes-collections.p.rapidapi.com/shoes
  Future<List<Product>> getProducts() async {
    var url = Uri.parse('https://shoes-collections.p.rapidapi.com/shoes');
    var response = await http.get(url, headers: {
      'x-rapidapi-key': 'a25938d939mshb768e52859c4874p1a03bcjsnbf4a5aee16e6',
      'x-rapidapi-host': 'shoes-collections.p.rapidapi.com'
    });
    List<Product> items;
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.
      items = (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
      return items;
    } else {
      throw Exception('Failed to load items');
    }
  }

  //sigle product
  Future<Product> getSingleProduct(String id) async {
    var url = Uri.parse('https://shoes-collections.p.rapidapi.com/shoes/$id');
    var response = await http.get(url, headers: {
      'x-rapidapi-key': 'a25938d939mshb768e52859c4874p1a03bcjsnbf4a5aee16e6',
      'x-rapidapi-host': 'shoes-collections.p.rapidapi.com'
    });
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load items');
    }
  }
}
