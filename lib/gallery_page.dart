import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
  ]; // Daftar gambar yang berbeda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeri"),
        backgroundColor: const Color(0xFF6200EE),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: imageList.length, // Jumlah gambar
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Tindakan saat gambar ditekan
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Gambar ${index + 1} dipilih!'),
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(imageList[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
