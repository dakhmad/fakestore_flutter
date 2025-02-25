import 'package:fakestore_flutter/screens/navigation/detail_product_list_view_screen.dart';
import 'package:fakestore_flutter/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/product.dart';
import '../../services/api_services.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Products>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FakeStore App",
          style: GoogleFonts.dmSerifDisplay(color: Colors.black),
        ),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: FutureBuilder<List<Products>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No Data"));
          } else {
            List<Products> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Products product = products[index];
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.network(product.image),
                    ),
                  ),
                  title: Text(product.title),
                  subtitle: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(2)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1.0, bottom: 1, left: 2, right: 2),
                          child: Text(product.category, style: gayaTextKecil),
                        )
                      ),
                      SizedBox(width: 6),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(2)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 1.0, bottom: 1, left: 2, right: 2),
                            child: Text("\$${product.price.toString()}", style: gayaTextKecil),
                          )
                      ),
                    ],
                  ),
                  onTap: () {
                    // log("Indeks ke $index ditekan");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailProductListItemScreen(
                              item: products[index],
                            ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
