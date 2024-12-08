import 'package:flutter/material.dart';
import '../../ViewModel/profile/profile_view_model.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileViewModel viewModel = ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A62D2), Color(0xFF33B5E5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.blueAccent),
                  ),
                  SizedBox(height: 10),
                  Text(
                    viewModel.user.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    viewModel.user.email,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // Options
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.blueAccent),
                      title: Text('Personal Info'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => EditProfileScreen()),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.receipt_long, color: Colors.blueAccent),
                      title: Row(
                        children: [
                          Text('Invoices & Requests'),
                          SizedBox(width: 5),
                          Icon(Icons.info_outline, size: 16, color: Colors.blueAccent),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      onTap: () {
                        // Invoices logic
                      },
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      secondary: Icon(Icons.notifications, color: Colors.blueAccent),
                      title: Text('Notifications'),
                      value: viewModel.user.notificationsEnabled,
                      onChanged: (value) {
                        viewModel.toggleNotifications();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language, color: Colors.blueAccent),
                      title: Text('Language'),
                      trailing: DropdownButton<String>(
                        value: viewModel.user.language,
                        underline: SizedBox(),
                        items: ['English', 'French']
                            .map((lang) => DropdownMenuItem(
                          value: lang,
                          child: Text(lang),
                        ))
                            .toList(),
                        onChanged: (value) {
                          // Handle language change
                        },
                      ),
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      secondary: Icon(Icons.face, color: Colors.blueAccent),
                      title: Text('Face ID'),
                      value: viewModel.user.faceIdEnabled,
                      onChanged: (value) async {
                        await viewModel.toggleFaceId();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.redAccent),
                      title: Text(
                        'Log Out',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      onTap: () {
                        // Log out logic
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
