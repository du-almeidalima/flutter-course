import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const String routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // The manual Focus mechanism seems to be unecessary in the current Flutter vesion.
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _productImageUrlFocusNode = FocusNode();
  final _productImageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // This listener is triggered verytime the Focus changes
    this._productImageUrlFocusNode.addListener(this._updateImageUrl);
  }

  @override
  void dispose() {
    super.dispose();
    this._priceFocusNode.removeListener(this._updateImageUrl);
    this._priceFocusNode.dispose();
    this._descriptionFocusNode.dispose();
    this._productImageUrlFocusNode.dispose();
    this._productImageUrlController.dispose();
  }

  void _updateImageUrl() {
    // Checking if it lost focus
    if (!this._productImageUrlFocusNode.hasFocus) {
      // Marking the widget to repaint
      setState(() {});
    }
  }

  Widget buildImageOrText() {
    final value = this._productImageUrlController.text;
    return value.isEmpty
        ? Text('Enter a URL')
        : FittedBox(
            fit: BoxFit.cover,
            child: Image.network(value),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(this._priceFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  focusNode: this._priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(this._descriptionFocusNode);
                  },
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  focusNode: this._descriptionFocusNode,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // TextFormField tries to take all the Width, and Row gives it to its
                    // Children
                    Expanded(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Product Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        focusNode: this._productImageUrlFocusNode,
                        controller: this._productImageUrlController,
                        onEditingComplete: () {
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 15),
                      padding: EdgeInsets.all(15),
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: buildImageOrText(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
