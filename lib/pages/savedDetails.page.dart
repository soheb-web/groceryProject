import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedDetailsPage extends StatelessWidget {
  final dynamic savedData; // Saved API ka pura object pass karein
  const SavedDetailsPage({super.key, required this.savedData});

  @override
  Widget build(BuildContext context) {
    final property = savedData;
    const primaryColor = Color(0xffFF6A2A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. Image Header with Back Button
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            backgroundColor: primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(property.uploadedPhotos[0], fit: BoxFit.cover),
                  // Gradient for text visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          // 2. Content Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${property.propertyType} in ${property.city}",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16.sp,
                                  color: primaryColor,
                                ),
                                Text(
                                  property.propertyAddress,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "₹${property.price}",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 40),

                  // 3. Quick Info (Icons Row)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoIcon(
                        Icons.king_bed_outlined,
                        "Beds",
                        "N/A",
                      ), // Agar data ho toh dikhaye
                      _buildInfoIcon(
                        Icons.bathtub_outlined,
                        "Baths",
                        property.bathrooms,
                      ),
                      _buildInfoIcon(
                        Icons.square_foot,
                        "Area",
                        "${property.area} sqft",
                      ),
                      _buildInfoIcon(
                        Icons.category_outlined,
                        "Type",
                        property.listingCategory,
                      ),
                    ],
                  ),

                  const Divider(height: 40),

                  // 4. Description
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    // HTML tags remove karne ke liye regex use kar sakte hain
                    property.description.replaceAll(
                      RegExp(r'<[^>]*>|&nbsp;'),
                      "",
                    ),
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),

                  const Divider(height: 40),

                  // 5. Owner/Contact Details Section
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: primaryColor,
                          child: Text(
                            property.fullName[0],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.fullName,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Property Owner",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed:
                              () {}, // WhatsApp integration yaha kar sakte hain
                          icon: const Icon(Icons.message, color: primaryColor),
                        ),
                        IconButton(
                          onPressed: () {}, // Call integration
                          icon: const Icon(Icons.phone, color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h), // Bottom space for button
                ],
              ),
            ),
          ),
        ],
      ),

      // 6. Bottom Action Button
      bottomSheet: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            minimumSize: Size(double.infinity, 55.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          onPressed: () {
            // Yaha pe contact dialog call karein jo humne pehle banaya tha
          },
          child: const Text(
            "CONTACT OWNER",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[800], size: 28.sp),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
      ],
    );
  }
}
