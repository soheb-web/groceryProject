import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realstate/pages/about.page.dart';
import 'package:realstate/pages/perticulerProperty.page.dart';

class PropertyPageCat extends StatefulWidget {
  @override
  _PropertyPageCatState createState() => _PropertyPageCatState();
}

class _PropertyPageCatState extends State<PropertyPageCat> {
  bool isBuy = true;

  List<Map<String, String>> buyCategories = [
    {
      "title": "HOUSE",
      "img":
          "https://images.unsplash.com/photo-1570129477492-45c003edd2be?auto=format",
    },
    {
      "title": "FLATS",
      "img":
          "https://images.unsplash.com/photo-1507089947368-19c1da9775ae?auto=format",
    },
    {
      "title": "DUPLEX",
      "img":
          "https://images.unsplash.com/photo-1572120360610-d971b9d7767c?auto=format",
    },
    {
      "title": "PLOTS",
      "img":
          "https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format",
    },
    {
      "title": "COMMERCIAL PROPERTIES",
      "img":
          "https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format",
    },
    {
      "title": "HOTELS",
      "img":
          "https://images.unsplash.com/photo-1542317854-2b4acb67c5cd?auto=format",
    },
    {
      "title": "CONDOS",
      "img":
          "https://images.unsplash.com/photo-1494526585095-c41746248156?auto=format",
    },
    {
      "title": "STUDIOS",
      "img":
          "https://images.unsplash.com/photo-1486304873000-235643847519?auto=format",
    },
  ];

  List<Map<String, String>> rentCategories = [
    {
      "title": "APARTMENTS",
      "img":
          "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format",
    },
    {
      "title": "ROOMS",
      "img":
          "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format",
    },
    {
      "title": "HOSTEL",
      "img":
          "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format",
    },
    {
      "title": "PG",
      "img":
          "https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?auto=format",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Buy Rent Property",
          style: TextStyle(
            color: Color(0xFFFF6725),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isBuy = true),
                  child: Container(
                    height: 50.h,
                    // padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isBuy ? Color(0xFFFF6725) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Buy",
                        style: TextStyle(
                          fontSize: 18,
                          color: isBuy ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isBuy = false),
                  child: Container(
                    height: 50.h,
                    // padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: !isBuy ? Color(0xFFFF6725) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Rent",
                        style: TextStyle(
                          fontSize: 18,
                          color: !isBuy ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).paddingAll(16),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.12,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: isBuy ? buyCategories.length : rentCategories.length,
              itemBuilder: (context, i) {
                var data = isBuy ? buyCategories[i] : rentCategories[i];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => PerticulerPropertyPage(),
                      ),
                    );
                  },
                  child: cardWidget(data["title"]!, data["img"]!),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(

        elevation: 8,
        backgroundColor: const Color(0xff27D045),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.r),
        ),
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => AboutUsPage()),
          );
        },
        icon: SvgPicture.asset("assets/Svg/whatsapp.svg"),
        label: Text(
          "Let’s Connect",
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget cardWidget(String title, String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

extension PaddingExt on Widget {
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}
