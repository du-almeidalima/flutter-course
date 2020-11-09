import 'package:flutter/material.dart';
import 'package:shopps/providers/cart.provider.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.only(right: 10),
        leading: Image.network(
          this.item.product.imageUrl,
          width: 100,
          height: 200,
          fit: BoxFit.cover,
        ),
        title: Text(
          this.item.product.title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Unit: \$${this.item.product.price}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${this.item.product.price * this.item.quantity}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Amount: ${this.item.quantity}')
          ],
        ),
      ),
    );
  }
}
