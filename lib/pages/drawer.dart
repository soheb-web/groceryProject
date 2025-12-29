import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {

  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width/1.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header (user profile या logo)
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xffFF6A2A),  // आपका orange theme
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'),  // optional
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome, User',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'user@example.com',
                  style: GoogleFonts.inter(color: Colors.white70, fontSize: 14.sp),
                ),
              ],
            ),
          ),

          // Menu Items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: ModalRoute.of(context)?.settings.name == '/',
            onTap: () {
              // Navigator.pop(context);  // drawer close
              // setState(() => bottomIndex = 0);  // अगर state access हो तो
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('My Listings'),
            onTap: () {
              Navigator.pop(context);
              // bottomIndex = 1; change करें (state access के लिए key use करें या provider)
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Call Us'),
            onTap: () {
              Navigator.pop(context);
              // bottomIndex = 2;
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Saved'),
            onTap: () {
              Navigator.pop(context);
              // bottomIndex = 3;
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Settings page पर navigate
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Logout logic
            },
          ),
        ],
      ),
    );
  }

}