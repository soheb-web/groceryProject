import 'package:flutter/material.dart';

class CreatePropertyScreen extends StatefulWidget {
  const CreatePropertyScreen({Key? key}) : super(key: key);

  @override
  State<CreatePropertyScreen> createState() => _CreatePropertyScreenState();
}

class _CreatePropertyScreenState extends State<CreatePropertyScreen> {
  // Dropdown values
  String? selectedProperty;
  String? selectedPropertyType;
  String? selectedListingCategory;
  String? selectedFurnishing;

  // Amenities multi-select
  final List<String> allAmenities = [
    'Gymnasium',
    'Swimming Pool',
    'Children Play Area',
    'Power Backup',
    'Lift',
    'Security',
    'Parking',
    'Garden',
    'Club House',
    'Intercom',
    'Rain Water Harvesting',
    'Indoor Games',
  ];
  List<String> selectedAmenities = [];

  // Around Project - Dynamic list with controllers (MINIMUM 1 ROW)


  List<Map<String, TextEditingController>> aroundProjectList = [];

  @override
  void initState() {
    super.initState();
    // By default 1 row add kar denge
    addAroundProjectRow();
  }

  void addAroundProjectRow() {
    setState(() {
      aroundProjectList.add({
        'place': TextEditingController(),
        'details': TextEditingController(),
      });
    });
  }

  void removeAroundProjectRow(int index) {
    // Minimum 1 row always rahega
    if (aroundProjectList.length > 1) {
      setState(() {
        aroundProjectList[index]['place']?.dispose();
        aroundProjectList[index]['details']?.dispose();
        aroundProjectList.removeAt(index);
      });
    } else {
      // Show snackbar if trying to remove the only row
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('At least 1 nearby place is required!'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var controllers in aroundProjectList) {
      controllers['place']?.dispose();
      controllers['details']?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Create Property Listing',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BASIC INFO
            const Text('BASIC INFO', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            _buildDropdown(
              label: 'Property',
              value: selectedProperty,
              items: ['Residential', 'Commercial', 'Industrial', 'Agricultural'],
              onChanged: (value) => setState(() => selectedProperty = value),
            ),
            const SizedBox(height: 16),

            _buildDropdown(
              label: 'Property Type',
              value: selectedPropertyType,
              items: [
                'Apartment/Flat',
                'Independent House/Villa',
                'Plot/Land',
                'Builder Floor',
                'Studio Apartment',
                'Penthouse',
                'Shop/Showroom',
                'Office Space',
                'Warehouse',
              ],
              onChanged: (value) => setState(() => selectedPropertyType = value),
            ),
            const SizedBox(height: 16),

            _buildDropdown(
              label: 'Listing Category',
              value: selectedListingCategory,
              items: ['Sale', 'Rent/Lease', 'PG/Hostel'],
              onChanged: (value) => setState(() => selectedListingCategory = value),
            ),
            const SizedBox(height: 16),

            _buildTextField('City'),
            const SizedBox(height: 16),
            _buildTextField('Locality / Area'),
            const SizedBox(height: 16),
            _buildTextField('Price'),
            const SizedBox(height: 16),
            _buildTextField('Bedrooms'),
            const SizedBox(height: 16),
            _buildTextField('Bathrooms'),
            const SizedBox(height: 16),
            _buildTextField('Area (sqft)'),
            const SizedBox(height: 16),

            _buildDropdown(
              label: 'Furnishing',
              value: selectedFurnishing,
              items: ['Furnished', 'Semi-Furnished', 'Unfurnished'],
              onChanged: (value) => setState(() => selectedFurnishing = value),
            ),

            const SizedBox(height: 32),

            // Legal Information
            const Text('Legal Information', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Permit No'),
            const SizedBox(height: 16),
            _buildTextField('RERA Registration No'),
            const SizedBox(height: 16),
            _buildTextField('DED'),
            const SizedBox(height: 16),
            _buildTextField('BRN'),

            const SizedBox(height: 32),

            // Project Overview
            const Text('Project Overview', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Project Area (Acre)', hint: 'Example: 0.89 Acres'),
            const SizedBox(height: 16),
            _buildTextField('Unit Sizes (sq.ft)', hint: 'Example: 431 - 460 sq.ft.'),
            const SizedBox(height: 16),
            _buildTextField('Project Size', hint: 'Example: 1 Building - 258 Units'),
            const SizedBox(height: 16),
            _buildTextField('Project launch month & year'),
            const SizedBox(height: 16),
            _buildTextField('Avg Price', suffix: '₹ / sq.ft', hint: 'Example: 9.5 (auto shown as ₹ 9.5 K / sq.ft.)'),
            const SizedBox(height: 16),
            _buildTextField('Expected possession start date'),

            const SizedBox(height: 32),

            // Amenities
            const Text('Amenities', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildMultiSelectAmenities(),

            const SizedBox(height: 32),

            // Around Project - DYNAMIC WITH MINIMUM 1 ROW
            const Text('Around Project', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Dynamic rows (minimum 1)
            ...aroundProjectList.asMap().entries.map((entry) {
              int index = entry.key;
              var controllers = entry.value;
              bool isOnlyRow = aroundProjectList.length == 1;

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        _buildTextField('Place Name', controller: controllers['place']),
                        const SizedBox(height: 16),
                        _buildTextField('Details', controller: controllers['details']),
                      ],
                    ),
                    // Remove button - show only if not the only row
                    if (!isOnlyRow)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red, size: 30),
                          onPressed: () => removeAroundProjectRow(index),
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),

            // Add More Button
            ElevatedButton.icon(
              onPressed: addAroundProjectRow,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Add More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF5722),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
            ),

            const SizedBox(height: 32),

            // Property Photos
            const Text('Property Photos', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // File picker logic
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose Files', style: TextStyle(color: Colors.grey)),
                    Text('No file chosen', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Contact Information
            const Text('Contact Information', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Full Name'),
            const SizedBox(height: 16),
            _buildTextField('Email'),
            const SizedBox(height: 16),
            _buildTextField('Phone'),

            const SizedBox(height: 32),

            // Property Address
            const Text('Property Address', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Property Address', maxLines: 4),

            const SizedBox(height: 32),

            // Description
            const Text('Description', style: TextStyle(color: Color(0xFFFF5722), fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTextField('Description', maxLines: 6),

            const SizedBox(height: 40),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Form submit logic
                  List<Map<String, String>> aroundData = aroundProjectList.map((e) {
                    return {
                      'place': e['place']!.text,
                      'details': e['details']!.text,
                    };
                  }).toList();

                  debugPrint('Around Project Data: $aroundData');
                  debugPrint('Selected Amenities: $selectedAmenities');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'Submit Property',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.chat, color: Colors.white),
        tooltip: "Let's Connect",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildTextField(
      String label, {
        String? hint,
        String? suffix,
        int maxLines = 1,
        TextEditingController? controller,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            suffixText: suffix,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFFF5722), width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              hint: Text('Select $label', style: const TextStyle(color: Colors.grey)),
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultiSelectAmenities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Amenities', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allAmenities.map((amenity) {
            final isSelected = selectedAmenities.contains(amenity);
            return FilterChip(
              label: Text(amenity),
              selected: isSelected,
              selectedColor: const Color(0xFFFF5722).withOpacity(0.2),
              checkmarkColor: const Color(0xFFFF5722),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedAmenities.add(amenity);
                  } else {
                    selectedAmenities.remove(amenity);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}