import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPagestate();
}

class _ProductDetailsPagestate extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.dark_mode_outlined, color: Color(0xFF0A0A0A)),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.only(right: 24.w, top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF1F1F1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: Color(0xFF16A34A),
                        size: 20.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.w),
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF1F1F1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.share,
                        color: Color(0xFF16A34A),
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/4/4c/Bananas.jpg",
                  width: double.infinity,
                  height: 214.h,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: double.infinity,
                      height: 214.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          strokeWidth: 1.w,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 24.w, top: 15.h),
              child: Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Color(0xFF000000),
                    size: 20.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "21 Min",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Organic Bananas",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  Material(
                    color: const Color(0xFF16A34A),
                    borderRadius: BorderRadius.circular(10.r),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.35),
                      highlightColor: Colors.white.withOpacity(0.2),
                      onTap: () {},
                      child: SizedBox(
                        width: 140.w,
                        height: 36.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 20.sp),
                            SizedBox(width: 6.w),
                            Text(
                              "Add",
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text.rich(
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
            ),
            Container(
              margin: EdgeInsets.only(left: 24.w, top: 10.h),
              child: Row(
                children: [
                  Text(
                    "View Product Details",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.arrow_drop_down, color: Color(0xFF16A34A)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoCard(Icons.refresh, "48 hours\nReplacement"),
                  InfoCard(Icons.support_agent, "24/7\nSupport"),
                  InfoCard(Icons.local_shipping, "Fast\nDelivery"),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            _highlightExpansion("Highlights"),
            SizedBox(height: 16.h),
            _infoExpansion("Info"),

            Container(
              margin: EdgeInsets.only(left: 20.w, top: 16.h),
              child: Text(
                "Vegetables",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0A0A0A),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            GridView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.66,
              ),
              itemBuilder: (context, index) {
                return VegitableCard();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget InfoCard(IconData icon, String text) {
    return Container(
      width: 110.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color.fromARGB(51, 74, 61, 254),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Color(0xFF000000)),
          SizedBox(height: 6.h),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _highlightExpansion(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFFEDEDED),
      ),
      child: ExpansionTile(
        backgroundColor: Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Color(0xFF000000),
          ),
        ),
        childrenPadding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        children: [
          _rowBuild(
            "Health benefits",
            "Contains Vitamin C, Potassium, starch, Potato helps in reducing inflammation, promote digestion and are good for skin., Supports Weight Loss",
          ),
          _rowBuild("Storage Temperature (degC)", "7-10 degC"),
        ],
      ),
    );
  }

  Widget _infoExpansion(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFFEDEDED),
      ),
      child: ExpansionTile(
        backgroundColor: Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: Color(0xFF000000),
          ),
        ),
        childrenPadding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
        children: [
          _rowBuild(
            "Description",
            "Potatoes can be included in your daily meals. They are rich source of Carbohydrates.",
          ),
          _rowBuild("Unit", "1kg"),
          _rowBuild("Shelf Life", "3 Days"),
          _rowBuild(
            "Disclaimer",
            "Every effort is made to maintain the accuracy of all information. However, actual product packaging and materials may contain more and/or different information. It is recommended not to solely rely on the information presented.",
          ),
          _rowBuild(
            "Customer Care Details",
            "The product is non-returnable. For a damaged, rotten or incorrect item, you can request a replacement within 48 hours of delivery. In case of an incorrect item, you may raise a replacement or return request only if the item is sealed/unopened/unused and in original condition.",
          ),
          _rowBuild(
            "Storage Tips",
            "Store the potatoes unwashed unless they are needed. Keep in wire baskets at room temperature.",
          ),
          _rowBuild("Seller", "ZOMATO HYPERPURE PRIVATE LIMITED"),
        ],
      ),
    );
  }

  Widget _rowBuild(String tite, String txt) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 124.w,
            child: Text(
              tite,
              style: GoogleFonts.inter(
                color: Color.fromARGB(178, 0, 0, 0),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              txt,
              style: GoogleFonts.inter(
                color: Color.fromARGB(178, 0, 0, 0),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VegitableCard extends StatelessWidget {
  const VegitableCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "https://images.unsplash.com/photo-1540420773420-3366772f4999",
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
