import 'package:flutter/material.dart';
import 'package:register_app/splashscreen.dart';

void main() => runApp(
  MaterialApp(
    routes: {
      '/': (context) => SplashScreen(),
      '/home': (context) => EmployeeFormPage(),
      // Add more routes here if needed
    },
  ),
);

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
  bool hasAgreed = false;
  bool hasPieceworkAgreement = false;
  bool hasEmergencyPlan = false;
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
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Employee Details",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
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
                ElevatedButton(
                  onPressed: () => _showPieceWorkPopup(context),
                  child: Text("Agree Piecework Agreement"),
                ),
                _buildInductionChecklist(),
                _buildCovidDeclaration(),

                //_buildEmergency(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _showEmergencyPlanPopup(context),
                  child: Text("View Emergency Plan"),
                ),
                ElevatedButton(
                  onPressed: () => _showWorkPlaceHealthPopup(context),
                  child: Text("View Workplace Health & Saftey"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      hasAgreed = true;
                      hasPieceworkAgreement = true; // Toggle agreement status
                      hasEmergencyPlan = true; // Toggle emergency plan status
                    });
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
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
            decoration: InputDecoration(
              labelText: "First Name",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (val) => firstName = val,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Last Name",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
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
          decoration: InputDecoration(
            labelText: "Address",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => address = val,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Contact No",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => contactNo = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => dob = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Tax File Number",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => taxFile = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Country",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => country = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Visa Type",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => visaType = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Visa From",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => visaFrom = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Visa To",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
          decoration: InputDecoration(
            labelText: "Passport Number",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => passport = val,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Employment Start Date",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => employmentStartDate = val,
        ),
      ],
    );
  }

  Widget _buildEmploymentStatusFields() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Employment Status",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
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
            decoration: InputDecoration(
              labelText: "Specify Other Status",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (val) => otherEmploymentStatus = val,
          ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Employment Type",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
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
            decoration: InputDecoration(
              labelText: "Specify Other Type",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (val) => otherType = val,
          ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Ordinary Hours Worked",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => hoursWorked = val,
        ),
      ],
    );
  }

  Widget _buildPayFields() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Method of Pay",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          items: [
            "CASH",
            "BANK",
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (val) => paymentMethod = val,
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Pay Period",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Super Fund Name",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => superFund = val,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Membership Number",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => superNumber = val,
        ),
      ],
    );
  }

  Widget _buildBankFields() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Bank Details",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Bank Name",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => bankName = val,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Account Name",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => bankAccountName = val,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "BSB",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => bsb = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Account Number",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "BIRVA AUS PTY LTD\n          AND\n    (Employee)\n",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "The Employer and the Employee agree to enter into this piecework Agreement (Agreement) under clause 15 (Piecework) of the horticulture Award 2010 [MA000028] (Award). The Employer and Employee mutually agree as follow:\n 1. The work performed under this agreement is as described below (Work) [Add description of work – e.g. picking/packing. If the employee also performs work that isn’t covered by the piecework agreement this should not be included here.]\n 2. The minimum piecework rates which must be paid by the employer to the Employee for performing the work is as specified in Schedule A to the Agreement\n 3. The Employee is Employed as a Casual/ part-time / full-time employee\n 4. The Employee must work in Individual on piece rate job.",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Agreement Start Date",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          onChanged: (val) => agreementStartDate = val,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Employer Name",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => employerName = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Employee Name",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => employeeName = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Employer Signature",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => employerSignature = val,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Employee Signature",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => employeeSignature = val,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Date",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => DateTime.now().toString(),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Date",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (val) => DateTime.now().toString(),
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Position",
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
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
        Text(
          "\n Piecework Rates",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...rates.map(
          (rate) => TextFormField(initialValue: rate, enabled: true),
        ),
      ],
    );
  }

  void _showPieceWorkPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Piecework Agreement"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Notes: \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "1. All rates before government tax. \n 2. The Employee’s earning will depend on their productivity. \n *List the variable considered in arriving at the piecework rate. Variables can include things like weather conditions; ripening process; type of picking (e.g. selective or stripping), packing or pruning; size of trees/plants; density of trees/plants. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Minimum wage guarantee \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Under the Horticulture Award 2020 a pieceworker must be paid for each day on which they work no less than their hourly rate under the Award (including the 25% casual loading for a casual pieceworker) multiplied by the number of hours worked on that day.\n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Hourly rate under the Award: \$29.33 per hour (\$23.47 + 25%). \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "This is based on you being employed as a casual employee at the level 1 classification level. This rate includes your 25% casual loading. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Additional information about your employment conditions as: \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "1. If you are doing work not covered by this record, you will be paid the minimum wages (based on your hourly rate) under the Award. \n 2. When applicable, you will be paid 200% (double) of your relevant piece-rate for working on a public holiday.\n 3. When applicable, you will be paid the following allowances under clause 18 of the Award: \n 4. The following clauses of the Award do not apply to you as a pieceworker: \n clause 13 - Ordinary hours of work and rostering arrangements \n clause 18.3(c) - Meal allowance \n clause 21 - Overtime   \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Contact information \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "You may seek information about minimum employment conditions from the Fair Work Ombudsman.\n Find more information on the Fair Work Ombudsman website fairwork.gov.au/horticulture or by calling 13 13 94. \n You can also view the Award at library. fairwork.gov.au/award/?krn=MA000028 \n If you have any questions or would like to discuss this piecework record further, please contact Kaushikkumar Patel on 0420264939 or at Birva.ausptyltd@gmail.com  \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Add more terms as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  hasPieceworkAgreement =
                      true; // Assuming you have a hasAgreed variable
                });
                Navigator.of(context).pop();
              },
              child: Text("Agree"),
            ),
          ],
        );
      },
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
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
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
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
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

  void _showWorkPlaceHealthPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Workplace Health and Safety"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Policy \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Ultimately, everyone at the workplace is responsible for ensuring health and safety at that workplace. The business demands a positive, proactive attitude and performance with respect to protecting health, safety and the environment by all employees, irrespective of their position. \n The business will, as far as practicable, provide a safe work environment for the health, safety and welfare of our employees, contractors, visitors and members of the public who may be affected by our work. To do this, the business will:\n 1. develop and maintain safe systems of work, and a safe working environment.\n 2. consult with employees and health and safety reps on safety.\n 3. provide protective clothing and equipment, and enforce its use.\n 4. provide information and training for employees.\n 5. assess all risks before work starts on new areas of operation. \n 6. remove unacceptable riskes to safety. \n 7. provide employees and contractors with adequate facilities (clean toilets, clean drinking water, hygienic eating areas).\n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Personal Protective Equipment (PPE) \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "If you are allocated PPE, it must be worn. It is your responsibility to ensure it is working properly with no damage. Any damage or faulty PPE must be reported and replaced. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Manual Handling Policy \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "While management is responsible for the health, safety and welfare of all staff, all employees must report potential and actual manual handling hazards. Never lift or manually handle items larger or heavier than you can easily support. Use a mechanical device where available (forklifts, roller conveyors) to reduce the risk of injury. If you are in any doubt, do not hesitate to ask for help. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Injury Procedures \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "If there is an injury:\n The priority is medical attention. The injured worker or nearest colleague should contact one of the first aiders. For a serious injury also call an ambulance. Any employee who is injured on the job, experiences a safety incident or a near miss, must report the incident to their manager. The manager must record and follow up on any Injuries, Incidents and Near Misses. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Smoking Policy \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "Smoking is not permitted in any food processing areas including receival, production, storage, cold room areas, or any workshops, or in company vehicles. The designated smoking area for all factory/office staff is the southern side of the factory staff lunchroom, away from factory access doors and lunchrooms. Cigarette butts must be disposed of appropriately in designated waste disposal bins. Smokers are only permitted to do so in their allotted break times. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Alcohol and Drugs Policy \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "The business is concerned by factors affecting an employee's ability to safely and effectively do their work to a satisfactory standard. The business recognises alcohol or other drug abuse can impair short-term or long-term work performance and is an occupational health and safety risk. \n The business will do its utmost to create and maintain a safe, healthy and productive workplace for all employees. The business has a zero-tolerance policy in regards to the use of illicit drugs on their premises or the attending of other business related premises (e.g. clients) while under the influence of illicit drugs. Contravening either of these points may lead to instant dismissal. \n The business does not tolerate attending work under the influence of alcohol. This may result in performance improvement action or dismissal. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Employee Behaviour \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "It is the employee's responsibility to behave in an appropriate manner always so as not to put themselves or any other workers or equipment at risk of injury or damage. Follow safety signs and obey lawful instructions by your supervisor. Do not climb on equipment, use safety equipment where provided. \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Add more terms as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  hasAgreed = true; // Assuming you have a hasAgreed variable
                });
                Navigator.of(context).pop();
              },
              child: Text("Agree"),
            ),
          ],
        );
      },
    );
  }

  void _showEmergencyPlanPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Emergency Plan"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "1. Responsibilities \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Has someone with appropriate skills been made responsible for specific actions in an emergency, for example managing an evacuation or assigning area wardens? .\n b. Is someone responsible for making sure all workers and others in the workplac e, for example contractors, customers and visitors are accounted for in an evacuation? \n c. Do workers working alone know what to do in an emergency? \n d. Are specific procedures in place for critical functions, for example po wer shut-do wns? \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "2. Emergency Contact Details \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Are emergency contact details relevant to the types of possible threats, for example fire brigade, police and poison information Centre? \n b. Are the emergency contact details displayed at the workplace in an easily accessible location? Are contact details updated regularly? \n c. Please Call to BIRVA AUS PTY LTD (Kaushikkumar Patel) +61 420 264 939 \n ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "3. Evacuations \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Have all emergencies requiring an evacuation at the workplace been identified? \n b. Has an evacuation procedure been prepared (if applicable)? \n c. Does the procedure: address all types of situations and hazards which may arise at the workplace \n d. Cover everyone who may be present at the workplace? \n e. Allow for quick and safe evacuation when needed \n f. Allow for quick and safe evacuation when needed \n g. Clearly identify routes to safe assembly areas consider special assistance for hearing, vision or mobility-impaired people, and include a process for accounting for persons?  \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "4. Evacuation for a fixed workplace \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Is the evacuation procedure clearly and prominently displayed at the workplace, where practicable? \n b. Is there a mechanism, for example a siren or bell alarm for alerting staff of an emergency? If yes, is it regularly tested to ensure its effectiveness? \n c. Is there a documented site plan that illustrates the location of fire protection equipment, emergency exits and assembly points? If yes, is it posted in key locations throughout the workplace? \n d. Are all exits, corridors and aisles readily accessible and kept clear of obstructions? \n e. Does the workplace have illuminated exit signs?  \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "5. Fire protection equipment \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Does the workplace have appropriate fire protection equipment? Is it suitable for the types of risks at the workplace, for example foam or dry powder type extinguishers\n b. Is it properly maintained and regularly checked and tested by the local fire authority or fire equipment supplier?\n c. Is the area where the equipment is stored kept clear of obstructions?\n  d. Are adequate numbers of workers trained to use fire extinguishers? Do they know what type of extinguisher to use for ?    \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "6. Extreme weather Conditions \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. If there is a risk of extreme or dangerous weather conditions, for example bushfire, floods or storms, will the control measures be effective in these conditions? \n b. Do emergency procedures accommodate declarations of extreme weather warnings? Examples of extreme weather warnings may include warnings such as a code red in the case of extreme bushfires or categories 3, 4 or 5 for cyclone warnings. Do declarations of extreme weather warnings in the emergency plan include matters such as: safe exit routes, for example the process for identifying and communicating roads that may be closed? \n c. Do procedures identify the closest designated ‘safe place’? \n d. Do procedures accommodate evacuation procedures of the relevant local authorities for example the fire services,SES and police?\n e. Do workers have access to reliable communications equipment? \n f. Are workers trained in emergency evacuation and related procedures? By contractors or supervisor\n g. If workers travel into areas where extreme weather warnings may be declared, have appropriate policies and procedures been developed for when such declarations are made?   \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "7. First Aid \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Has a first aid assessment been conducted?\n b. Does the workplace have trained first aiders and suitable first aid facilities?\n c. Are workers aware of where first aid facilities are kept and who first aiders are? \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "8. Neighbouring businesses \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a.Have neighbouring businesses been considered if an emergency occurs? How would they be advised of an emergency situation arises (if applicable)?\n b. Should they be consulted about the preparation and coordination of emergency plans? \n c. Have the risks from neighbouring businesses been considered, for example fire from restaurant/takeaway food outlets, Q fever from cattle yards or vehicle accidents on major roads?  \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "9. Post Incident Follow-up \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Are there procedures in place to notify the relevant regulator about a notifiable incident where necessary?  \n b.Are there procedures in place to ensure the cause of the emergency is determined and action is taken to prevent a similar incident occurring again?\n c. Are there procedures in place to ensure the welfare of workers after an emergency or an incident, for example medical treatment or trauma counselling?   \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "10. Review \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "a. Are emergency plan practice runs undertaken to assess the effectiveness of the emergency plan, for example evacuation drills? \n b. Is someone responsible for documenting and retaining the results of emergency plan practice runs? \n c. Is someone responsible for reviewing the emergency plan and informing workers of any revisions?  \n",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                // Add more terms as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  hasEmergencyPlan =
                      true; // Assuming you have a hasAgreed variable
                });
                Navigator.of(context).pop();
              },
              child: Text("Agree"),
            ),
          ],
        );
      },
    );
  }

  void _showSubmitPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Submit Form"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "1. All the information mentioned are true to my knowledge. \n",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                //ElevatedButton(onPressed:  , child: Text("Submit")),
                //ElevatedButton(onPressed: , child: Text("Print"))
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  hasEmergencyPlan =
                      true; // Assuming you have a hasAgreed variable
                });
                Navigator.of(context).pop();
              },
              child: Text("Agree"),
            ),
          ],
        );
      },
    );
  }
}
