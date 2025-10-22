import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/application_data.dart';
import 'package:couldai_user_app/screens/review_screen.dart';

class SchoolPreferencesScreen extends StatefulWidget {
  final ApplicationData data;

  const SchoolPreferencesScreen({super.key, required this.data});

  @override
  State<SchoolPreferencesScreen> createState() => _SchoolPreferencesScreenState();
}

class _SchoolPreferencesScreenState extends State<SchoolPreferencesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _whyJoinController = TextEditingController();
  final TextEditingController _extracurricularController = TextEditingController();
  final TextEditingController _specialNeedsController = TextEditingController();

  List<String> _selectedSchools = [];
  final List<String> _availableSchools = [
    'Alliance High School',
    'Mombasa School',
    'Nairobi School',
    'Maseno School',
    'Kapsabet Boys High School',
    'Kenya High School',
    'Lenana School',
    'Starehe Boys Centre',
    'Precious Blood Riruta',
    'Moi Girls High School',
  ];

  @override
  void initState() {
    super.initState();
    _whyJoinController.text = widget.data.whyJoinSchool;
    _extracurricularController.text = widget.data.extracurricular;
    _specialNeedsController.text = widget.data.specialNeeds;
    _selectedSchools = List.from(widget.data.preferredSchools);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Select up to 3 preferred schools:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              ..._availableSchools.map((school) {
                return CheckboxListTile(
                  title: Text(school),
                  value: _selectedSchools.contains(school),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true && _selectedSchools.length < 3) {
                        _selectedSchools.add(school);
                      } else if (value == false) {
                        _selectedSchools.remove(school);
                      }
                    });
                  },
                );
              }),
              const SizedBox(height: 24),
              TextFormField(
                controller: _whyJoinController,
                decoration: const InputDecoration(labelText: 'Why do you want to join this school?'),
                maxLines: 3,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _extracurricularController,
                decoration: const InputDecoration(labelText: 'Extracurricular Activities'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _specialNeedsController,
                decoration: const InputDecoration(labelText: 'Special Needs or Accommodations'),
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _selectedSchools.isNotEmpty) {
                    widget.data.preferredSchools = _selectedSchools;
                    widget.data.whyJoinSchool = _whyJoinController.text;
                    widget.data.extracurricular = _extracurricularController.text;
                    widget.data.specialNeeds = _specialNeedsController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewScreen(data: widget.data),
                      ),
                    );
                  } else if (_selectedSchools.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select at least one school')),
                    );
                  }
                },
                child: const Text('Review Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}