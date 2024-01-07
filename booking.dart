import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String matricNo = '';
  String name = '';
  DateTime? selectedDate;
  int numberOfGuests = 1;
  String selectedRoomType = 'Classroom';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _showBookingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation Booking'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Matric No. / Staff No.: $matricNo'),
              Text('Name: $name'),
              Text('Selected Date: ${selectedDate?.toLocal()}'.split(' ')[0]),
              SizedBox(height: 8),
              Text('Number of Guests: $numberOfGuests'),
              SizedBox(height: 8),
              Text('Room Type: $selectedRoomType'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your booking logic here
                // You can use selectedDate, numberOfGuests, selectedRoomType for further processing

                // Close the dialog
                Navigator.of(context).pop();

                // Navigate back to the main screen
                Navigator.of(context).pop();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Room'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  matricNo = value;
                },
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Student Name / Staff Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              if (selectedDate != null) // Check if date is selected
                Text(
                  'Selected Date: ${selectedDate?.toLocal()}'.split(' ')[0],
                  style: TextStyle(fontSize: 18),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Number of Guests:',
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<int>(
                    value: numberOfGuests,
                    onChanged: (value) {
                      setState(() {
                        numberOfGuests = value!;
                      });
                    },
                    items: List.generate(10, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text((index + 1).toString()),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Room Type:',
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButton<String>(
                    value: selectedRoomType,
                    onChanged: (value) {
                      setState(() {
                        selectedRoomType = value!;
                      });
                    },
                    items: ['Classroom', 'Auditorium Room', 'Interactif Room']
                        .map((String roomType) {
                      return DropdownMenuItem<String>(
                        value: roomType,
                        child: Text(roomType),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showBookingDialog();
                },
                child: Text('Book a Room'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
