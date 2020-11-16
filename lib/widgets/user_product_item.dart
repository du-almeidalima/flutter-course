import 'package:flutter/material.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:shopps/screens/edit-product-screen.dart';

class UserProductItem extends StatelessWidget {
  final Product product;

  const UserProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 125,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Wrap(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      EditProductScreen.routeName,
                                      arguments: this.product,
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                  iconSize: 18,
                                  constraints: BoxConstraints.tight(
                                    const Size(40, 30),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                  iconSize: 18,
                                  constraints: BoxConstraints.tight(
                                    const Size(40, 30),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        Text(
                          product.description,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
