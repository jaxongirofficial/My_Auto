import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_auto/pages/profil_page.dart';
import 'cardetail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  int _currentIndex = 0;

  final List<Map<String, String>> _cars = [
    {
      "image":
          "https://uzautomotors.com/images/uploads/a35dd4bc6d3786affb92a6a5b7e8f79a.jpg",
      "name": "Chevrolet Malibu 2",
      "desc": "Old bufer, original",
      "price": "600 USD",
      "location": "Tashkent",
      "date": "26.09.2025",
    },
    {
      "image": "https://avtoremont.uz/d/novaya-hyundai-sonata-2021.jpg",
      "name": "Hyundai Sonata N Line",
      "desc": "Orqa faralar komplekti",
      "price": "750 USD",
      "location": "Samarkand",
      "date": "20.09.2025",
    },
    {
      "image":
          "https://di-uploads-pod37.dealerinspire.com/stevelanderskia/uploads/2022/03/Screen-Shot-2022-03-29-at-3.44.22-PM.png",
      "name": "Kia K5",
      "desc": "Kapot, holati a'lo",
      "price": "500 USD",
      "location": "Andijan",
      "date": "10.09.2025",
    },
    {
      "image":
          "https://i.ytimg.com/vi/DTlmlnA2H5U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCuj1uSu-RxOUct_RKQB1GQ3nsYfA",
      "name": "Toyota Camry",
      "desc": "Old bamper original",
      "price": "620 USD",
      "location": "Bukhara",
      "date": "02.10.2025",
    },
    {
      "image":
          "https://images.dealersync.com/2520/Photos/545250/20200708024755091_IMG_1565.jpg?_=932ac36572e8d9cc02744cf045fb787ceaef0a90",
      "name": "Chevrolet Malibu 1",
      "desc": "Orqa eshik komplekti",
      "price": "580 USD",
      "location": "Namangan",
      "date": "15.08.2025",
    },
    {
      "image":
          "https://kluz-photos.kcdn.online/kluz-content/49fac100-c9b1-493c-89d1-df2430fd44c7-960x540.jpg",
      "name": "Chevrolet Onix",
      "desc": "Fara chap tomoni",
      "price": "300 USD",
      "location": "Jizzakh",
      "date": "05.10.2025",
    },
    {
      "image":
          "https://hips.hearstapps.com/hmg-prod/images/2024-hyundai-elantra-n-lightning-lap-2025-178-67b0a408c7cd0.jpg?crop=0.590xw:0.498xh;0.232xw,0.310xh&resize=2048:*",
      "name": "Hyundai Elantra",
      "desc": "Kapot, yangi",
      "price": "550 USD",
      "location": "Fergana",
      "date": "22.09.2025",
    },
    {
      "image":
          "https://cimg3.ibsrv.net/ibimg/hgm/1920x1080-1/100/846/2022-kia-stinger_100846251.jpg",
      "name": "Kia Stinger",
      "desc": "Orqa bamper",
      "price": "700 USD",
      "location": "Nukus",
      "date": "01.09.2025",
    },
    {
      "image":
          "https://guangcaiauto.com/wp-content/uploads/2024/09/Haval-H6-2024-appearance-1.webp",
      "name": "Haval H6",
      "desc": "Eshik oynasi",
      "price": "450 USD",
      "location": "Khiva",
      "date": "11.08.2025",
    },
    {
      "image":
          "https://cdn.dealeraccelerate.com/cam/34/2142/98190/1920x1440/1986-buick-regal",
      "name": "Buick Regal",
      "desc": "Salon detallari",
      "price": "900 USD",
      "location": "Termez",
      "date": "17.09.2025",
    },
  ];

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) _searchController.clear();
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getBodyContent(int index) {
    switch (index) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 1.0,
                ),
                items: [
                  _buildCarouselImage(
                    'https://orientrentcar.uz/wp-content/uploads/2023/11/2-2-1.jpg',
                  ),
                  _buildCarouselImage(
                    'https://hips.hearstapps.com/hmg-prod/images/2025-kia-k8-front-66b61ab3d0ce3.jpg',
                  ),
                  _buildCarouselImage(
                    'https://static.tildacdn.one/tild6636-6530-4665-a530-626636666563/25761668.jpg',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildBrandItem(
                      'https://part-car.ru/system/product_category_logos/833/hyundai_m_original.png?1434384730',
                      'Hyundai',
                    ),
                    _buildBrandItem(
                      'https://avatars.mds.yandex.net/i?id=2759b122925bd10ed937cd380ae02228f347465c-5235164-images-thumbs&n=13',
                      'Chevrolet',
                    ),
                    _buildBrandItem(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/BYD_Company%2C_Ltd._-_Logo.svg/330px-BYD_Company%2C_Ltd._-_Logo.svg.png',
                      'BYD',
                    ),
                    _buildBrandItem(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Toyota_EU.svg/346px-Toyota_EU.svg.png',
                      'Toyota',
                    ),
                    _buildBrandItem(
                      'https://static.tildacdn.com/tild3033-6132-4166-b364-613765316363/06.png',
                      'Kia',
                    ),
                    _buildBrandItem(
                      'https://avatars.mds.yandex.net/i?id=cd145b6f9be25a465e6d69dababdc32856b0a53f-10414552-images-thumbs&n=13',
                      'Haval',
                    ),
                    _buildBrandItem(
                      'https://w7.pngwing.com/pngs/346/679/png-transparent-car-chery-tiggo-tata-motors-jac-motors-car-angle-emblem-trademark-thumbnail.png',
                      'Chery',
                    ),
                    _buildBrandItem(
                      'https://wumbo.net/symbols/plus/feature.png',
                      'More',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Deals",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: Color.fromARGB(255, 23, 110, 232),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _cars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    final car = _cars[index];
                    return _buildDealCard(
                      imageUrl: car["image"]!,
                      name: car["name"]!,
                      desc: car["desc"]!,
                      price: car["price"]!,
                      location: car["location"]!,
                      date: car["date"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        );

      case 1:
        return const Center(child: Text("Coming Soon..."));
      case 2:
        return const Center(child: Text("Add Page"));
      case 3:
        return const Center(child: Text("Services Page"));
      case 4:
        return const ProfilePage();
      default:
        return const Center(child: Text("Unknown Page"));
    }
  }

  Widget _buildDealCard({
    required String imageUrl,
    required String name,
    required String desc,
    required String price,
    required String location,
    required String date,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        final selectedName = name;

        final others = _cars.where((car) => car['name'] != selectedName).map((
          car,
        ) {
          return {
            'imageUrl': car['image'] ?? '',
            'name': car['name'] ?? '',
            'price': car['price'] ?? '',
          };
        }).toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailPage(
              imageUrl: imageUrl,
              name: name,
              desc: desc,
              price: price,
              location: location,
              date: date,
              otherListings: others,
              relatedProducts: others,
            ),
          ),
        );
      },

      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 110,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    height: 110,
                    child: const Center(child: Icon(Icons.broken_image)),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      location,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.access_time, size: 14),
                  const SizedBox(width: 4),
                  Text(date, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                desc,
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                price,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselImage(String url) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              height: 200,
              child: const Center(child: Icon(Icons.broken_image)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBrandItem(String url, String name) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: brightness == Brightness.dark
                        ? Colors.white54
                        : Colors.black54,
                  ),
                ),
                style: TextStyle(
                  color: brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              )
            : const Text(
                "Garage",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: _getBodyContent(_currentIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 9, 100, 227),
        color: Theme.of(context).scaffoldBackgroundColor,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.widgets_outlined),
            label: 'Orders',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.settings),
            label: 'Services',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Profile',
          ),
        ],
        onTap: _onNavItemTapped,
      ),
    );
  }
}
