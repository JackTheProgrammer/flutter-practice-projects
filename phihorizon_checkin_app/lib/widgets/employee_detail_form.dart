import 'package:flutter/material.dart';

class EmployeeDetailForm extends StatefulWidget {
  const EmployeeDetailForm({ Key? key }) : super(key: key);

  @override
  State<EmployeeDetailForm> createState() => _EmployeeDetailFormState();
}

class _EmployeeDetailFormState extends State<EmployeeDetailForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  late String name, email, phoneNo;
  final formStateKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              controller: _nameController,
              onSaved: ((newValue) {
                formStateKey.currentState!.save();
              }),
              onFieldSubmitted: (enteredName){
                setState(() {
                  name = enteredName;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              controller: _emailController,
              onSaved: ((newValue) {
                formStateKey.currentState!.save();
              }),
              onFieldSubmitted: (enteredEmail){
                setState(() {
                  name = enteredEmail;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              controller: _phoneNoController,
              onSaved: ((newValue) {
                formStateKey.currentState!.save();
              }),
              onFieldSubmitted: (number){
                setState(() {
                  phoneNo = number;
                });
              },
            ),
          ),
          Center(child: IconButton(onPressed: (){}, icon: const Icon(Icons.add)))
        ],
      ),
    );
  }
}