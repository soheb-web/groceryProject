import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/checkoutPage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return cartListData();
                },
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _row("Subtotal", "\$5.98"),
                    _row("Delivery Fee", "\$2.99"),
                    _row("Tax", "\$0.48"),
                    Divider(color: Color(0xFFBFBFBF)),
                    _row("Total", "\$9.45", isTotal: true),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(51, 22, 163, 74),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color.fromARGB(25, 0, 0, 0),
                    strokeAlign: 0.53,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        "Add \$24.02 more for free Delivery!",
                        style: GoogleFonts.inter(
                          color: Color(0xFF16A34A),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                child: Material(
                  color: const Color(0xFF16A34A),
                  borderRadius: BorderRadius.circular(12.r),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    splashColor: Colors.white.withOpacity(0.25),
                    highlightColor: Colors.white.withOpacity(0.15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: Center(
                        child: Text(
                          "Proceed to Checkout    \$9.45",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: isTotal ? FontWeight.w400 : FontWeight.normal,
              fontSize: 17.sp,
              color: Color(0xFF7F7F7F),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              color: isTotal ? Colors.green : Color(0xFF000000),
              fontWeight: isTotal ? FontWeight.w400 : FontWeight.normal,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class cartListData extends StatefulWidget {
  const cartListData({super.key});

  @override
  State<cartListData> createState() => _cartListDataState();
}

class _cartListDataState extends State<cartListData> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Color(0xFFB3AEAE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/4/4c/Bananas.jpg",
              width: 90.w,
              height: 90.h,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 90.w,
                  height: 90.h,
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
          SizedBox(width: 12.w),

          /// INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Organic Bananas",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        color: Color(0xFF000000),
                        height: 1.1,
                      ),
                    ),
                    Text(
                      "\$5.98",
                      style: GoogleFonts.inter(
                        color: Color(0xFF16A34A),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  "\$2.99 per Ib",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Color.fromARGB(153, 0, 0, 0),
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    _qtyButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (qty > 1) {
                          setState(() {
                            qty--;
                          });
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        qty.toString(),
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                    _qtyButton(
                      icon: Icons.add,
                      onTap: () {
                        setState(() {
                          qty++;
                        });
                      },
                    ),
                    Spacer(),
                    Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        splashColor: Colors.red.withOpacity(0.3),
                        highlightColor: Colors.red.withOpacity(0.15),
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 22.sp,
                          ),
                        ),
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

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: const Color(0xFFEBEBEB),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.black.withOpacity(0.15),
        highlightColor: Colors.black.withOpacity(0.08),
        child: SizedBox(
          width: 30.w,
          height: 30.h,
          child: Icon(icon, size: 20.sp, color: const Color(0xFF000000)),
        ),
      ),
    );
  }
}
