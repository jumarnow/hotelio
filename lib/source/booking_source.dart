import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/model/booking.dart';

class BookingSource {
  static Future<Booking?> checkIsBooked(String userId, String hotelId) async {
    var result = await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .collection('Booking')
        .where('id_hotel', isEqualTo: hotelId)
        .where('is_done', isEqualTo: false)
        .get();

    if (result.docs.isEmpty) return null;
    return Booking.fromJson(result.docs.first.data());
  }
}