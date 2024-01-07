import 'package:flutter/material.dart'; //for display room available

class RoomAvailabilityWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Room Availability',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              RoomStatusItem(
                  type: 'Dewan Seminar', roomNumber: '1', status: 'Free'),
              RoomStatusItem(
                  type: 'Dewan Seminar', roomNumber: '2', status: 'In Use'),
              RoomStatusItem(
                  type: 'Dewan Kuliah A1 (DKA1)',
                  roomNumber: '1',
                  status: 'Free'),
              RoomStatusItem(
                  type: 'Dewan Kuliah A2 (DKA2)',
                  roomNumber: '1',
                  status: 'In Use'),
              RoomStatusItem(
                  type: 'Auditorium Room',
                  roomNumber: '1-01',
                  status: 'In Use'),
              RoomStatusItem(
                  type: 'Auditorium Room', roomNumber: '1-02', status: 'Free'),
            ],
          ),
        ),
      ],
    );
  }
}

class RoomStatusItem extends StatelessWidget {
  final String type;
  final String roomNumber;
  final String status;

  RoomStatusItem({
    required this.type,
    required this.roomNumber,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('$type $roomNumber'),
        subtitle: Text('Status: $status'),
      ),
    );
  }
}

class RoomAvailability extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Availability'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: RoomAvailabilityWidget(),
      ),
    );
  }
}
