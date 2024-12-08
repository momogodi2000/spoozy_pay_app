import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ViewModel/menu/menu_view_model.dart';
import '../../widgets/header/BottomNavBar.dart';
import '../../widgets/header/top_nav_bar.dart';
import 'menu_card.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 600;
    final menuViewModel = Provider.of<MenuViewModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF5C6BC0),
      drawer: TopNavBar.buildDrawer(context, isSmallScreen),
      body: SafeArea(
        child: Column(
          children: [
            TopNavBar(
              title: 'More',
              onMenuPressed: _toggleDrawer,
            ),
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF5C6BC0), Colors.white],
                    ),
                  ),
                  child: _buildMenuGrid(menuViewModel, isSmallScreen),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AnimatedBottomNavBar(),
    );
  }

  Widget _buildMenuGrid(MenuViewModel menuViewModel, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isSmallScreen ? 2 : 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isSmallScreen ? 1.0 : 1.2,
        ),
        itemCount: menuViewModel.items.length,
        itemBuilder: (context, index) {
          final item = menuViewModel.items[index];
          return MenuCard(
            item: item,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Tapped on ${item.title}"),
                  backgroundColor: const Color(0xFF5C6BC0),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMenuItemCard(dynamic item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Tapped on ${item.title}"),
                backgroundColor: const Color(0xFF5C6BC0),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5C6BC0).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.icon,
                    color: const Color(0xFF5C6BC0),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1F36),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}