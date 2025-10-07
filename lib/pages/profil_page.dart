import 'package:flutter/material.dart';
import 'login_page.dart'; // 🔹 Login sahifasi uchun import

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final iconColor = isDark ? Colors.white70 : Colors.black87;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            // Profil rasmi, ism va raqam
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/024/183/525/non_2x/avatar-of-a-man-portrait-of-a-young-guy-illustration-of-male-character-in-modern-color-style-vector.jpg",
                  ),
                ),
                const SizedBox(width: 19),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jaxongir",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Text(
                      "+998770425777",
                      style: TextStyle(
                        color: isDark ? Colors.grey[400] : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Bo‘limlar
            _buildTile(
              Icons.shopping_bag_outlined,
              "My Orders",
              iconColor,
              textColor,
            ),
            _buildTile(
              Icons.build_outlined,
              "My Services",
              iconColor,
              textColor,
            ),
            _buildTile(
              Icons.inventory_2_outlined,
              "My Products",
              iconColor,
              textColor,
            ),
            const Divider(height: 30),

            // 🌐 Language tugmasi (bosganda bottom sheet ochiladi)
            ListTile(
              leading: Icon(Icons.language, color: iconColor),
              title: Text(
                "Language",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
              trailing: const Icon(Icons.flag),
              onTap: () {
                _showLanguageSelector(context, isDark);
              },
            ),

            _buildTile(Icons.mail_outline, "Contact Us", iconColor, textColor),
            _buildTile(
              Icons.privacy_tip_outlined,
              "Privacy Policy",
              iconColor,
              textColor,
            ),

            const Divider(height: 30),

            // 🔴 Logout tugmasi
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    IconData icon,
    String title,
    Color iconColor,
    Color textColor, {
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16)),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  // 🌍 Tillarni tanlash uchun bottom sheet
  void _showLanguageSelector(BuildContext context, bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Select Language",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // 🇺🇿 Uzbek
            ListTile(
              leading: const Text("🇺🇿", style: TextStyle(fontSize: 22)),
              title: const Text("O'zbek tili"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("O'zbek tili tanlandi")),
                );
              },
            ),

            // 🇷🇺 Russian
            ListTile(
              leading: const Text("🇷🇺", style: TextStyle(fontSize: 22)),
              title: const Text("Русский язык"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Русский язык выбран")),
                );
              },
            ),

            // 🇺🇸 English
            ListTile(
              leading: const Text("🇺🇸", style: TextStyle(fontSize: 22)),
              title: const Text("English"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("English selected")),
                );
              },
            ),

            const SizedBox(height: 15),
          ],
        );
      },
    );
  }
}
