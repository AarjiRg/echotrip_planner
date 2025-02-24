import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewTripController with ChangeNotifier{
    final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void>ontripadded(
    {
      required String tripname,
      required String startinglocation,
      required String destination,
      required String departure_dateandtime,
      required String vechile_charge,
      required String EstimatedRange,
      required String AccommodationPreferences,
      required String EstimatedBudget,
      required String ChargingCostCalculation,
    }
  )async {
  User? user =_auth.currentUser; 
  if(user == null){ 
    throw Exception("user is not logged in");
  }
  DocumentSnapshot userDoc = await _firestore.collection("user").doc(user.uid).get();
  if (!userDoc.exists || !userDoc.data().toString().contains('fullName')) {
        throw Exception("User details not found.");
      }
  }
}