import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopps/providers/product.provider.dart';
import 'package:shopps/providers/products.provider.dart';
import 'package:shopps/screens/edit-product-screen.dart';
import 'package:shopps/utils/GlobalScaffoldKey.dart';

class UserProductItem extends StatelessWidget {
  final Product product;

  const UserProductItem(this.product);

  AlertDialog buildConfirmDialog(
      BuildContext parentCtx, BuildContext builderCtx) {
    return AlertDialog(
      title: const Text(
        'Are you sure you want to Delete this item?',
        textAlign: TextAlign.center,
      ),
      content: const Text(
        'This action will remove the item and it can\'t be undone',
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(builderCtx).pop(false);
          },
          child: const Text(
            'No',
            style: const TextStyle(color: Colors.red),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(builderCtx).pop(true);
          },
          child: const Text('Yes'),
          color: Theme.of(parentCtx).accentColor,
        )
      ],
    );
  }

  void onProductDelete(BuildContext context, String productId) {
    showDialog(
      context: context,
      builder: (ctx) => this.buildConfirmDialog(context, ctx),
    ).then((result) {
      Provider.of<Products>(context, listen: false)
          .delete(productId)
          .catchError((_) {
        GlobalScaffoldKey.instance.showGlobalSnackbar(
          SnackBar(
            content: Text("Item couldn't be deleted"),
            backgroundColor: Colors.red,
          ),
        );
      });
    });
  }

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
                                  onPressed: () {
                                    this.onProductDelete(
                                        context, this.product.id);
                                  },
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
