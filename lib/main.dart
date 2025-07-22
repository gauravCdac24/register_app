import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: EmployeeFormPage()));

class EmployeeFormPage extends StatefulWidget {
  const EmployeeFormPage({super.key});

  @override
  State<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form field variables
  String? firstName, lastName, address, contactNo, email, dob, taxFile;
  String? country, visaType, visaFrom, visaTo, passport, employmentStartDate;
  String? employmentStatus, employmentType, paymentMethod, payPeriod;
  String? superFund, superNumber, bankName, bankAccountName, bsb, accNumber;
  String? jobTitle, awardName, hoursWorked;
  String? pieceworkDescription,
      agreementStartDate,
      employerName,
      employeeName,
      employerSignature,
      employeeSignature,
      position;

  bool showOtherEmploymentStatus = false;
  String? otherEmploymentStatus;
  bool showOtherType = false;
  String? otherType;

  List<String> covidAnswers = List.filled(6, '');
  List<bool> inductionChecklist = List.filled(9, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BIRVA Employee & Rate Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Employee Details",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              _buildNameFields(),
              _buildAddressContactFields(),
              _buildDOBTaxVisaFields(),
              _buildPassportEmploymentFields(),
              _buildEmploymentStatusFields(),
              _buildPayFields(),
              _buildSuperFields(),
              _buildBankFields(),
              _buildPieceworkAgreementFields(),
              _buildScheduleARates(),
              _buildCovidDeclaration(),
              _buildInductionChecklist(),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Form submitted successfully")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(labelText: "First Name"),
            onChanged: (val) => firstName = val,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(labelText: "Last Name"),
            onChanged: (val) => lastName = val,
          ),
        ),
      ],
    );
  }

  Widget _buildAddressContactFields() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: "Address"),
          onChanged: (val) => address = val,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Contact No"),
                onChanged: (val) => contactNo = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (val) => email = val,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDOBTaxVisaFields() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Date of Birth"),
                onChanged: (val) => dob = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Tax File Number"),
                onChanged: (val) => taxFile = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Country"),
                onChanged: (val) => country = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Visa Type"),
                onChanged: (val) => visaType = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Visa From"),
                onChanged: (val) => visaFrom = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Visa To"),
                onChanged: (val) => visaTo = val,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPassportEmploymentFields() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: "Passport Number"),
          onChanged: (val) => passport = val,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Employment Start Date"),
          onChanged: (val) => employmentStartDate = val,
        ),
      ],
    );
  }

  Widget _buildEmploymentStatusFields() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "Employment Status"),
          items: [
            "Ongoing",
            "Temporary",
            "Other",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) {
            setState(() {
              employmentStatus = val;
              showOtherEmploymentStatus = val == "Other";
            });
          },
        ),
        if (showOtherEmploymentStatus)
          TextFormField(
            decoration: InputDecoration(labelText: "Specify Other Status"),
            onChanged: (val) => otherEmploymentStatus = val,
          ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "Employment Type"),
          items: [
            "Full-time",
            "Part-time",
            "Casual",
            "Other",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) {
            setState(() {
              employmentType = val;
              showOtherType = val == "Other";
            });
          },
        ),
        if (showOtherType)
          TextFormField(
            decoration: InputDecoration(labelText: "Specify Other Type"),
            onChanged: (val) => otherType = val,
          ),
        TextFormField(
          decoration: InputDecoration(labelText: "Ordinary Hours Worked"),
          onChanged: (val) => hoursWorked = val,
        ),
      ],
    );
  }

  Widget _buildPayFields() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "Method of Pay"),
          items: [
            "CASH",
            "BANK",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) => paymentMethod = val,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(labelText: "Pay Period"),
          items: [
            "WEEKLY",
            "FORTNIGHTLY",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) => payPeriod = val,
        ),
      ],
    );
  }

  Widget _buildSuperFields() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Superannuation",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Super Fund Name"),
          onChanged: (val) => superFund = val,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Membership Number"),
          onChanged: (val) => superNumber = val,
        ),
      ],
    );
  }

  Widget _buildBankFields() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text("Bank Details", style: Theme.of(context).textTheme.headlineMedium),
        TextFormField(
          decoration: InputDecoration(labelText: "Bank Name"),
          onChanged: (val) => bankName = val,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Account Name"),
          onChanged: (val) => bankAccountName = val,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "BSB"),
                onChanged: (val) => bsb = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Account Number"),
                onChanged: (val) => accNumber = val,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPieceworkAgreementFields() {
    return Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Piecework Agreement",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          "BIRVA AUS PTY LTD\n          AND\n    (Employee)\n",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "The Employer and the Employee agree to enter into this piecework Agreement (Agreement) under clause 15 (Piecework) of the horticulture Award 2010 [MA000028] (Award). The Employer and Employee mutually agree as follow:\n 1. The work performed under this agreement is as described below (Work) [Add description of work – e.g. picking/packing. If the employee also performs work that isn’t covered by the piecework agreement this should not be included here.]\n 2. The minimum piecework rates which must be paid by the employer to the Employee for performing the work is as specified in Schedule A to the Agreement\n 3. The Employee is Employed as a Casual/ part-time / full-time employee\n 4. The Employee must work in Individual on piece rate job.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Agreement Start Date"),
          onChanged: (val) => agreementStartDate = val,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Employer Name"),
                onChanged: (val) => employerName = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Employee Name"),
                onChanged: (val) => employeeName = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Employer Signature"),
                onChanged: (val) => employerSignature = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Employee Signature"),
                onChanged: (val) => employeeSignature = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Date"),
                onChanged: (val) => DateTime.now().toString(),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: "Date"),
                onChanged: (val) => DateTime.now().toString(),
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Position"),
          onChanged: (val) => position = val,
        ),
      ],
    );
  }

  Widget _buildScheduleARates() {
    final rates = [
      "Shallot Picking (green): \$8.75/box",
      "Shallot Picking (purple): \$9.00/box",
      "Broccolini Bunching: \$63.00/bin",
      "Tractor/Ute Driving: \$32.00/hour",
      "Forklift Driving: \$32.00/hour",
      "Stockcounting Pallet: \$7.00/crate",
      "Broccolini Picking: \$63.00/bin",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(labelText: "Agreement Start Date"),
          onChanged: (val) => agreementStartDate = val,
        ),
        Text(
          "Schedule A: Piecework Rates",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ...rates.map(
          (rate) => TextFormField(initialValue: rate, enabled: false),
        ),
      ],
    );
  }

  Widget _buildCovidDeclaration() {
    final questions = [
      "Are you a confirmed case of COVID-19?",
      "Close contact with a confirmed case in last 14 days?",
      "Returned from overseas in last 14 days?",
      "Close contact with someone from overseas in last 14 days?",
      "Close contact with someone with flu symptoms?",
      "Do you have flu-like symptoms currently or in last 48 hours?",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          "COVID-19 Health Declaration",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ...questions.asMap().entries.map((entry) {
          final i = entry.key;
          final q = entry.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(q),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("Yes"),
                      value: "Yes",
                      groupValue: covidAnswers[i],
                      onChanged: (val) =>
                          setState(() => covidAnswers[i] = val!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("No"),
                      value: "No",
                      groupValue: covidAnswers[i],
                      onChanged: (val) =>
                          setState(() => covidAnswers[i] = val!),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildInductionChecklist() {
    final items = [
      "Intro to farm, team, conduct",
      "Employment terms and conditions",
      "Signed contracts and documents",
      "Rosters and leave procedures",
      "Company policies",
      "OHS and safety",
      "Farm tour and general info",
      "Emergency contacts and fire safety",
      "Machinery usage",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          "Induction Checklist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ...items.asMap().entries.map((entry) {
          final i = entry.key;
          return CheckboxListTile(
            title: Text(entry.value),
            value: inductionChecklist[i],
            onChanged: (val) => setState(() => inductionChecklist[i] = val!),
          );
        }),
      ],
    );
  }
}
