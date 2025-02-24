import 'package:echotrip_planner/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapSearchScreen extends StatefulWidget {
  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  bool _isLocationListVisible = false;
  final TextEditingController _searchController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
  String _mapUrl = "";
  final String apiKey = "AIzaSyAtCbLz37GkMx_kQDq96BEhWW2dHd59ml0 ";

  void _updateMap() {
    String location = locationController.text.trim();
    if (location.isNotEmpty) {
      setState(() {
        _mapUrl = "https://maps.googleapis.com/maps/api/staticmap?center=$location&zoom=12&size=500x1000&key=$apiKey";
      });
    }
  }
@override
  void initState() {
    super.initState();
    locationController.addListener(() {
      context.read<LocationController>().onLocationSearch(locationController.text);
    });
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      final locationProvider = context.watch<LocationController>();
    return Scaffold(
      appBar: AppBar(title: Text("Search Location")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
           TextFormField(
                onTapOutside:(event) {
                    FocusScope.of(context).unfocus();
                },
          controller: locationController,
          decoration: InputDecoration(
             labelStyle: TextStyle(color: Colors.green[700]),
      filled: true,
      fillColor: Colors.green[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
            suffixIcon: InkWell(
              onTap: () {
                context.read<LocationController>().onLocationSearch(locationController.text);
                _updateMap();
                setState(() {
                  
                });
              },
              child: Icon(Icons.search),
            ),
            labelText: "Please select location",
            prefixIcon: Icon(Icons.location_on),
          ),
          validator: (value) => value!.isEmpty ? "Please enter a location" : null,
        ),
        if (locationProvider.locationslist.isNotEmpty)
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: locationProvider.isloading
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        String selectedLocation = locationProvider.locationslist[index].formattedAddress.toString();
                        locationController.text = selectedLocation;
                        locationProvider.clearLocationsList(); 
                        setState(() {}); 
                      },
                      child: ListTile(
                        title: Text(locationProvider.locationslist[index].formattedAddress.toString()),
                      ),
                    ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: locationProvider.locationslist.length,
                  ),
          ),
            SizedBox(height: 20),
            _mapUrl.isNotEmpty
                ? Expanded(
                    child: Image.network(
                      _mapUrl,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}



