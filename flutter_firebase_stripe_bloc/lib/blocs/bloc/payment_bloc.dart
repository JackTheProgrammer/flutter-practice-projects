import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentStart>(_onPaymentStart);
    on<PaymentCreateIntent>(_onPaymentCreateIntent);
    on<PaymentConfirmIntent>(_onPaymentConFirmIntent);
  }

  void _onPaymentStart(PaymentStart event, Emitter<PaymentState> emit) {
    emit(state.copyWith(status: PaymentStatus.initial));
  }

  void _onPaymentCreateIntent(PaymentCreateIntent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    final paymentMethod = await Stripe.instance.createPaymentMethod(
      PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(
          billingDetails: event.billingDetails
        )
      )
    );
    
    final paymentIntentResult = await _stripeEndPointMethodId(
      useStripeSdk: true,
      paymentMethodId: paymentMethod.id,
      currency: 'usd',
      items: event.items
    );
    
    if(paymentIntentResult["error"] != null){
      emit(state.copyWith(status: PaymentStatus.failed));
    }
    
    if(paymentIntentResult["clientSecret"] != null && paymentIntentResult["requiresAction"] == null){
      emit(state.copyWith(status: PaymentStatus.successful));
    }
    
    if(paymentIntentResult["clientSecret"] != null && paymentIntentResult["requiresAction"] == true){
      final String clientSecret = paymentIntentResult["clientSecret"];
      add(PaymentConfirmIntent(clientSecret));
    }
  }

  void _onPaymentConFirmIntent(PaymentConfirmIntent event, Emitter<PaymentState> emit) async {
    try {
      final paymentIntent = await Stripe.instance.handleNextAction(event.clientSecret);
      if(paymentIntent.status == PaymentIntentsStatus.RequiresConfirmation){
        var paymentResult = await _stripeEndPointMethodId(paymentMethodId: paymentIntent.id);
        if(paymentResult["error"] != null){
          emit(state.copyWith(status: PaymentStatus.failed));
        } else {
          emit(state.copyWith(status: PaymentStatus.successful));
        }
      }
    }catch (e) {
      log(e.toString());
      emit(state.copyWith(status: PaymentStatus.failed));
    }
  }
  
  Future<Map<String, dynamic>> _stripeEndPointMethodId({
    bool? useStripeSdk,
    required String paymentMethodId,
    String? currency,
    List<Map<String, dynamic>>? items
  }) async {
    var body = json.encode({
      "useStripeSdk": useStripeSdk ?? true,
      "paymentMethodId": paymentMethodId,
      "currency": currency ?? 'usd',
      "items": items ?? [{'id': '0'}],
    });
    
    var headers = {
      'Content-Type': 'application/json'
    };
    
    var encoding = Encoding.getByName("utf-8");
    
    var endPointMethodIdtUrl = Uri.parse("https://us-central1-flutter-stripe-bloc.cloudfunctions.net/StripeEndPointMethodId");
    
    var response = await http.post(
      endPointMethodIdtUrl, 
      body: body, 
      encoding: encoding, 
      headers: headers
    );
    
    return json.decode(response.body);
  }
}