import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String occupation = '';
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 64.0,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Replace with your profile picture
            ),
            SizedBox(height: 16.0),
            Text(
              'Name: $name',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Occupation: $occupation',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _showCreateProfileDialog(context);
              },
              child: Text('Create New Profile'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Post Content:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    post: posts[index],
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                _showPostContentDialog(context);
              },
              child: Text('Post Content'),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create New Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Occupation',
                  ),
                  onChanged: (value) {
                    setState(() {
                      occupation = value;
                    });
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save the profile data
                // You can implement the logic to save the profile data to a database or perform any desired action
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showPostContentDialog(BuildContext context) {
    String location = '';
    int rooms = 0;
    String description = '';
    double offeredRent = 0.0;
    List<String> photos = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Post Content'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Location',
                  ),
                  onChanged: (value) {
                    location = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Number of Rooms',
                  ),
                  onChanged: (value) {
                    rooms = int.tryParse(value) ?? 0;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Offered Rent',
                  ),
                  onChanged: (value) {
                    offeredRent = double.tryParse(value) ?? 0.0;
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Upload Photos (at least 3):',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {
                    // Implement logic to handle photo uploads
                    // You can use plugins like image_picker or implement your own logic
                  },
                  child: Text('Upload Photos'),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Uploaded Photos: ${photos.length}',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  posts.add(
                    Post(
                      location: location,
                      rooms: rooms,
                      description: description,
                      offeredRent: offeredRent,
                      photos: photos,
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: Text('Post'),
            ),
          ],
        );
      },
    );
  }
}

class Post {
  String location;
  int rooms;
  String description;
  double offeredRent;
  List<String> photos;

  Post({
    required this.location,
    required this.rooms,
    required this.description,
    required this.offeredRent,
    required this.photos,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/user_icon.jpg'), // Replace with the user's icon
                ),
                SizedBox(width: 8.0),
                Text(
                  'Username', // Replace with the user's name
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              post.location,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              post.rooms.toString(),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              post.description,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Offered Rent: \$${post.offeredRent.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Photos: ${post.photos.length}',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
