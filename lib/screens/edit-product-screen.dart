import 'package:flutter/material.dart';
import 'package:shopps/providers/product.provider.dart';

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
  // A GlobalKey is useful for tackling into the State of another Widget
  final _form = GlobalKey<FormState>();

  var _editedProduct = Product.empty();

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
      if (this._productImageUrlController.text.isEmpty) {
        // Marking the widget to repaint
        setState(() {});
      } else if (this.validateImageUrl(_productImageUrlController.text) ==
          null) {
        return;
      }
    }
  }

  void _saveForm() {
    this._form.currentState.validate();
    // This will trigger every control inside this form
    this._form.currentState.save();
    print(this._editedProduct.toString());
  }

  String validateEmpty(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }

    return null;
  }

  String validatePrice(String value) {
    if (this.validateEmpty(value) == null) {
      if (double.tryParse(value) == null) {
        return 'Please enter a valid number';
      }
      if (double.parse(value) < 0) {
        return 'Please enter a number greater than zero';
      }

      return null;
    }

    return "This field is required";
  }

  String validateImageUrl(String value) {
    if(value.isEmpty) {
      return 'This field is required';
    }

    if (!value.startsWith('https') && !value.startsWith('http')) {
      return 'Please enter a valid link';
    }

    if (!value.contains(RegExp('\.(?:png|jpg|jpeg|bmp)'))) {
      return 'Please enter a valid image URL.';
    }

    return null;
  }

  Widget buildImageOrText() {
    final value = this._productImageUrlController.text;
    return value.isEmpty
        ? Center(child: Text('Enter a URL'))
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
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: this._saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: this._form,
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
                  onSaved: (value) {
                    this._editedProduct =
                        this._editedProduct.copyWith(title: value);
                  },
                  validator: this.validateEmpty,
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
                  onSaved: (value) {
                    this._editedProduct = this
                        ._editedProduct
                        .copyWith(price: double.parse(value));
                  },
                  validator: this.validatePrice,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  focusNode: this._descriptionFocusNode,
                  onSaved: (value) {
                    this._editedProduct =
                        this._editedProduct.copyWith(description: value);
                  },
                  validator: this.validateEmpty,
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
                        onFieldSubmitted: (_) {
                          this._saveForm();
                        },
                        onSaved: (value) {
                          this._editedProduct =
                              this._editedProduct.copyWith(imageUrl: value);
                        },
                        validator: this.validateImageUrl,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 15),
                      padding: EdgeInsets.all(5),
                      width: 150,
                      height: 100,
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
