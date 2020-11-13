import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/cart.provider.dart';


class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      // Direction is good for cheking multiple swipe actions
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).remove(item.product.id);
      },
      background: Container(
        color: Colors.red[400],
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
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
          subtitle: Text('Unit: \$${this.item.product.price.toStringAsFixed(2)}'),
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
      ),
    );
  }
}
