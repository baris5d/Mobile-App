# Dirty Paws

Dirty Paws gönüllülerin bir araya gelip acil ihtiyaçları takip edebildikleri / bildirebildikleri, çevrelerinde bulunan mama ve su kaplarının doluluk oranlarını takip edebildikleri bir mobil uygulamadır.


## Akış
Yakın konumlardaki mama, acil durum, ihtiyaç gibi aktif paylaşımlar listelenecek. İnsanlar yaralanma, kaza bildirdiğinde, yakınlardaki kullanıcılara bildirim gidecek ve bu bildirim kapanana kadar insanların ana sayfasında görüntülenebilecek. Eğer birisi gidiyorum diye işaretlediyse kutuda “x kişisi buraya giriyor” olarak görüntülenecek. Bildirimi yapan kişi, acil durum giderildiğinde, bu kullanıcı gerçekten geldiyse bildirimi kapatabilecek. 
 
## Mama Haritası
Aktif olarak mama kabı bulunan noktaları görüntüleyebilirsiniz. İşaretlenen noktalardaki tüketilen mama miktarına göre sunucu tarafoında eklenen mamaların ne kadar sürede tüketilebileceğini tahmin eden bir makine öğrenmesi modeli yardımıyla görüntüleyebilirsiniz. Tahmini bitiş süresine göre noktalara yeşil-turuncu-kırmızı renkler ile belirtiliyor.

## Acil Durum İhbarı
Bir kazaya şahitlik eden kullanıcı uygulama üzerinden yakınlarında bulunan kullanıcılardan yardım isteyebilir. İstek gerçekleştirildiğinde, yakında bulunan kullanıcılara bildiriliyor. Aynı zamanda akış ekranında bu bildirimleri görüntüleyebilir, hala yardıma ihtiyacı olanlara yardım edebilirsiniz.

# Uygulama bilgileri

Harita bilgileri Google Maps API ile sağlanıp, Geolocator ve Geocoding yardımıyla işleniyor. Kullanıcı işlemleri Firebase'de tutulup yapılan kullanıcı işlemleri doğrultusunda backend sunucusuna iletiliyor.

## Kurulum

`git clone https://github.com/Dirty-Paws/Mobile-App.git`

`cd Mobile-App`

`flutter run`