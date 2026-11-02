import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(), 
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Bagian Now Playing
              const Center(
                child: Text(
                  'Now Playing',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              
              // Widget Carousel Slider
       // Widget Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  height: 350.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.75,
                ),
                items: [
                  {
                    'img': 'https://media.themoviedb.org/t/p/w600_and_h900_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg', 
                    'title': 'Deadpool & Wolverine',
                    'desc': '2024 • Action'
                  },
                  {
                    'img': 'https://media.themoviedb.org/t/p/w600_and_h900_face/vqwxWFADURzHOD7gpErhrY994T.jpg', 
                    'title': 'Superman',
                    'desc': '2026 • Action/Sci-Fi'
                  },
                  {
                    'img': 'https://media.themoviedb.org/t/p/w600_and_h900_face/tv2mOIRcPP4H0DhOH84xPgqui7d.jpg', 
                    'title': 'Batman The Brave And The Bold',
                    'desc': '2008 • Action/Animation/Crime'
                  },
                ].map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Memanggil gambar dari variabel movie['img']
                            Image.network(movie['img']!, fit: BoxFit.cover), 
                            Positioned(
                              bottom: 0, left: 0, right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black87, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Memanggil teks judul dari variabel movie['title']
                                    Text(movie['title']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    // Memanggil teks deskripsi dari variabel movie['desc']
                                    Text(movie['desc']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30),

              // Bagian Kategori dengan daftar URL gambar masuk sebagai parameter kedua
              _buildCategorySection('Trending', [
                'https://media.themoviedb.org/t/p/w600_and_h900_face/2XSpKRWuZVgWGsoxxBzlwSLaBTD.jpg', //Badboys
                'https://media.themoviedb.org/t/p/w600_and_h900_face/nAU74GmpUk7t5iklEp3bufwDq4n.jpg', //A Quiet Place
                'https://media.themoviedb.org/t/p/w600_and_h900_face/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', //Joker
              ]),
              const SizedBox(height: 20),
              
              _buildCategorySection('Popular', [
                'https://media.themoviedb.org/t/p/w600_and_h900_face/c15BtJxCXMrISLVmysdsnZUPQft.jpg', //Fallout
                'https://media.themoviedb.org/t/p/w600_and_h900_face/9gC88zYUBARRSThcG93MvW14sqx.jpg', //Ghost In The Shell
                'https://media.themoviedb.org/t/p/w600_and_h900_face/fWVSwgjpT2D78VUh6X8UBd2rorW.jpg', //Demon Slayer
              ]),
              const SizedBox(height: 20),
              
              _buildCategorySection('Top Rated', [
                'https://media.themoviedb.org/t/p/w600_and_h900_face/9l1NuFjel2j89hiuiJbsxfblqjy.jpg', //Clayface
                'https://media.themoviedb.org/t/p/w600_and_h900_face/bRwnj8WEKBCvmfeUNOukJPwB43K.jpg', //Obssession
                'https://media.themoviedb.org/t/p/w600_and_h900_face/bRBeSHfGHwkEpImlhxPmOcUsaeg.jpg', //Avatar Fire and Ash
              ]),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Genre'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String title, List<String> imageUrls) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Text('More', style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: imageUrls.length, 
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrls[index], 
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}