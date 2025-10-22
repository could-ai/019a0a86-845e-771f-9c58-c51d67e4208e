import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/application_data.dart';

class ReviewScreen extends StatelessWidget {
  final ApplicationData data;

  const ReviewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Application'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Personal Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Full Name: ${data.fullName}'),
            Text('Date of Birth: ${data.dateOfBirth}'),
            Text('Gender: ${data.gender}'),
            Text('Nationality: ${data.nationality}'),
            Text('ID Number: ${data.idNumber}'),
            Text('Phone: ${data.phoneNumber}'),
            Text('Email: ${data.email}'),
            Text('Address: ${data.homeAddress}'),
            Text('Parent Name: ${data.parentName}'),
            Text('Parent Phone: ${data.parentPhone}'),
            Text('Parent Email: ${data.parentEmail}'),
            const SizedBox(height: 24),
            const Text('Academic Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Current School: ${data.currentSchool}'),
            Text('KCSE Index: ${data.kcseIndex}'),
            const Text('Subject Grades:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...data.subjects.entries.map((entry) => Text('${entry.key}: ${entry.value}')),
            Text('Overall Grade: ${data.overallGrade}'),
            const SizedBox(height: 24),
            const Text('School Preferences', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Preferred Schools: ${data.preferredSchools.join(', ')}'),
            Text('Why Join: ${data.whyJoinSchool}'),
            if (data.extracurricular.isNotEmpty) Text('Extracurricular: ${data.extracurricular}'),
            if (data.specialNeeds.isNotEmpty) Text('Special Needs: ${data.specialNeeds}'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Here you would typically submit the application
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Application Submitted'),
                    content: const Text('Your application has been submitted successfully!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Submit Application'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}