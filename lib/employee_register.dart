// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class EmployeeRegister extends StatefulWidget {
  const EmployeeRegister({super.key});

  @override
  _EmployeeRegister createState() => _EmployeeRegister();
}

class _EmployeeRegister extends State<EmployeeRegister> {
  // A key for managing the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variable to store the entered name
  String _first_name = '';
  String _last_name = '';
  String _address = '';
  String _contact_number = '';
  String _email = '';
  String _date_of_birth = '';
  String _tax_file = '';
  String _country = '';
  String _visa_type = '';
  String _visa_from = '';
  String _visa_to = '';
  String _passport_number = '';
  String _date_employed = '';
  String _employement_status = '';
  String _employement_type = '';
  String _ordinary_hours = '';
  String _method_of_payment = '';
  String _pay_period = '';
  String _apprenticeship_or_training = '';
  String _name_of_award = '';
  String _classification = '';
  String _superannuation_fund = '';
  String _superannuation_membership_number = '';
  String _bank_name = '';
  String _account_name = '';
  String _BSB_number = '';
  String _account_number = '';

  // Variable to store the entered email
  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      // Save the form data
      _formKey.currentState!.save();

      // You can perform actions with the form
      // data here and extract the details
      print('Name: $_first_name'); // Print the name
      print('Email: $_email'); // Print the email
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Form Example')),
      body: Form(
        // Associate the form key with this Form widget
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                // Label for the name field
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  // Validation function for the name field
                  if (value!.isEmpty) {
                    // Return an error message if the name is empty
                    return 'Please enter your name.';
                  }

                  // Return null if the name is valid
                  return null;
                },
                onSaved: (value) {
                  // Save the entered name
                  _first_name = value!;
                },
              ),
              TextFormField(
                // Label for the email field
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  // Validation function for the email field
                  if (value!.isEmpty) {
                    // Return an error message if the email is empty
                    return 'Please enter your email.';
                  }

                  // You can add more complex validation logic here
                  return null; // Return null if the email is valid
                },
                onSaved: (value) {
                  // Save the entered email
                  _email = value!;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                // Call the _submitForm function when
                // the button is pressed
                onPressed: _submitForm,

                // Text on the button
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
