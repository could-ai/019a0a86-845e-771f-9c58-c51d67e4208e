import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/application_data.dart';
import 'package:couldai_user_app/screens/school_preferences_screen.dart';

class AcademicInfoScreen extends StatefulWidget {
  final ApplicationData data;

  const AcademicInfoScreen({super.key, required this.data});

  @override
  State<AcademicInfoScreen> createState() => _AcademicInfoScreenState();
}

class _AcademicInfoScreenState extends State<AcademicInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentSchoolController = TextEditingController();
  final TextEditingController _kcseIndexController = TextEditingController();
  final TextEditingController _mathGradeController = TextEditingController();
  final TextEditingController _englishGradeController = TextEditingController();
  final TextEditingController _kiswahiliGradeController = TextEditingController();
  final TextEditingController _scienceGradeController = TextEditingController();
  final TextEditingController _socialStudiesGradeController = TextEditingController();
  final TextEditingController _overallGradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentSchoolController.text = widget.data.currentSchool;
    _kcseIndexController.text = widget.data.kcseIndex;
    _mathGradeController.text = widget.data.subjects['Mathematics'] ?? '';
    _englishGradeController.text = widget.data.subjects['English'] ?? '';
    _kiswahiliGradeController.text = widget.data.subjects['Kiswahili'] ?? '';
    _scienceGradeController.text = widget.data.subjects['Science'] ?? '';
    _socialStudiesGradeController.text = widget.data.subjects['Social Studies'] ?? '';
    _overallGradeController.text = widget.data.overallGrade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academic Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _currentSchoolController,
                decoration: const InputDecoration(labelText: 'Current School'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kcseIndexController,
                decoration: const InputDecoration(labelText: 'KCSE Index Number'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              const Text('Grade 9 Subject Grades', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                controller: _mathGradeController,
                decoration: const InputDecoration(labelText: 'Mathematics Grade'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _englishGradeController,
                decoration: const InputDecoration(labelText: 'English Grade'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kiswahiliGradeController,
                decoration: const InputDecoration(labelText: 'Kiswahili Grade'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _scienceGradeController,
                decoration: const InputDecoration(labelText: 'Science Grade'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _socialStudiesGradeController,
                decoration: const InputDecoration(labelText: 'Social Studies Grade'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _overallGradeController,
                decoration: const InputDecoration(labelText: 'Overall Grade'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.data.currentSchool = _currentSchoolController.text;
                    widget.data.kcseIndex = _kcseIndexController.text;
                    widget.data.subjects = {
                      'Mathematics': _mathGradeController.text,
                      'English': _englishGradeController.text,
                      'Kiswahili': _kiswahiliGradeController.text,
                      'Science': _scienceGradeController.text,
                      'Social Studies': _socialStudiesGradeController.text,
                    };
                    widget.data.overallGrade = _overallGradeController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SchoolPreferencesScreen(data: widget.data),
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