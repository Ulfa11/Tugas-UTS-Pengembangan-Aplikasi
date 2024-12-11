import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome
import 'gallery_page.dart'; // Import file GalleryPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/gallery': (context) => GalleryPage(), // Rute ke halaman galeri
      },
      home: const MyHomePage(), // Halaman utama
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'Ulfa Febrima',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: const Text('ulfafebrimatutupoho@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/pict.jpeg',
                    fit: BoxFit.cover,
                    width: 90,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.cyan,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://w0.peakpx.com/wallpaper/921/815/HD-wallpaper-pantai-summer-tropical.jpg',
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(
                    context); // Menutup drawer tanpa berpindah halaman
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album,
                  color: Color.fromARGB(255, 142, 204, 255)),
              title: const Text(
                'Galeri',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.pushNamed(
                    context, '/gallery'); // Navigasi ke halaman galeri
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.whatsapp,
                color: Color(0xFF25D366), // Ikon WhatsApp
              ),
              title: const Text(
                'WhatsApp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://wa.me/6281248577302');
                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  throw 'Tidak dapat membuka $url';
                }
              },
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.instagram,
                color: Color(0xFF8a3ab9), // Ikon Instagram
              ),
              title: const Text(
                'Instagram',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://www.instagram.com/ulfafebrimaa_/profilecard/?igsh=MXViMnNsNGx1dzRkaw==');
                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  throw 'Tidak dapat membuka $url';
                }
              },
            ),
            const Divider(),
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.redAccent,
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    content: const Text(
                      'Apakah Anda yakin ingin keluar?',
                      style: TextStyle(fontSize: 14),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Batal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: const Text(
                          'Keluar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/pict.jpeg',
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Ulfa Febrima',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mobile Application Engineer',
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Padding kiri dan kanan
              leading: const Icon(
                FontAwesomeIcons.microsoft, // Ikon Microsoft
                color: Colors.blue,
                size: 30,
              ),
              title: const Text(
                'Microsoft Office',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skill:',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Spasi antar teks
                  Text(
                    '- Microsoft Word\n'
                    '- Microsoft Excel\n'
                    '- Microsoft PowerPoint',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.fileWord,
                          color: Colors.blue,
                        ),
                        title: const Text('Microsoft Word'),
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://www.microsoft.com/en-us/microsoft-365/word');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw 'Tidak dapat membuka $url';
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.fileExcel,
                          color: Colors.green,
                        ),
                        title: const Text('Microsoft Excel'),
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://www.microsoft.com/en-us/microsoft-365/excel');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw 'Tidak dapat membuka $url';
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          FontAwesomeIcons.filePowerpoint,
                          color: Colors.orange,
                        ),
                        title: const Text('Microsoft PowerPoint'),
                        onTap: () async {
                          final Uri url = Uri.parse(
                              'https://www.microsoft.com/en-us/microsoft-365/powerpoint');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw 'Tidak dapat membuka $url';
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
