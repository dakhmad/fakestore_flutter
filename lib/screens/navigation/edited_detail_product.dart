import 'package:fakestore_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/product.dart';

class EditDetailProductListItemScreen extends StatelessWidget {
  final Products item;

  EditDetailProductListItemScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String harga = item.price.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FakeStore App",
          style: GoogleFonts.dmSerifDisplay(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(item.image, height: 200),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        textAlign: TextAlign.left,
                        batasText(item.title),
                        style: gayaTextPrimary,
                      ),
                      SizedBox(width: 40),
                      Text("\$$harga", style: gayaTextHarga),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(textAlign: TextAlign.left, item.category),
                        SizedBox(height: 8),
                        Text(textAlign: TextAlign.justify, item.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String batasText(String title) {
  return title.length > 25 ? title.substring(0, 25) + '...' : title;
}
