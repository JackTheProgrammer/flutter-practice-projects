import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../blocs/bloc/payment_bloc.dart';

class CardFormScreen extends StatefulWidget {
  const CardFormScreen({Key? key}) : super(key: key);

  @override
  State<CardFormScreen> createState() => _CardFormScreenState();
}

class _CardFormScreenState extends State<CardFormScreen> {
  CardEditController cardFormEditController = CardEditController();
  
  @override
  void dispose() {
    cardFormEditController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          cardFormEditController = CardEditController(
            initialDetails: state.inputDetails,
          );
          
          if(state.status == PaymentStatus.initial){
            return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                    "Card form",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CardField(
                    controller: cardFormEditController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      cardFormEditController.details.complete ?
                      context.read<PaymentBloc>().add(
                        const PaymentCreateIntent(
                          BillingDetails(
                            email: "fawadawan183@gmail.com",
                          ),
                          [
                            {'id': 0}, 
                            {'id': 1}
                          ]
                        )
                      )
                      : ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Card details missing")
                        )
                      );
                    }, 
                    child: const Icon(Icons.credit_card)
                  )
                ],
              ),
            );
          }
          
          if(state.status == PaymentStatus.successful){
            return Column(
              children: <Widget>[
                const Text("Payment successful"),
                const SizedBox(
                  height: 20,
                ),
                CardField(
                  controller: CardEditController(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<PaymentBloc>().add(PaymentStart());
                  }, 
                  child: const Icon(Icons.payments)
                )
              ],
            );
          }
          
          if(state.status == PaymentStatus.failed){
            return Column(
              children: <Widget>[
                const Text("Payment successful"),
                const SizedBox(
                  height: 20,
                ),
                CardField(
                  controller: CardEditController(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<PaymentBloc>().add(PaymentStart());
                  }, 
                  child: const Icon(Icons.warning)
                )
              ],
            );
          }
          
          if(state.status == PaymentStatus.loading){
            return const Center(child: CircularProgressIndicator(),);
          }
          
          return Text(state.status.toString());
        },
      ),
    );
  }
}
