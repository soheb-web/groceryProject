import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Controller/getCategoryController.dart';
import 'package:grocery/Pages/Address/PickAddressPage.dart';
import 'package:grocery/Pages/Favourite/favouritePage.dart';
import 'package:grocery/Pages/Product/productCategoryPage.dart';
import 'package:grocery/Pages/Search/searchPage.dart';

import '../../Controller/getProductCotroller.dart';
import '../Cart/cartPage.dart';
import '../Profile/profilePage.dart';

class HomeBottom extends ConsumerStatefulWidget {
  const HomeBottom({super.key});

  @override
  ConsumerState<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends ConsumerState<HomeBottom> {
  int bottomIndex = 0;

  List<Widget> Pages = [HomePage(), CartPage(), FavouritePage(), ProfilePage()];

  final List<String> appBarTitles = [
    "FreshCart",
    "Cart",
    "Favourite",
    "Profile",
  ];

  DateTime? lastPressedAt;

  @override
  Widget build(BuildContext context) {
    final getProduct = ref.watch(getProductController);
    return PopScope(
      canPop: false, // IMPORTANT
      onPopInvoked: (didPop) {
        if (didPop) return;
        // Agar bottom tab 0 nahi hai to pehle home pe lao
        if (bottomIndex != 0) {
          setState(() {
            bottomIndex = 0;
          });
          return;
        }
        final now = DateTime.now();
        final backButtonHasNotBeenPressedRecently =
            lastPressedAt == null ||
            now.difference(lastPressedAt!) > const Duration(seconds: 2);
        if (backButtonHasNotBeenPressedRecently) {
          lastPressedAt = now;
          Fluttertoast.showToast(
            msg: "Press back again to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 14,
          );
          return;
        }
        // Exit app
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFFFFF),
          automaticallyImplyLeading: false,
          title: Text(
            appBarTitles[bottomIndex],
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0A0A0A),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.dark_mode_outlined, color: Color(0xFF0A0A0A)),
            ),
            SizedBox(width: 5.w),
          ],
        ),
        body: Pages[bottomIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(2, -5),
                blurRadius: 15,
                spreadRadius: 0,
                color: Color.fromARGB(22, 0, 0, 0),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                bottomIndex = value;
              });
            },
            currentIndex: bottomIndex,
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF16A34A),
            unselectedItemColor: Colors.black,
            selectedLabelStyle: GoogleFonts.inter(fontSize: 12.sp),
            unselectedLabelStyle: GoogleFonts.inter(fontSize: 12.sp),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Svg/home.svg",
                  color: bottomIndex == 0
                      ? const Color(0xFF16A34A)
                      : Color(0xFF181725),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Svg/cart.svg",
                  color: bottomIndex == 1
                      ? const Color(0xFF16A34A)
                      : Color(0xFF181725),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Svg/favourite.svg",
                  color: bottomIndex == 2
                      ? const Color(0xFF16A34A)
                      : Color(0xFF181725),
                ),
                label: "Favourite",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Svg/profile.svg",
                  color: bottomIndex == 3
                      ? const Color(0xFF16A34A)
                      : Color(0xFF181725),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );

  }
}


