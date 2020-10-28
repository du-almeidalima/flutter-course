import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChartBar extends StatelessWidget {
  final String _label;
  final double _amount;
  final double _greatestAmountPercentage;

  ChartBar(this._label, this._amount, this._greatestAmountPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: <Widget>[
          // Fix bars being uneven when text is shrunk
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            height: constraint.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${this._amount.toStringAsFixed(0)}'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: constraint.maxHeight * 0.05, horizontal: 0),
            height: constraint.maxHeight * 0.6,
            width: 10,
            // Places elements on top of each other
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: this._greatestAmountPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: constraint.maxHeight * 0.15,
            child: FittedBox(
              child: Text(this._label),
            ),
          )
        ],
      );
    });
  }
}
