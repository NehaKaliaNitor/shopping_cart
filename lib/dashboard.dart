import 'package:flutter/material.dart';
import 'package:shopping_cart/cake.dart';
import 'package:shopping_cart/cart.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Cake> _cakes = <Cake>[];

  final List<Cake> _cartList = <Cake>[];

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  const Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _cakes.length,
      itemBuilder: (context, index) {
        var item = _cakes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Icon(
                item.icon,
                color: item.color,
              ),
              title: Text(item.name),
              trailing: GestureDetector(
                child: (!_cartList.contains(item))
                    ? const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                )
                    : const Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ),
                onTap: () {
                  setState(() {
                    if (!_cartList.contains(item)) {
                      _cartList.add(item);
                    } else {
                      _cartList.remove(item);
                    }
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _cakes.length,
        itemBuilder: (context, index) {
          var item = _cakes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_cartList.contains(item))
                            ? Colors.grey
                            : item.color,
                        size: 100.0,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        )
                            : const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item)) {
                              _cartList.add(item);
                            } else {
                              _cartList.remove(item);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Cake>[
      Cake(
        name: 'Chocolate Strawberry Cake',
        icon: Icons.cake,
        color: Colors.amber,
      ),
      Cake(
        name: 'Royal Chocolate Cake',
        icon: Icons.cake_sharp,
        color: Colors.deepOrange,
      ),
      Cake(
        name: 'Red Velvet Cake',
        icon: Icons.cake_rounded,
        color: Colors.brown,
      ),
      Cake(
        name: 'Butterscotch Cake',
        icon: Icons.cake_rounded,
        color: Colors.green,
      ),
      Cake(
        name: 'Blueberry cake',
        icon: Icons.cake_outlined,
        color: Colors.purple,
      ),
      Cake(
        name: 'Pineapple cake',
        icon: Icons.cake_outlined,
        color: Colors.blueGrey,
      ),
    ];

    setState(() {
      _cakes = list;
    });
  }
}