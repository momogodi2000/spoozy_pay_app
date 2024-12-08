import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import for image picker
import 'package:intl/intl.dart'; // Import for date formatting

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _profileImage; // Holds the path of the selected profile image
  DateTime? _selectedDate; // Holds the selected date of birth

  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = image.path;
      });
    }
  }

  // Function to display date picker
  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Personal Info',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back arrow
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              // Profile Picture Upload
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFEFEFEF),
                  backgroundImage: _profileImage != null
                      ? FileImage(File(_profileImage!))
                      : null,
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, size: 30, color: Colors.grey)
                      : null,
                ),
              ),
              SizedBox(height: 20),

              // Input Fields
              _buildInputField(label: "Name", initialValue: "Payton Pal"),
              _buildPhoneField(label: "Phone Number"),
              _buildInputField(label: "Email", hintText: "Enter your email"),
              _buildDateField(label: "Date of Birth"),
              _buildInputField(label: "Address", hintText: "Enter your address"),

              SizedBox(height: 30),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Save logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0028EE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  elevation: 3,
                  shadowColor: Color(0xFFA6A6A6),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Input Field
  Widget _buildInputField({required String label, String? hintText, String? initialValue}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hintText,
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0741FF)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Phone Field
  Widget _buildPhoneField({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            keyboardType: TextInputType.number, // Only allow numeric input
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0028EE)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Date Picker Field
  Widget _buildDateField({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: _selectedDate != null
                  ? DateFormat('MM/dd/yyyy').format(_selectedDate!)
                  : "Select Date",
              suffixIcon: Icon(Icons.calendar_today, color: Colors.grey, size: 20),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0741FF)),
              ),
            ),
            onTap: () => _pickDate(context),
          ),
        ],
      ),
    );
  }
}
