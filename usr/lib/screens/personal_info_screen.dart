import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/application_data.dart';
import 'package:couldai_user_app/screens/academic_info_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  final ApplicationData data;

  const PersonalInfoScreen({super.key, required this.data});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _parentPhoneController = TextEditingController();
  final TextEditingController _parentEmailController = TextEditingController();

  String? _gender;

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.data.fullName;
    _dobController.text = widget.data.dateOfBirth;
    _nationalityController.text = widget.data.nationality;
    _idController.text = widget.data.idNumber;
    _phoneController.text = widget.data.phoneNumber;
    _emailController.text = widget.data.email;
    _addressController.text = widget.data.homeAddress;
    _parentNameController.text = widget.data.parentName;
    _parentPhoneController.text = widget.data.parentPhone;
    _parentEmailController.text = widget.data.parentEmail;
    _gender = widget.data.gender.isEmpty ? null : widget.data.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(labelText: 'Date of Birth (DD/MM/YYYY)'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _gender = value),
                validator: (value) => value == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nationalityController,
                decoration: const InputDecoration(labelText: 'Nationality'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(labelText: 'ID Number'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Email required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Home Address'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              const Text('Parent/Guardian Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _parentNameController,
                decoration: const InputDecoration(labelText: 'Parent/Guardian Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _parentPhoneController,
                decoration: const InputDecoration(labelText: 'Parent/Guardian Phone'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _parentEmailController,
                decoration: const InputDecoration(labelText: 'Parent/Guardian Email'),
                validator: (value) => value!.isEmpty ? 'Email required' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.data.fullName = _fullNameController.text;
                    widget.data.dateOfBirth = _dobController.text;
                    widget.data.gender = _gender!;
                    widget.data.nationality = _nationalityController.text;
                    widget.data.idNumber = _idController.text;
                    widget.data.phoneNumber = _phoneController.text;
                    widget.data.email = _emailController.text;
                    widget.data.homeAddress = _addressController.text;
                    widget.data.parentName = _parentNameController.text;
                    widget.data.parentPhone = _parentPhoneController.text;
                    widget.data.parentEmail = _parentEmailController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcademicInfoScreen(data: widget.data),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}