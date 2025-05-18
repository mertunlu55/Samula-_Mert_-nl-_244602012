import 'package:flutter/material.dart';
void main() => runApp(const MaterialApp(
  // Başlık
  title: 'Samulaş',
  // Debug yazısını kaldırmak
  debugShowCheckedModeBanner: false,
  home: AnaSayfa(),
));

// Ana sayfa widget'ı Değişmez
class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    // Arka plan rengi
    backgroundColor: const Color.fromARGB(255, 0, 5, 13),
    // Üst kısım
    appBar: AppBar(
      //Üst kısım rengi 
      backgroundColor: Colors.black,
      // Soldaki menü ikonu
      leading: _iconBtn(Icons.menu),
      // Ortadaki logo ve yazı
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Ortalamak
        children: const [
          // Kırmızı Otobüs İkonu
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.directions_bus, color: Colors.red)),
          // İkon ile yazı arasındaki boşluk
          SizedBox(width: 8),
          // UYgulamının Başlığı 
          Text('SAMULAŞ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
      //Profil butonu
      actions: [_iconBtn(Icons.person_outline)],
    ),
    // Sayfa içeriğinin kaydırması
    body: SingleChildScrollView(
      // İçerik etrafındaki boşluklar 
      padding: const EdgeInsets.all(16),
      // İçerikler dikey şekilde sıralama
      child: Column(children: [
        // Arama çubuğu
        _searchBar(),
        // Arama çubuğundan sonraki boşluk
        const SizedBox(height: 20),
        // Sanal Kart VE QR İLE Odeme Kartları
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Ortala
          children: [
            // Sanal kart oluşturma butonu
            _card('Sanal Kart Oluştur', Icons.credit_card),
            // Kartlar arasındakı boşluk
            const SizedBox(width: 16),
            // QR ile ödeme butonu
            _card('QR İle Ödeme', Icons.qr_code),
          ],
        ),
        // Alt Satır İle Kartlar Arası Boşluk
        const SizedBox(height: 32),
        // Yuvarlak İKon Ve Buton Grubu 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Aralarındaki Eşit Boşluklar 
          children: const [
            // Kartlarım İkonu Ve Yazısı
            _IconLabel(Icons.credit_card, 'Kartlarım'),
            // Satış Noktaları İkonu Ve Yazısı
            _IconLabel(Icons.store, 'Satış Noktaları'),
            // Bakiye İkonu Ve Yazısı
            _IconLabel(Icons.account_balance_wallet, 'Bakiye'),
            // Deniz Araçları İkonu Ve Yazısı
            _IconLabel(Icons.directions_boat, 'Deniz Araçları'),
            // Sampark İkonu Ve Yazısı
            _IconLabel(Icons.local_parking, 'Sampark'),
          ],
        ),
        // Aralık
        const SizedBox(height: 40),
        // Grid ile oluşturdugum alt fonksiyonlar
        GridView.count(
          // 2 sütun grid 
          crossAxisCount: 2,
          // Grid kaymayacak
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // Satırlar arasındaki boşluklar
          mainAxisSpacing: 12,
          // Sütunlar arasındaki boşluklar
          crossAxisSpacing: 12,
          // Kutuların boyları
          childAspectRatio: 2,
          //Alt Satırdaki kutular
          children: const [
            // Hareket Saatleri kutusu
            _GridBox(Icons.access_time, 'Hareket Saatleri'),
            // Ulaşım Araçları kutusu
            _GridBox(Icons.directions_bus, 'Ulaşım Araçları'),
            // Duraklar kutusu
            _GridBox(Icons.location_on, 'Duraklar'),
            // Favoriler kutusu
            _GridBox(Icons.star_border, 'Favoriler'),
          ],
        )
      ]),
    ),
  );

  // Kutular için İkon butonu oluşturma
  static Widget _iconBtn(IconData icon) => IconButton(
    // Butonlarda gösterilen ikon rengi
    icon: Icon(icon, color: Colors.white),
    // Butona basılınca işlem yapması için (işlem yapmayacak bir şey eklemeyince)
    onPressed: () {},
  );

  // Arama çubuğunu oluşturmak İçin Kullanılan fonksiyonlarım
  static Widget _searchBar() => TextField(
    // Görsel Düzenlemek İçn Kullanılan Özellikler
    decoration: InputDecoration(
      // Arama Kutusunun İcindeki Gözüken Yazı
      hintText: 'Hat / Durak arama',
      // Arama Kutusunun İcindeki Gözüken Yazı Rengi
      hintStyle: const TextStyle(color: Color.fromARGB(179, 255, 255, 255)),
      // Arama Kutusunun Arka planı Gözükmesi
      filled: true,
      // Arka plan rengi
      fillColor: const Color(0xFF2C313A),
      // Kenarlıklar
      border: OutlineInputBorder(
        // Köşeleri oval olması için
        borderRadius: BorderRadius.circular(12),
        // Kenarlık çizgileri Olmayacak
        borderSide: BorderSide.none),
      // arama kutusu ikonu
      prefixIcon: const Icon(Icons.search, color: Colors.white70),
    ),
    // Yazılan yazının rengi
    style: const TextStyle(color: Colors.white),
  );

  // Üstteki Kart ve butonları  oluşturan fonksiyon
  static Widget _card(String text, IconData icon) => Container(
    //  Üstteki Kart ve butonlar Genişlik ve yükseklik
    width: 180,
    height: 60,
    //İçindeki Boşluk 
    padding: const EdgeInsets.symmetric(horizontal: 12),
    // Görsel Yapısını Ayarlamak için
    decoration: BoxDecoration(
      // Üstteki kartların Arka plan rengi
      color: const Color(0xFF2C313A),
      // Köşeleri oval Yapma
      borderRadius: BorderRadius.circular(12),
    ),
    // Yatay Şekilde Hizalama
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // İkon rengi
        Icon(icon, color: Colors.red),
        // İkon ile yazınını arasındaki boşluk
        const SizedBox(width: 8),
        //Üstteki yazı için olan düzenleme
        Flexible(
          child: Text(text,
            // Yazı tipi
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
        ),
      ],
    ),
  );
}
//İkon ve metinleri gösteren yuvarlak butonlar için
class _IconLabel extends StatelessWidget {
  // İkon ve etiket bilgisi
  final IconData icon;
  final String label;
  const _IconLabel(this.icon, this.label);
  
