import 'package:flutter/material.dart';
import 'package:booking_room/booking.dart';
import 'package:booking_room/roomAvailability.dart'; // Import the new file for availability

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Booking Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingScreen()),
                );
              },
              child: Text('Booking Room'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomAvailability()),
                );
              },
              child: Text('Check Room Availability'),
            ),
          ],
        ),
      ),
    );
  }
}
