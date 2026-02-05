import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPagestate();
}

class _TrackingPagestate extends State<TrackingPage> {
  void showCallDriverBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 12.h,
          bottom: 20.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Call Driver",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF0A0A0A),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 24.h),
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 22, 163, 74),
              ),
              child: Icon(Icons.call, color: Color(0xFF16A34A), size: 32.sp),
            ),
            SizedBox(height: 16.h),

            /// TEXTS
            Text(
              "Call John Smith?",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0A0A0A),
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              "You'll be connected to:",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF737373),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "+1234 567 8900",
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0A0A0A),
              ),
            ),
            SizedBox(height: 24.h),

            /// CALL NOW BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text("Call Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF16A34A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),

            /// CANCEL BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5F5F5),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            SizedBox(height: 20.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Image.asset("assets/png/mapimage.png"),
                ),
                Positioned(
                  left: 25.w,
                  top: 15.h,
                  child: Text(
                    "Google",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                ),
                Positioned(
                  right: 25.w,
                  top: 15.h,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Icon(
                      Icons.zoom_out_map,
                      color: Color(0xFF0A0A0A),
                      size: 18.sp,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(left: 24.w, right: 24.w),
                    width: double.infinity,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                          blurRadius: 4,
                          color: Color.fromARGB(63, 0, 0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Estimated Arrival",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              Text(
                                "29 Minutes",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF16A34A),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(51, 22, 163, 74),
                            ),
                            child: Center(
                              child: SvgPicture.asset("assets/Svg/boxx.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Status",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _timelineItem(
                    image: "assets/Svg/done.svg",
                    title: "Order Confirmed",
                    isCompleted: true,
                    showLine: true,
                  ),

                  _timelineItem(
                    image: "assets/Svg/boxx.svg",
                    title: "Preparing",
                    isCompleted: true,
                    showLine: true,
                  ),

                  _timelineItem(
                    image: "assets/Svg/share.svg",
                    title: "On the way",
                    subtitle: "In Progress...",
                    isCompleted: true,
                    showLine: true,
                    subtitleGreen: true,
                  ),

                  _timelineItem(
                    image: "assets/Svg/done.svg",
                    title: "Delivered",
                    isCompleted: false,
                    showLine: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Driver",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: Color.fromARGB(51, 0, 0, 0),
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60.h,
                              height: 60.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png",
                                  width: 60.w,
                                  height: 60.h,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                          ),
                                        );
                                      },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      size: 30.sp,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jhon Smith",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xFFFDC700),
                                      size: 16.sp,
                                    ),
                                    Text(
                                      "4.9",
                                      style: GoogleFonts.inter(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromARGB(127, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Honda Civic - ABC 123",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(127, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  showCallDriverBottomSheet(context);
                                },
                                icon: Icon(Icons.call_outlined),
                                label: Text(
                                  "Call",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF16A34A),
                                  foregroundColor: Colors.white,
                                  elevation: 2,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  openChatBottomSheet(context);
                                },
                                label: Text(
                                  "Message",
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                icon: Icon(Icons.message_outlined),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFE3E3E3),
                                  foregroundColor: Color(0xFF000000),
                                  elevation: 2,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 13.w,
                      vertical: 12.h,
                    ),
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
                  Text(
                    "Delivery Address",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                    ),
                  ),
                  _addressCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timelineItem({
    required String image,
    required String title,
    String? subtitle,
    required bool isCompleted,
    required bool showLine,
    bool subtitleGreen = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT TIMELINE
        Column(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: subtitle == null ? Color(0xFFF5F5F5) : Color(0xFF16A34A),
                color: Color(0xFF16A34A),
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  color: Colors.white,
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ),

            if (showLine)
              Container(width: 2.w, height: 60.w, color: Color(0xFF16A34A)),
          ],
        ),
        SizedBox(width: 16.w),

        /// RIGHT CONTENT
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),

              if (subtitle != null)
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: subtitleGreen ? Color(0xFF54DA85) : Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ],
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

  Widget _addressCard() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
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
}

void openChatBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent, // IMPORTANT
    builder: (_) {
      return Padding(
        padding: EdgeInsets.only(top: 90.h), // 👈 TOP SPACE
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: ChatBottomSheet(),
        ),
      );
    },
  );
}

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet({super.key});

  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  final ScrollController _scrollController = ScrollController();

  final messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  void _handleSendMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isSender': true});
      });
      messageController.clear();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _sendQuickReply(String text) {
    setState(() {
      _messages.add({'text': text, 'isSender': true});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom({bool animated = true}) {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position.maxScrollExtent;

    if (animated) {
      _scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    } else {
      _scrollController.jumpTo(position);
    }
  }

  @override
  void initState() {
    super.initState();

    // ✅ Optional: preload some messages
    _messages.addAll([
      {'text': "Hi! I'm on my way to pick up your order.👋", 'isSender': false},
      {'text': "I'll be there in about 5 minutes.", 'isSender': false},
      {'text': "OK please hurry Up!", 'isSender': true},
      {'text': "Got it! Thanks for letting me know.", 'isSender': false},
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(); // 👈 smooth scroll
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// HEADER
          Row(
            children: [
              Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(51, 22, 163, 74),
                ),
                child: Center(
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: Color(0xFF16A34A),
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Smith",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  Text(
                    "Online",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Color(0xFF0A0A0A), size: 20.sp),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(),

          /// CHAT LIST
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final data = _messages[index];
                return MessageBubble(
                  message: data['text'],
                  isSender: data['isSender'],
                );
              },
            ),
          ),

          /// QUICK REPLIES
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                QuickReply(
                  text: "I'm waiting outside",
                  onTap: () {
                    messageController.text = "I'm waiting outside";
                    messageController.selection = TextSelection.fromPosition(
                      TextPosition(offset: messageController.text.length),
                    );
                  },
                ),
                QuickReply(
                  text: "Please call when you arrive",
                  onTap: () {
                    messageController.text = "Please call when you arrive";
                    messageController.selection = TextSelection.fromPosition(
                      TextPosition(offset: messageController.text.length),
                    );
                  },
                ),
                QuickReply(
                  text: "Leave at gate",
                  onTap: () {
                    messageController.text = "Leave at gate";
                    messageController.selection = TextSelection.fromPosition(
                      TextPosition(offset: messageController.text.length),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          /// INPUT FIELD
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Enter Message",
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  _handleSendMessage();
                },
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF16A34A),
                  ),
                  child: Icon(Icons.send, color: Colors.white, size: 20.sp),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  const MessageBubble({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 260),
        decoration: BoxDecoration(
          color: isSender ? Color(0xFF16A34A) : Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(isSender ? 16.r : 0),
            bottomRight: Radius.circular(isSender ? 0 : 16.r),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isSender ? Colors.white : Color(0xFF0A0A0A),
          ),
        ),
      ),
    );
  }
}

class QuickReply extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const QuickReply({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF0A0A0A),
          ),
        ),
      ),
    );
  }
}
