import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/product.dart';

class EditDetailProductListItemScreen extends StatelessWidget {
  final Products item;

  EditDetailProductListItemScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FakeStore App",
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.lightGreenAccent,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: Image.network(
          //       item.image,
          //       width: 200,
          //     ),
          // ),
          Row(
            children: [
              Column(
                children: [
                  Text(item.title),
                  Text(item.category),
                ],
              ),
              Column(
                children: [
                  Text(item.description),
                  Text("${item.price}"),
                ],
              ),

            ],
          )
        ],
      ),
    );
  }
}