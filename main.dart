import 'package:flutter/material.dart';

// --- تطبيق 1907 Kora المتكامل لعام 2026 ---

void main() => runApp(Kora1907App());

class Kora1907App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '1907 Kora',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFB00000),
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        cardColor: const Color(0xFF1A1A1A),
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("مركز المباريات المباشرة (Live)")),
    Center(child: Text("توقعات المشجعين 1907")),
    Center(child: Text("الملف الشخصي")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFB00000),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'المباريات'),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: 'التوقعات'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120.0,
          floating: true,
          pinned: true,
          backgroundColor: const Color(0xFFB00000),
          flexibleSpace: FlexibleSpaceBar(
            title: Text("1907 KORA", style: TextStyle(fontWeight: FontWeight.black, letterSpacing: 1.5)),
            centerTitle: true,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("مباريات جارية الآن", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent)),
                const SizedBox(height: 10),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildLiveMatchCard("الأهلي", "صن داونز", "1 - 0", "75'"),
                      _buildLiveMatchCard("ليفربول", "ريال مدريد", "2 - 2", "40'"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text("آخر الأخبار - يناير 2026", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildNewsItem("انفجار في سوق الانتقالات: ميسي يعود للملاعب كمستشار فني", "منذ ساعتين"),
                _buildNewsItem("تغطية حصرية لمران النادي الأهلي قبل نهائي أفريقيا", "منذ 4 ساعات"),
                _buildNewsItem("تكنولوجيا 2026: الحكام الروبوتات تبدأ العمل في الدوري الإنجليزي", "منذ 6 ساعات"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLiveMatchCard(String h, String a, String s, String time) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(h, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(s, style: TextStyle(fontSize: 20, fontWeight: FontWeight.black)),
              Text(a, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Text("شاهد البث المباشر", style: TextStyle(fontSize: 12, color: Colors.white54)),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String time) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10))),
        title: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        subtitle: Text(time),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