  @override
  Widget build(BuildContext context) => Column(
    children: [
      // Üst taraftaki boşluk
      const SizedBox(height: 8),
      // Yuvarlak ikonlar özelleikleri
      CircleAvatar(backgroundColor: Colors.white10, child: Icon(icon, color: Colors.red)),
      // Yuvarlak İkonlar ile yazı arasındaki  boşluk
      const SizedBox(height: 4),
      // Yuvarlak İkonların Texti
      Text(label, style: const TextStyle(color: Colors.white, fontSize: 12))
    ],
  );
}
 
//Alttaki Büyük Kutular için ikonlar ve yazılar için 
class _GridBox extends StatelessWidget {
  // İkon ve yazı bilgileri
  final IconData icon;
  final String label;
  const _GridBox(this.icon, this.label);

  @override
  Widget build(BuildContext context) => Container(
    // Kutuların görsel düzeni
    decoration: BoxDecoration(
      color: const Color(0xFF2C313A), // Arka plan rengi
      borderRadius: BorderRadius.circular(12), // Köşeler oval yapıldı
    ),
    // Ortada duran içerik kutuları
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Ortalamak
        children: [
          // Alttaki Büyük Kutu ikonları
          Icon(icon, color: Colors.red),
          //  Allttaki Büyük ikonlar ile yazılar arası boşluk
          const SizedBox(width: 5),
          // Text yazı özellikleri
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}
