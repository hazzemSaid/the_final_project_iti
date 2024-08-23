import 'dart:convert';

import 'package:http/http.dart' as http;
import '/servies/product.dart';

class Apicall {
  //https://shoes-collections.p.rapidapi.com/shoes
  Future<List<Product>> getAllItems() async {
    var url = Uri.parse('https://shoes-collections.p.rapidapi.com/shoes');
    var response = await http.get(url, headers: {
      'x-rapidapi-key': '4900da423dmsh28d468cb4fcca8dp1df97bjsnee3c7ba27386',
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
}
