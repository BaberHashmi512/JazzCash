import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locator extends StatefulWidget {
  const Locator({Key? key}) : super(key: key);

  @override
  State<Locator> createState() => _LocatorState();
}

class _LocatorState extends State<Locator> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(30.157457, 71.524918),
                zoom: 14.4746,
              ),
              myLocationButtonEnabled: true,
              compassEnabled: true,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SearchBar(
                  onSubmitted: (String value) {
                    // Perform search or update map position based on the selected value.
                    // In this example, we'll just print the selected value.
                    print('Selected location: $value');
                  },
                  onCurrentLocationPressed: () {

                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final ValueChanged<String> onSubmitted;
  final VoidCallback onCurrentLocationPressed;

  const SearchBar({
    required this.onSubmitted,
    required this.onCurrentLocationPressed,
    Key? key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search here...',
                  border: InputBorder.none,
                ),
                onSubmitted: widget.onSubmitted,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.my_location),
              onPressed: widget.onCurrentLocationPressed,
            ),
          ],
        ),
      ),
    );
  }
}
