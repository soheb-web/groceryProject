import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Pages/Address/PickAddressPage.dart';
import 'package:grocery/Pages/Track/trackingPage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPagestate();
}

class _CheckoutPagestate extends State<CheckoutPage> {
  int selectedTimeIndex = 0;
  int selectedPaymentIndex = 0;
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
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Delivery Address
            _sectionHeader(
              "Delivery Address",
              action: "Change",
              onActionTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PickAddressPage()),
                );
              },
            ),
            SizedBox(height: 16.h.h),
            _addressCard(),
            SizedBox(height: 20.h),

            /// 🔹 Delivery Time
            _sectionHeader("Delivery time"),
            SizedBox(height: 16.h),
            Row(
              children: [
                _timeChip(
                  title: "Express",
                  sub: "20-30 Mins",
                  index: 0,
                  selectedIndex: selectedTimeIndex,
                  onTap: () {
                    setState(() {
                      selectedTimeIndex = 0;
                    });
                  },
                ),
                SizedBox(width: 12.w),
                _timeChip(
                  title: "Standard",
                  sub: "45 - 60 mins",
                  index: 1,
                  selectedIndex: selectedTimeIndex,
                  onTap: () {
                    setState(() {
                      selectedTimeIndex = 1;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),

            /// 🔹 Payment Method
            _sectionHeader("Payment Method"),
            SizedBox(height: 15.h),
            _paymentTile(
              icon: Icons.payment,
              title: "Credit/Debit Card",
              subtitle: "....4242",
              paymentIndex: 0,
              selectedIndex: selectedPaymentIndex,
              onTap: () {
                setState(() {
                  selectedPaymentIndex = 0;
                });
              },
            ),
            _paymentTile(
              icon: Icons.money,
              title: "Cash on Delivery",
              subtitle: "Pay when you receive",
              paymentIndex: 1,
              selectedIndex: selectedPaymentIndex,
              onTap: () {
                setState(() {
                  selectedPaymentIndex = 1;
                });
              },
            ),
            _paymentTile(
              icon: Icons.wallet_rounded,
              title: "Digital Wallet",
              subtitle: "Pay when you receive",
              paymentIndex: 2,
              selectedIndex: selectedPaymentIndex,
              onTap: () {
                setState(() {
                  selectedPaymentIndex = 2;
                });
              },
            ),
            SizedBox(height: 20.h),
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
            SizedBox(height: 24.h),
            Material(
              color: const Color(0xFF16A34A),
              borderRadius: BorderRadius.circular(12.r),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackingPage()),
                  );
                },
                splashColor: Colors.white.withOpacity(0.25),
                highlightColor: Colors.white.withOpacity(0.15),
                child: SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: Center(
                    child: Text(
                      "Place Order . \$9.45",
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
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  // ================= WIDGETS =================
  Widget _sectionHeader(
    String title, {
    String? action,
    VoidCallback? onActionTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF000000),
          ),
        ),
        if (action != null)
          Material(
            color: Colors.transparent, // 👈 background nahi chahiye
            child: InkWell(
              onTap: onActionTap,
              borderRadius: BorderRadius.circular(6.r),
              splashColor: const Color(0xFF16A34A).withOpacity(0.25),
              highlightColor: const Color(0xFF16A34A).withOpacity(0.15),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: Text(
                  action,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: const Color(0xFF16A34A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _addressCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color.fromARGB(51, 0, 0, 0), width: 1.w),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(51, 22, 163, 74),
            ),
            child: Center(
              child: Icon(
                Icons.location_on_outlined,
                color: Color(0xFF16A34A),
                size: 20.sp,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "123 Main Street, Downtown, City, State 12345",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Color.fromARGB(153, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _timeChip({
    required String title,
    required String sub,
    required int index,
    required int selectedIndex,
    required VoidCallback onTap,
  }) {
    final bool selected = index == selectedIndex;

    return Expanded(
      child: Material(
        color: selected ? const Color(0xFF16A34A) : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.25),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: selected ? Colors.transparent : Color(0xFF000000),
              ),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: selected ? Colors.white : Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  sub,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: selected
                        ? Color.fromARGB(178, 255, 255, 255)
                        : Color.fromARGB(153, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentTile({
    required String title,
    required String subtitle,
    required int paymentIndex,
    required int selectedIndex,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    final bool selected = paymentIndex == selectedIndex;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: const Color(0xFF16A34A).withOpacity(0.15),
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Color.fromARGB(76, 0, 0, 0), width: 1),
          ),
          child: Row(
            children: [
              Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(51, 22, 163, 74),
                ),
                child: Icon(icon, color: Color(0xFF16A34A), size: 20.sp),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Color.fromARGB(127, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (selected)
                Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 25.sp),
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
