import 'package:flutter/material.dart';
import 'package:shopping_cart/cake.dart';


class Cart extends StatefulWidget {
  final List<Cake> _cart;

  Cart(this._cart, {super.key});

  @override
  _CartState createState() => _CartState(_cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);

  List<Cake> _cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Icon(
                    item.icon,
                    color: item.color,
                  ),
                  title: Text(item.name),
                  trailing: GestureDetector(
                      child: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
    );
  }
}
