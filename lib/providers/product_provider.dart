import 'package:flutter/cupertino.dart';
import 'package:shopify_app/models/product.model.dart';

import '../seeder/data.seeder.dart';

class ProductProvider extends ChangeNotifier{
  List<Product> products=<Product>[];
  ProductProvider(){
    getDataFromJson();
  }


  void getDataFromJson() async {
    await DataSeeder.loadData();
    notifyListeners();
    products=DataSeeder.products;
  }


  void addProduct(Product newProduct){
    products.add(newProduct);
    notifyListeners();
  }
  void removeProduct(int productNum){
    products.removeAt(productNum);
    notifyListeners();
  }

  int get productsNum=>products.length;

  Product getProduct(int index){
    return products[index];

  }
  String? getProductName(int index){
    return products[index].name;

  }



}