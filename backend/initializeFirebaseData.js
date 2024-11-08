// initializeFirebaseData.js
const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

const planets = [
      {
        "name": "Mercury",
        "arabicName": "عطارد",
        "description": "Mercury is the smallest and closest planet to the Sun in the Solar System. It is only slightly larger than the Earth's Moon.",
        "arabicDescription": "عطارد هو أصغر كوكب وأقربه إلى الشمس في النظام الشمسي. إنه أكبر قليلاً من القمر الأرضي.",
        "imageUrl": "https://media.istockphoto.com/id/183817880/photo/mercury.jpg?s=612x612&w=is&k=20&c=zcCbJMVDuN4zktZ_Qgw6rVuP_RlsDOsMe0suHEesoT4="
      },
      {
        "name": "Venus",
        "arabicName": "الزهرة",
        "description": "Venus is the second planet from the Sun and is Earth's closest planetary neighbor. It is a rocky, terrestrial planet with a thick, toxic atmosphere.",
        "arabicDescription": "الزهرة هي الكوكب الثاني من الشمس وهي أقرب جار كوكبي للأرض. إنه كوكب صخري أرضي ذو غلاف جوي سميك وسام.",
        "imageUrl": "https://media.istockphoto.com/id/1083388898/photo/planet-venus-isolated.jpg?s=612x612&w=is&k=20&c=x6yQFZr_foaIKiBouehtyqBzPq4FjWY2x7LbpfB9pe0="
      },
      {
        "name": "Earth",
        "arabicName": "الأرض",
        "description": "Earth is the third planet from the Sun and the only known planet to harbor life. It is the largest of the four terrestrial planets.",
        "arabicDescription": "الأرض هي الكوكب الثالث من الشمس والكوكب الوحيد المعروف الذي يحتضن الحياة. إنه أكبر الكواكب الأرضية الأربعة.",
        "imageUrl": "https://media.istockphoto.com/id/186019678/photo/planet-earth-with-some-clouds-americas-view.jpg?s=612x612&w=is&k=20&c=rDEwfjWQ2SLyOMk38pJpAp_mD2DVRu2xZd5jX4v4h5M="
      },
      {
        "name": "Mars",
        "arabicName": "المريخ",
        "description": "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System. It is often referred to as the 'Red Planet' due to its reddish appearance.",
        "arabicDescription": "المريخ هو الكوكب الرابع من الشمس والكوكب الثاني الأصغر في النظام الشمسي. غالبًا ما يشار إليه باسم 'الكوكب الأحمر' بسبب مظهره الأحمر.",
        "imageUrl": "https://media.istockphoto.com/id/647269852/photo/planet-mars.jpg?s=612x612&w=is&k=20&c=HMeKWRzBdYxv0eCd9eBo_LPwO8roFoATD-t7aE7ZnX8="
      },
      {
        "name": "Jupiter",
        "arabicName": "المشتري",
        "description": "Jupiter is the largest planet in the Solar System and the fifth planet from the Sun. It is a gas giant with a mass one-thousandth that of the Sun.",
        "arabicDescription": "المشتري هو أكبر كوكب في النظام الشمسي والكوكب الخامس من الشمس. إنه كوكب غازي بكتلة تبلغ جزءًا من ألف من كتلة الشمس.",
        "imageUrl": "https://media.istockphoto.com/id/173228030/photo/jupiter-on-star-field.jpg?s=612x612&w=is&k=20&c=TZlUlzfdRln5KVBU4U2rCFpRkykOpRYOB7KXTCXV8Z4="
      },
      {
        "name": "Saturn",
        "arabicName": "زحل",
        "description": "Saturn is the sixth planet from the Sun and the second-largest planet in the Solar System, after Jupiter. It is a gas giant with a distinctive ring system.",
        "arabicDescription": "زحل هو الكوكب السادس من الشمس والثاني في الحجم في النظام الشمسي بعد المشتري. إنه كوكب غازي ذو نظام حلقي مميز.",
        "imageUrl": "https://media.istockphoto.com/id/1194512934/photo/planet-saturn-isolated.jpg?s=612x612&w=is&k=20&c=OfVcowdpZl-WT7015O_MhhxmlZj_FqGFXGlVQyRDy74="
      },
      {
        "name": "Uranus",
        "arabicName": "أورانوس",
        "description": "Uranus is the seventh planet from the Sun and the third-largest planet in the Solar System. It is an ice giant and the only planet whose equator is nearly at right angles to its orbit.",
        "arabicDescription": "أورانوس هو الكوكب السابع من الشمس والثالث في الحجم في النظام الشمسي. إنه كوكب جليدي والكوكب الوحيد الذي يكاد يكون خط استوائه عمودياً على مدار حركته.",
        "imageUrl": "https://media.istockphoto.com/id/1199283538/photo/planet-uranus.jpg?s=612x612&w=is&k=20&c=S8SqZMc_pdZWPq3nufQ3WgPgmHRuATA59_5Ipo3A2dE="
      },
      {
        "name": "Neptune",
        "arabicName": "نبتون",
        "description": "Neptune is the eighth and farthest known planet from the Sun in the Solar System. It is an ice giant and the fourth-largest planet by diameter.",
        "arabicDescription": "نبتون هو الكوكب الثامن والأبعد معروفًا عن الشمس في النظام الشمسي. إنه كوكب جليدي والرابع في الحجم حسب القطر.",
        "imageUrl": "https://media.istockphoto.com/id/527343985/photo/neptune.jpg?s=612x612&w=is&k=20&c=0jMu3OXCEYhW0AKZnX_YvUOGmeZJ3BeE41inddXWKgQ="
      }
    ]
async function initializeData() {
  try {
    const batch = db.batch();
    
    planets.forEach((planet) => {
      const docRef = db.collection('planets').doc();
      batch.set(docRef, planet);
    });

    await batch.commit();
    console.log('Database initialized successfully');
  } catch (error) {
    console.error('Error initializing database:', error);
  }
}

initializeData().then(() => process.exit());