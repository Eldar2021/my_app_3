/*

Imperative/Declarative Programlama

1. Imperative ve Declarative Kavramları Arasındaki Fark

    Imperative Türkçede emir, buyruk, zorunluluk anlamına geliyor. 
    Declarative ise bildiren, açıklayan anlamındadır. Yabancılar ise 
    imperative işlemi nasıl yapacağını anlattığın, declarative ise ne 
    yapacağını anlattığın programlama şekli olarak tanımlıyorlar.

    Nasıl ile Ne bu kadar farklı programlama paradigmaları nasıl ortaya 
    çıkarabilir diye düşünebilirsiniz. Ama işleri oldukça değiştiriyor. 
    Örneğin bir çizim programı tasarlayalım.

Imperative Yöntem

    // Diktörgen Çizme
    kalemiSuPozisyonaGötür()
    kalemiBastır()
    kalemiSuPozisyonaSürükle()
    kalemiSuPosizyondaDurdur()
    kalemiSuPozisyonaSürükle()
    kalemiSuPosizyondaDurdur()
    kalemiSuPozisyonaSürükle()
    kalemiSuPozisyonaDurdur()
    kalemiSuPozisyonaSürükle()
    kalemiSuPozisyonaDurdur()
    kalemiKaldır()

    İmperative yöntemde açıklayıcı emirlerle işlemi detaylı bir şekilde 
    gerçekleştiririz. 

Declarative Yöntem
    // Diktörgen Çizme
    diktorgen(ciz)

    Declarative yöntemde sadece yapacağınız şeyi anlatırsınız. Tabi bu 
    soyutlama arka planda diktörgen fonksiyonu mantığını bu fonksiyonda çiz 
    fonksiyon mantığını buda arka planda kalemi işletilme mantığını sizden 
    soyutlar. Ama mathematikteki f(g(x)) fonksiyonlar ile kodu geliştirmenizi 
    sağlar.

Imperative: Procedural Programlama Dilleri (Basic, Pascal, C, C++, Java)
Declarative: Fonksiyonel Programlama Dilleri ve Markup, DSL diller 
(SQL, Regular Expression, HTML)
Hybrid : Javascript, Python

*/
