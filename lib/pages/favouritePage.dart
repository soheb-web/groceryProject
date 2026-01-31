import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/productDetailsPage.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.66,
                ),
                itemBuilder: (context, index) {
                  return _favoutireCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _favoutireCard() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductDetailsPage()),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Stack(
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/4/4c/Bananas.jpg",
                    height: 100.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 100.h,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 1.w,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 8.h,
                    left: 6.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF16A34A),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        "10% OFF",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Organic Bananas",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.star, size: 15.sp, color: Color(0xFFFDC700)),
              SizedBox(width: 4.w),
              Text(
                "4.8",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: Color(0xFF737373),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\$2.99 ",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: const Color(0xFF16A34A),
                    fontWeight: FontWeight.w600, // price bold
                  ),
                ),
                TextSpan(
                  text: "per lb",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: Color(0xFF737373), // unit light
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: 35.h,
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF16A34A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ).copyWith(
                    splashFactory: InkRipple.splashFactory, // 👈 ripple effect
                    overlayColor: MaterialStateProperty.all(
                      Colors.white.withOpacity(0.2), // 👈 ripple color
                    ),
                  ),
              onPressed: () {},
              child: Text(
                "+ Add",
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
