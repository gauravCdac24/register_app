// ignore_for_file: library_private_types_in_public_api
import 'dart:io';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class EmployeeRegister extends StatefulWidget {
  const EmployeeRegister({super.key});

  @override
  _EmployeeRegister createState() => _EmployeeRegister();
}

class _EmployeeRegister extends State<EmployeeRegister> {
  // A key for managing the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateofbirthController = TextEditingController();
  final TextEditingController taxFileController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController visaTypeController = TextEditingController();
  final TextEditingController visaFromController = TextEditingController();
  final TextEditingController visaToController = TextEditingController();
  final TextEditingController passportNumberController =
      TextEditingController();
  final TextEditingController dateEmployedController = TextEditingController();
  final TextEditingController employmentStatusController =
      TextEditingController();
  final TextEditingController employmentTypeController =
      TextEditingController();
  final TextEditingController ordinaryHoursController = TextEditingController();
  final TextEditingController methodOfPaymentController =
      TextEditingController();
  final TextEditingController payPeriodController = TextEditingController();
  final TextEditingController apprenticeshipOrTrainingController =
      TextEditingController();
  final TextEditingController nameOfAwardController = TextEditingController();
  final TextEditingController classificationController =
      TextEditingController();
  final TextEditingController superannuationFundController =
      TextEditingController();
  final TextEditingController superannuationMembershipNumberController =
      TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNameController = TextEditingController();
  final TextEditingController bsbNumberController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final List<String> _employmentstatus = ['Ongoing', 'Temporary', 'Other'];
  final List<String> _EmploymentType = [
    'Full Time',
    'Part Time',
    'Casual',
    'Other(Specify e.g. piece worker)',
  ];
  final List<String> _MethodOfPayment = ['Cash', 'Bank'];
  final List<String> _PayPeriod = ['Weekly', 'Fortnightly'];

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
  String? _employementstatus;
  String? _employement_type = '';
  String _ordinary_hours = '';
  String? _method_of_payment = '';
  String? _pay_period = '';
  String _apprenticeship_or_training = '';
  String _name_of_award = '';
  String _classification = '';
  final String _superannuation_fund = '';
  final String _superannuation_membership_number = '';
  final String _bank_name = '';
  final String _account_name = '';
  final String _BSB_number = '';
  final String _account_number = '';

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Employee Details')),
      body: SingleChildScrollView(
        child: Form(
          // Associate the form key with this Form widget
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your first name.';
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
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your last name.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _last_name = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your address.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _address = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Contact Number'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your contact number.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _contact_number = value!;
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
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Date of Birth'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your date of birth.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _date_of_birth = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Tax File'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your Tax File Number.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _tax_file = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Country'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your country.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _country = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Visa Type'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your visa type.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _visa_type = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Visa Period: From'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your visa period: from.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _visa_from = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Visa Period: To'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your Visa period: to';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _visa_to = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Passport Number'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your passport number.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _passport_number = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText: 'Date Employment Commenced',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your Date Employment Commenced.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _date_employed = value!;
                  },
                ),
                DropdownButtonFormField<String>(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Employment Status'),
                  value: _employementstatus,
                  items: _employmentstatus.map((String status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _employementstatus = value;
                    });
                  },
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please select your employment status.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _employementstatus = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'Employment Type'),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please select your employment type.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _employement_type = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText:
                        'Ordinary Hours of Work(For part Time or Full Time Employees; e.g. 25:)',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your ordinary hours of work.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _ordinary_hours = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText: 'Agreed/Required method of payment',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please select your method of payment.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _method_of_payment = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText: 'Agreed/Required Pay Period',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please select your pay period.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _pay_period = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText: 'Apprenticeship/Training',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter any one.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _apprenticeship_or_training = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText: 'Name of Award or Agreement That',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter name or agreement.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _name_of_award = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(
                    labelText: 'Classification/Job Title under the Award',
                  ),
                  validator: (value) {
                    // Validation function for the name field
                    if (value!.isEmpty) {
                      // Return an error message if the name is empty
                      return 'Please enter your job title under the Award.';
                    }

                    // Return null if the name is valid
                    return null;
                  },
                  onSaved: (value) {
                    // Save the entered name
                    _classification = value!;
                  },
                ),
                TextFormField(
                  // Label for the name field
                  decoration: InputDecoration(labelText: 'SUPPERANNUATION'),
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
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Save as draft'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  // Call the _submitForm function when
                  // the button is pressed
                  onPressed: _saveToExcel,
                  // Text on the button
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveToExcel() async {
    var status = await Permission.storage.request();
    if (!status.isGranted) return;

    // Create Excel document
    final excel.Workbook workbook = excel.Workbook();
    final excel.Worksheet sheet = workbook.worksheets[0];

    // Add headers
    sheet.getRangeByName('A1').setText('First_Name');
    sheet.getRangeByName('B1').setText('Last_Name');
    sheet.getRangeByName('C1').setText('Address');
    sheet.getRangeByName('D1').setText('Contact_Number');
    sheet.getRangeByName('E1').setText('Email');
    sheet.getRangeByName('F1').setText('Date_of_Birth');
    sheet.getRangeByName('G1').setText('Tax_File');
    sheet.getRangeByName('H1').setText('Country');
    sheet.getRangeByName('I1').setText('Visa_Type');
    sheet.getRangeByName('J1').setText('Visa_From');
    sheet.getRangeByName('K1').setText('Visa_To');
    sheet.getRangeByName('L1').setText('Passport_Number');
    sheet.getRangeByName('M1').setText('Date_Employed');
    sheet.getRangeByName('N1').setText('Employment_Status');
    sheet.getRangeByName('O1').setText('Employment_Type');
    sheet.getRangeByName('P1').setText('Ordinary_Hours');
    sheet.getRangeByName('Q1').setText('Method_of_Payment');
    sheet.getRangeByName('R1').setText('Pay_Period');
    sheet.getRangeByName('S1').setText('Apprenticeship_or_Training');
    sheet.getRangeByName('T1').setText('Name_of_Award');
    sheet.getRangeByName('U1').setText('Classification');
    sheet.getRangeByName('V1').setText('Superannuation_Fund');
    sheet.getRangeByName('W1').setText('Superannuation_Membership_Number');
    sheet.getRangeByName('X1').setText('Bank_Name');
    sheet.getRangeByName('Y1').setText('Account_Name');
    sheet.getRangeByName('Z1').setText('BSB_Number');
    sheet.getRangeByName('AA').setText('Account_Number');

    // Add values
    sheet.getRangeByName('A2').setText(firstnameController.text);
    sheet.getRangeByName('B2').setText(lastnameController.text);
    sheet.getRangeByName('C2').setText(addressController.text);
    sheet.getRangeByName('D2').setText(contactNumberController.text);
    sheet.getRangeByName('E2').setText(emailController.text);
    sheet.getRangeByName('F2').setText(dateofbirthController.text);
    sheet.getRangeByName('G2').setText(taxFileController.text);
    sheet.getRangeByName('H2').setText(countryController.text);
    sheet.getRangeByName('I2').setText(visaTypeController.text);
    sheet.getRangeByName('J2').setText(visaFromController.text);
    sheet.getRangeByName('K2').setText(visaToController.text);
    sheet.getRangeByName('L2').setText(passportNumberController.text);
    sheet.getRangeByName('M2').setText(dateEmployedController.text);
    sheet.getRangeByName('N2').setText(employmentStatusController.text);
    sheet.getRangeByName('O2').setText(employmentTypeController.text);
    sheet.getRangeByName('P2').setText(ordinaryHoursController.text);
    sheet.getRangeByName('Q2').setText(methodOfPaymentController.text);
    sheet.getRangeByName('R2').setText(payPeriodController.text);
    sheet.getRangeByName('S2').setText(apprenticeshipOrTrainingController.text);
    sheet.getRangeByName('T2').setText(nameOfAwardController.text);
    sheet.getRangeByName('U2').setText(classificationController.text);
    sheet.getRangeByName('V2').setText(superannuationFundController.text);
    sheet
        .getRangeByName('W2')
        .setText(superannuationMembershipNumberController.text);
    sheet.getRangeByName('X2').setText(bankNameController.text);
    sheet.getRangeByName('Y2').setText(accountNameController.text);
    sheet.getRangeByName('Z2').setText(bsbNumberController.text);
    sheet.getRangeByName('AA2').setText(accountNumberController.text);

    // Save workbook to file
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    // Get path
    final directory = await getExternalStorageDirectory();
    final path = directory!.path;
    final file = File('$path/form_data.xlsx');

    await file.writeAsBytes(bytes, flush: true);

    print('Excel file saved at: ${file.path}');
  }
}
