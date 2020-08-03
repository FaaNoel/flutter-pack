import 'package:Item_crew/models/Item.dart';
import 'package:Item_crew/screens/home/Item_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {

    final Items = Provider.of<List<Item>>(context) ?? [];

    return ListView.builder(
      itemCount: Items.length,
      itemBuilder: (context, index) {
        return ItemTile(Item: Items[index]);
      },
    );
  }
}