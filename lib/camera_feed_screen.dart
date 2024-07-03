import 'package:flutter/material.dart';
import 'logout_button.dart';

class CameraFeedScreen extends StatefulWidget {
  @override
  _CameraFeedScreenState createState() => _CameraFeedScreenState();
}

class _CameraFeedScreenState extends State<CameraFeedScreen> {
  List<CameraFeed> _cameraFeeds = [
    CameraFeed(title: 'Living Room', isActive: true),
    CameraFeed(title: 'Kitchen', isActive: true),
    CameraFeed(title: 'Garage', isActive: true),
  ];

  void _toggleCameraStatus(int index) {
    setState(() {
      _cameraFeeds[index].isActive = !_cameraFeeds[index].isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Feeds'),
        actions: [
          Padding(padding: EdgeInsets.only(right: 10.0), child: LogoutButton())
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: _cameraFeeds.length,
        itemBuilder: (context, index) {
          return CameraFeedTile(
            cameraFeed: _cameraFeeds[index],
            onToggleStatus: () => _toggleCameraStatus(index),
          );
        },
      ),
    );
  }
}

class CameraFeed {
  final String title;
  bool isActive;

  CameraFeed({required this.title, this.isActive = true});
}

class CameraFeedTile extends StatelessWidget {
  final CameraFeed cameraFeed;
  final VoidCallback onToggleStatus;

  CameraFeedTile({required this.cameraFeed, required this.onToggleStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/sample_camera_feed.jpg'), // Placeholder image, update as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cameraFeed.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status: ${cameraFeed.isActive ? "Active" : "Inactive"}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: cameraFeed.isActive ? Colors.green : Colors.red,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onToggleStatus,
                      child:
                          Text(cameraFeed.isActive ? 'Deactivate' : 'Activate'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            cameraFeed.isActive ? Colors.red : Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
