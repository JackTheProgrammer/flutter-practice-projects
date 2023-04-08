part of 'payment_bloc.dart';
enum PaymentStatus{
  initial,
  loading,
  successful,
  failed
}

class PaymentState extends Equatable {
  final PaymentStatus status;
  final CardFieldInputDetails inputDetails;
  
  const PaymentState({
    this.status = PaymentStatus.initial,
    this.inputDetails = const CardFieldInputDetails(complete: false)
  });
  
  PaymentState copyWith({PaymentStatus? status, CardFieldInputDetails? inputDetails}){
    return PaymentState(
      inputDetails: inputDetails ?? this.inputDetails,
      status: status ?? this.status
    );
  }
  
  @override
  List<Object> get props => [inputDetails, status];
}
