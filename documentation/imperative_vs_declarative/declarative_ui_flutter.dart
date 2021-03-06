/*

Declarative Ui Nedir?

    Bugün sizlerle birlikte tasarım arayüzlerin yapısını anlayabilmek için 
    küçük bir konuya değinmek istiyorum özellikle Herkesin üzerinde kısmen 
    de olsa bir kaç konu belki birkaç başlıkla anlamaya çalışarak, 
    uygulamalarından örnekler yaparak ifade etmeye çalıştılar.Ama bugün konu 
    üzerini tamamen durarak hem kendimiz için hem sizler için kısa da olsa 
    açıklamaya çalışacağım.

    ilk başta ifade etmem gereken şöyle ufak bir konu var, uygulamaların kendi
    içerisindeki ara yüzlerdeki bulunan yazılar, resimler,sayılar her zaman 
    durum ve uygulama içerisindeki dinamiklere göre değişimler gösterilebilir. 
    Bu değişimlerin arka planda hazır bekleyen bloklar halindeki yapılar 
    kullanmaktansa yapının kendi içindeki değişime müsait iç parametreleri 
    yöneterek hızlı görüntü alabilmemiz için teknolojik arayüzleri kullanmamız 
    da fayda var.

Neden Declarative Ui Kullanılıyor?

    Flutter arayüz geliştirme kitlerinde karşınıza çıkan en güzel özellik 
    Declarative Ui prensibimi kullanımıdır. Bununla ilgili de aşağıda vermiş 
    olduğumuz örneği inceleyelim.
    
    // imparative style
    b.setColor(red)
    b.clearChildren()
    ViewC c3 = ViewC(...)
    b.add(c3)

    // declarative style
    retirn View(
        color: red,
        child: ViewC(...),
    );

Dart is the programming language used to code Flutter apps. Therefore, 
We need to learn Dart either before learning Flutter or alongside. However, 
there are lot of questions that come to our mind.

Can I learn Flutter without Dart? Is learning Dart is important for learning 
Flutter? Dart and Flutter, are they Imperative or Declarative?

Flutter uses Declarative style. However, Dart programming language is 
multi-paradigm. That means, it supports imperative and declarative style both.

https://medium.com/flutter-students-club/1-g%C3%BCn-declarative-ui-nedir-93b20b91daec

https://sanjibsinha.com/dart-flutter/

*/
