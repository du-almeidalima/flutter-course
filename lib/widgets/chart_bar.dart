import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _label;
  final double _amount;
  final double _greatestAmountPercentage;

  ChartBar(this._label, this._amount, this._greatestAmountPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Fix bars being uneven when text is shrunk
        Container(
          height: 18,
          child: FittedBox(
            child: Text('\$${this._amount.toStringAsFixed(2)}'),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
          height: 60,
          width: 10,
          // Places elements on top of each other
          child: Stack(
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
        Text(this._label)
      ],
    );
  }
}
