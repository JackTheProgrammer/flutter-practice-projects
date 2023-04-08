import 'package:cloud_firestore/cloud_firestore.dart' show DocumentSnapshot;

class CheckIn{
  final DateTime entry, exit, total;
  
  CheckIn(this.entry, this.exit, this.total);
  
  factory CheckIn.fromMap(Map map){
    return CheckIn(map['entry'], map['exit'], map['total']);
  }
  
  factory CheckIn.fromDocumentSnapshot(DocumentSnapshot snapshot){
    return CheckIn(snapshot['entry'], snapshot['exit'], snapshot['total']);
  }
}