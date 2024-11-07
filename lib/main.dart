import 'package:flutter/material.dart';

void main() {
  runApp(SolarSystemApp());
}

class SolarSystemApp extends StatefulWidget {
  @override
  _SolarSystemAppState createState() => _SolarSystemAppState();
}

class _SolarSystemAppState extends State<SolarSystemApp> {
  bool _isEnglish = true;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
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
              Text(
                _isEnglish
                    ? 'This app provides information about the planets in our solar system.'
                    : 'يوفر هذا التطبيق معلومات عن الكواكب في النظام الشمسي الخاص بنا.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _toggleLanguage,
                child: Text(
                  _isEnglish ? 'Switch to Arabic' : 'التبديل إلى الإنجليزية',
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: ListView(
                  children: [
                    _PlanetCard(
                      name: _isEnglish ? 'Mercury' : 'عطارد',
                      arabicName: 'عطارد',
                      description: _isEnglish
                          ? 'Mercury is the smallest and closest planet to the Sun in the Solar System. It is only slightly larger than the Earth\'s Moon.'
                          : 'عطارد هو أصغر كوكب وأقربه إلى الشمس في النظام الشمسي. إنه أكبر قليلاً من القمر الأرضي.',
                      imageUrl: 'https://media.istockphoto.com/id/183817880/photo/mercury.jpg?s=612x612&w=is&k=20&c=zcCbJMVDuN4zktZ_Qgw6rVuP_RlsDOsMe0suHEesoT4=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Venus' : 'الزهرة',
                      arabicName: 'الزهرة',
                      description: _isEnglish
                          ? 'Venus is the second planet from the Sun and is Earth\'s closest planetary neighbor. It is a rocky, terrestrial planet with a thick, toxic atmosphere.'
                          : 'الزهرة هي الكوكب الثاني من الشمس وهي أقرب جار كوكبي للأرض. إنه كوكب صخري أرضي ذو غلاف جوي سميك وسام.',
                      imageUrl: 'https://media.istockphoto.com/id/1083388898/photo/planet-venus-isolated.jpg?s=612x612&w=is&k=20&c=x6yQFZr_foaIKiBouehtyqBzPq4FjWY2x7LbpfB9pe0=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Earth' : 'الأرض',
                      arabicName: 'الأرض',
                      description: _isEnglish
                          ? 'Earth is the third planet from the Sun and the only known planet to harbor life. It is the largest of the four terrestrial planets.'
                          : 'الأرض هي الكوكب الثالث من الشمس والكوكب الوحيد المعروف الذي يحتضن الحياة. إنه أكبر الكواكب الأرضية الأربعة.',
                      imageUrl: 'https://media.istockphoto.com/id/186019678/photo/planet-earth-with-some-clouds-americas-view.jpg?s=612x612&w=is&k=20&c=rDEwfjWQ2SLyOMk38pJpAp_mD2DVRu2xZd5jX4v4h5M=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Mars' : 'المريخ' ,
                      arabicName: 'المريخ',
                      description: _isEnglish
                          ? 'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System. It is often referred to as the "Red Planet" due to its reddish appearance.'
                          : 'المريخ هو الكوكب الرابع من الشمس والكوكب الثاني الأصغر في النظام الشمسي. غالبًا ما يشار إليه باسم "الكوكب الأحمر" بسبب مظهره الأحمر.',
                      imageUrl: 'https://media.istockphoto.com/id/647269852/photo/planet-mars.jpg?s=612x612&w=is&k=20&c=HMeKWRzBdYxv0eCd9eBo_LPwO8roFoATD-t7aE7ZnX8=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Jupiter' : 'المشتري' ,
                      arabicName: 'المشتري',
                      description: _isEnglish
                          ? 'Jupiter is the largest planet in the Solar System and the fifth planet from the Sun. It is a gas giant with a mass one-thousandth that of the Sun.'
                          : 'المشتري هو أكبر كوكب في النظام الشمسي والكوكب الخامس من الشمس. إنه كوكب غازي بكتلة تبلغ جزءًا من ألف من كتلة الشمس.',
                      imageUrl: 'https://media.istockphoto.com/id/173228030/photo/jupiter-on-star-field.jpg?s=612x612&w=is&k=20&c=TZlUlzfdRln5KVBU4U2rCFpRkykOpRYOB7KXTCXV8Z4=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Saturn' : 'زحل' ,
                      arabicName: 'زحل',
                      description: _isEnglish
                          ? 'Saturn is the sixth planet from the Sun and the second-largest planet in the Solar System, after Jupiter. It is a gas giant with a distinctive ring system.'
                          : 'زحل هو الكوكب السادس من الشمس والثاني في الحجم في النظام الشمسي بعد المشتري. إنه كوكب غازي ذو نظام حلقي مميز.',
                      imageUrl: 'https://media.istockphoto.com/id/1194512934/photo/planet-saturn-isolated.jpg?s=612x612&w=is&k=20&c=OfVcowdpZl-WT7015O_MhhxmlZj_FqGFXGlVQyRDy74=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Uranus' : 'أورانوس',
                      arabicName: 'أورانوس' ,
                      description: _isEnglish
                          ? 'Uranus is the seventh planet from the Sun and the third-largest planet in the Solar System. It is an ice giant and the only planet whose equator is nearly at right angles to its orbit.'
                          : 'أورانوس هو الكوكب السابع من الشمس والثالث في الحجم في النظام الشمسي. إنه كوكب جليدي والكوكب الوحيد الذي يكاد يكون خط استوائه عمودياً على مدار حركته.',
                      imageUrl: 'https://media.istockphoto.com/id/1199283538/photo/planet-uranus.jpg?s=612x612&w=is&k=20&c=S8SqZMc_pdZWPq3nufQ3WgPgmHRuATA59_5Ipo3A2dE=',
                    ),
                    _PlanetCard(
                      name: _isEnglish ? 'Neptune' : 'نبتون' ,
                      arabicName: 'نبتون',
                      description: _isEnglish
                          ? 'Neptune is the eighth and farthest known planet from the Sun in the Solar System. It is a ice giant and the fourth-largest planet by diameter.'
                          : 'نبتون هو الكوكب الثامن والأبعد معروفًا عن الشمس في النظام الشمسي. إنه كوكب جليدي والرابع في الحجم حسب القطر.',
                      imageUrl: 'https://media.istockphoto.com/id/527343985/photo/neptune.jpg?s=612x612&w=is&k=20&c=0jMu3OXCEYhW0AKZnX_YvUOGmeZJ3BeE41inddXWKgQ=',
                    ),
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