import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SolarSystemApp());
}

class SolarSystemApp extends StatefulWidget {
  @override
  _SolarSystemAppState createState() => _SolarSystemAppState();
}

class _SolarSystemAppState extends State<SolarSystemApp> {
  bool _isEnglish = true;
  final String apiUrl = 'http://your-api-url:3000/api';

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_isEnglish ? 'Solar System' : 'النظام الشمسي'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _isEnglish
                    ? 'Welcome to the Solar System App!'
                    : 'مرحبًا بك في تطبيق النظام الشمسي!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _toggleLanguage,
                child: Text(
                  _isEnglish ? 'Switch to Arabic' : 'التبديل إلى الإنجليزية',
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('planets').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return ListView(
                      children: snapshot.data!.docs.map((doc) {
                        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                        return _PlanetCard(
                          name: data['name'],
                          arabicName: data['arabicName'],
                          description: _isEnglish ? data['description'] : data['arabicDescription'],
                          imageUrl: data['imageUrl'],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlanetCard extends StatefulWidget {
  final String name;
  final String arabicName;
  final String description;
  final String imageUrl;

  _PlanetCard({
    required this.name,
    required this.arabicName,
    required this.description,
    required this.imageUrl,
  });

  @override
  __PlanetCardState createState() => __PlanetCardState();
}

class __PlanetCardState extends State<_PlanetCard> {
  bool _showArabicName = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showArabicName = !_showArabicName;
        });
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.imageUrl,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _showArabicName ? widget.arabicName : widget.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(widget.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}