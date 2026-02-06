import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Controller/supportController.dart';

class HelpOrSupportPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HelpOrSupportPage> createState() => _HelpOrSupportPageState();
}

class _HelpOrSupportPageState extends ConsumerState<HelpOrSupportPage> {
  final Color primaryGreen = const Color(0xFF19B954);
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  String? selectedType;

  List<String> typeList = [
    "Order Support",
    "Delivery Issues",
    "Product Request",
    "Complaint",
    "Complement",
  ];

  @override
  Widget build(BuildContext context) {
    final supportState = ref.watch(supportProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F7), // Light Blueish Grey background
      appBar: AppBar(
        title: const Text(
          "Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 15),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Send us a Message",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          _formLabel("FULL NAME *"),
                          _buildInput(
                            "Enter your name",
                            nameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Name is required";
                              }
                              if (value.length < 3) {
                                return "Name must be at least 3 characters";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),
                          _formLabel("EMAIL ADDRESS *"),
                          _buildInput(
                            "example@mail.com",
                            emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Email is required";
                              }
                              final emailRegex = RegExp(
                                r'^[\w\.-]+@[\w\.-]+\.\w+$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return "Enter valid email";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),
                          _formLabel("INQUIRY TYPE"),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: Text("General Question"),
                                value: selectedType,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF19B954),
                                ), // Aapka Green Color
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                                dropdownColor: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                items: typeList.map((String e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          _formLabel("SUBJECT *"),
                          _buildInput(
                            "Brief description",
                            subjectController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Subject is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          _formLabel("MESSAGE *"),
                          _buildInput(
                            "How can we help you?",
                            maxLines: 4,
                            messageController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Message is required";
                              }
                              if (value.length < 10) {
                                return "Message must be at least 10 characters";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 30),

                          // YOUR PRIMARY COLOR BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) return;

                                if (selectedType == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      duration: const Duration(seconds: 2),
                                      margin: EdgeInsets.only(
                                        left: 10.r,
                                        right: 10.r,
                                        bottom: 10.h,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      content: Text(
                                        "Please select inquiry type",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                final success = await ref
                                    .read(supportProvider.notifier)
                                    .support(
                                      nameController.text.trim(),
                                      emailController.text.trim(),
                                      selectedType!,
                                      subjectController.text.trim(),
                                      messageController.text.trim(),
                                      context,
                                    );

                                if (success) {
                                  nameController.clear();
                                  emailController.clear();
                                  subjectController.clear();
                                  messageController.clear();
                                  setState(() => selectedType = null);
                                }
                              },
                              icon: const Icon(Icons.send, color: Colors.white),
                              label: supportState.isLoading
                                  ? Center(
                                      child: CupertinoActivityIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Send Message",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (supportState.isLoading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildInput(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryGreen, width: 2),
        ),
      ),
    );
  }
}