final selectedCategoryProvider = StateProvider<String?>((ref) => null);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(getProductController);
    final categoryAsync = ref.watch(getCategoryController);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location bar ── same as before
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PickAddressPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 13.h),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 11.h,
                  bottom: 11.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  border: Border.all(color: const Color(0xFF000000), width: 0.53),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Color(0xFF16A34A)),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF737373),
                          ),
                        ),
                        Text(
                          "123 Main St, Downtown",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF0A0A0A),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                     Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF737373),
                      size: 15.sp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Search bar ── same
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: TextField(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                decoration: InputDecoration(
                  hintText: "Search for groceries...",
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF737373),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 16.w,
                  ),
                  fillColor: const Color(0xFFF5F5F5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Banner ── same
            Container(
              margin: EdgeInsets.only(left: 16.w, right: 20.w),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: const Color(0xFFFFA400),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shop Smarter,\nSave More!",
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    width: 115.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(102, 210, 210, 210),
                      border: Border.all(color: const Color(0xFFFFFFFF), width: 1.w),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        "Get 40% Off 🎉",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Categories from API ── design 100% same as your original
            SizedBox(
              height: 90.h,
              child: categoryAsync.when(
                data: (categoryModel) {
                  // API categories
                  final apiCategories = categoryModel.data ?? [];

                  // Always add "All" as the FIRST item
                  final displayCategories = ['All', ...apiCategories];

                  if (apiCategories.isEmpty && displayCategories.length == 1) {
                    // Only "All" exists
                    return const Center(child: Text("No categories"));
                  }

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: displayCategories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final categoryName = displayCategories[index];

                      final displayText = (categoryName == 'All') ? 'All' : categoryName;

                      final imagePath = (categoryName == 'All')
                          ? "assets/png/all.png"
                          : _getCategoryImage(categoryName);

                      return InkWell(

                        borderRadius: BorderRadius.circular(16.r),

                        onTap: () {
                          // "All" → clear filter (show all products)
                          // Other category → filter by that name
                          // Click same category again → clear filter
                          final current = ref.read(selectedCategoryProvider);

                          if (categoryName == 'All') {
                            ref.read(selectedCategoryProvider.notifier).state = null;
                          }
                          else {
                            ref.read(selectedCategoryProvider.notifier).state =
                            (current == categoryName) ? null : categoryName;
                          }

                        },

                        child:

                        Container(
                          // padding: EdgeInsets.all(10.sp),
                          width: 90.w,

                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          // Removed padding from container - we control spacing with SizedBox inside
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,      // Vertically center everything
                            crossAxisAlignment: CrossAxisAlignment.center,    // Horizontally center image & text
                            children: [
                              Image.asset(
                                imagePath,
                                width: 30.w,
                                height: 30.h,
                                fit: BoxFit.contain,  // Ensures image stays centered inside its box
                              ),

                              SizedBox(height: 8.h),

                              Text(
                                displayText,   // "All" or real category name
                                textAlign: TextAlign.center,   // Extra safety for multi-word text
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF0A0A0A),
                                ),
                              ),
                            ],
                          ),
                        ),

                      );
                    },
                  );
                },
                error: (err, stack) => const Center(child: Text("Error loading categories")),
                loading: () => const Center(
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  ),
                ),
              ),
            ),

            // Title ── kept exactly "Featured Stores" as in your original
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Stores",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF0A0A0A),
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF16A34A),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Products ── filtered when category selected
            productAsync.when(
              data: (model) {
                var products = model.data ?? [];

                // Apply category filter (case insensitive)
                if (selectedCategory != null) {
                  products = products.where((p) {
                    return p.category?.toLowerCase() == selectedCategory!.toLowerCase();
                  }).toList();
                }

                if (products.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                    child: Center(child: Text("No products available")),
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductCategoryPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: StoreCard(
                            image: product.image ?? "https://via.placeholder.com/300",
                            rating: "4.8",
                            title: product.name ?? "Unknown",
                            subtitle: product.category ?? "Category",
                            time: "20-30 min",
                            price: "₹${product.price?.toStringAsFixed(2) ?? '0.00'}",
                            distance: "2.1 km",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (err, stack) => Padding(
                padding: const EdgeInsets.all(32),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      const Text("Failed to load products"),
                      Text("$err"),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.refresh, size: 18),
                        label: const Text("Retry"),
                        onPressed: () => ref.invalidate(getProductController),
                      ),
                    ],
                  ),
                ),
              ),
              loading: () => const Padding(
                padding: EdgeInsets.all(60),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),

            SizedBox(height: 16.h),

            // Offer Card ── same as before
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                gradient: const LinearGradient(
                  colors: [Color(0xFF16A34A), Color(0xFF15803D)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Special Offer",
                    style: GoogleFonts.inter(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Get 20% off on your first order!",
                    style: GoogleFonts.inter(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Use code: FRESH20",
                    style: GoogleFonts.inter(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Order Now"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  // Map category name to your existing asset images
  String _getCategoryImage(String categoryName) {
    final name = categoryName.toLowerCase().trim();

    if (name.contains('all') || name == 'all') return "assets/png/all.png";
    if (name.contains('fresh') || name.contains('vegetable') || name.contains('sabji')) {
      return "assets/png/fresh.png";
    }
    if (name.contains('organic')) return "assets/png/organic.png";
    if (name.contains('bakery') || name.contains('bread') || name.contains('cake')) {
      return "assets/png/bakary.png";
    }
    if (name.contains('dairy') || name.contains('milk') || name.contains('paneer')) {
      return "assets/png/dairy.png";
    }

    // fallback
    return "assets/png/all.png";
  }
}

class StoreCard extends StatelessWidget {
  final String image;
  final String rating;
  final String title;
  final String subtitle;
  final String time;
  final String price;
  final String distance;

  const StoreCard({
    super.key,
    required this.image,
    required this.rating,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.price,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
      color: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          /// Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.network(
                  image,
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 160.h,
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
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFDC700), size: 15.sp),
                      SizedBox(width: 5.w),
                      Text(
                        rating,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Color(0xFF0A0A0A),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Details
          Padding(
            padding: EdgeInsets.only(
              top: 15.h,
              left: 16.w,
              bottom: 24.h,
              right: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: Color(0xFF737373),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 16.sp,
                      color: Color(0xFF737373),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF737373),
                      ),
                    ),
                    Spacer(),
                    Text(
                      price,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF737373),
                      ),
                    ),
                    Spacer(),
                    Text(
                      distance,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF737373),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
