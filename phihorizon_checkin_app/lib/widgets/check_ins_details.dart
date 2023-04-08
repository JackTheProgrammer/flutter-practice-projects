import 'package:flutter/material.dart';
import '/model/check_in.dart';

class CheckInsDetails extends StatefulWidget {
  final CheckIn checkIn;
  
  const CheckInsDetails({Key? key, required this.checkIn}) : super(key: key);

  @override
  State<CheckInsDetails> createState() => _CheckInsDetailsState();
}

class _CheckInsDetailsState extends State<CheckInsDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.checkIn.entry.toIso8601String()),
        Text(widget.checkIn.exit.toIso8601String()),
        Text(widget.checkIn.total.toIso8601String())
      ],
    );
  }
}