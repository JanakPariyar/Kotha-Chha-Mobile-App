import 'package:flutter/material.dart';
import 'package:flutterapp2/profilepage.dart';
import 'package:flutterapp2/mappage.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


 void main() {
   runApp(MaterialApp(
       home:
       HomeScreen()
   ));

 }


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Home Rental App',
          style: TextStyle(
          ),

        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Action to navigate to profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(), // Replace with your profile page widget
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SearchBar(),
          Text(
            'Explore Available Homes',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),

          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                // Replace this with your home card widget
                return GestureDetector(
                  onTap: () {
                    // Action to navigate to house screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HouseScreen(index), // Pass the index or necessary data to the house screen
                      ),
                    );
                  },
                  child: Container(
                    width: 150.0,
                    margin: EdgeInsets.only(right: 16.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Home ${index + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Action to browse more homes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrowseHomesScreen(), // Replace with the screen that displays more homes
                ),
              );
            },
            child: Text('Browse All Homes'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Popular Destinations',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              // Replace this with your destination card widget
              return GestureDetector(
                onTap: () {
                  // Action to navigate to destination screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DestinationScreen(index), // Pass the index or necessary data to the destination screen
                    ),
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Destination ${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            ListTile(
              title: Text('Option 1'),
              onTap: () {
                // Action for Option 1
              },
            ),
            ListTile(
              title: Text('Option 2'),
              onTap: () {
                // Action for Option 2
              },
            ),
            // Add more list tiles for additional options
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to navigate to map page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapPage(), // Replace with your map page widget
            ),
          );
        },
        child: Icon(Icons.map),
      ),
    );
  }
}

class HouseScreen extends StatelessWidget {
  final int houseIndex;

  HouseScreen(this.houseIndex);

  @override
  Widget build(BuildContext context) {
    // Implement the detailed house screen UI and logic here
    return Scaffold(
      appBar: AppBar(
        title: Text('House Details'),
      ),
      body: Center(
        child: Text('House ${houseIndex + 1} Details'),
      ),
    );
  }
}

class DestinationScreen extends StatelessWidget {
  final int destinationIndex;

  DestinationScreen(this.destinationIndex);

  @override
  Widget build(BuildContext context) {
    // Implement the destination screen UI and logic here
    return Scaffold(
      appBar: AppBar(
        title: Text('Destination Details'),
      ),
      body: Center(
        child: Text('Destination ${destinationIndex + 1} Details'),
      ),
    );
  }
}

class BrowseHomesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the screen that displays more homes
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse All Homes'),
      ),
      body: Center(
        child: Text('More Homes'),
      ),
    );
  }
}
// class SearchBar extends StatelessWidget {
//   final List<String> suggestions = [
//     'Apple',
//     'Banana',
//     'Cherry',
//     'Durian',
//     'Elderberry',
//     'Fig',
//     'Grape',
//     'Honeydew',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TypeAheadField(
//               textFieldConfiguration: TextFieldConfiguration(
//                 autofocus: true,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                 ),
//               ),
//               suggestionsCallback: (pattern) async {
//                 // Perform search logic to fetch suggestions based on the input pattern
//                 // You can use APIs, databases, or any other data source
//                 return suggestions
//                     .where((suggestion) =>
//                     suggestion.toLowerCase().contains(pattern.toLowerCase()))
//                     .toList();
//               },
//               itemBuilder: (context, suggestion) {
//                 return ListTile(
//                   title: Text(suggestion),
//                 );
//               },
//               onSuggestionSelected: (suggestion) {
//                 // Perform the search action or navigate to the search results page with the selected suggestion
//                 print('Selected suggestion: $suggestion');
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => SearchPage(),
//                 //   ),
//                 // );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








