import 'package:flutter/material.dart';
import '/widgets/employee_detail_form.dart';

class EmployeeDetailsScanning extends StatefulWidget {
  const EmployeeDetailsScanning({ Key? key }) : super(key: key);

  @override
  State<EmployeeDetailsScanning> createState() => _EmployeeDetailsScanningState();
}

class _EmployeeDetailsScanningState extends State<EmployeeDetailsScanning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details"),),
      body: const EmployeeDetailForm(),
    );
  }
}