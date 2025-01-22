import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.productName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  product.productDescription,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),

                            // Add to Cart button
                            ElevatedButton(
                              onPressed: () {
                                 // Function to add product to cart
                                cartController.addToCart(controller.products[index]);
                              },
                              child: Text("Add to Cart"),
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.teal, // Button color
                                // onPrimary: Colors.white, // Text color
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(
                builder: (cartController){
                  return Text(
                    'Total amount: \$ ${cartController.totalPrice}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  );
                }),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
        icon:Icon(Icons.add_shopping_cart) ,
        label: GetX<CartController>(builder: (cartController){
          return Text(cartController.count.toString());
    }),
    ));
  }
}
