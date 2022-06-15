/*
DDD ile Flutter için başlangıç ​​kılavuzu

Why Domain Driven Design?

The merit of adapting domain driven design is as follows.

  Responsibility becomes clear(especially in model layer)

  Other member can understand architecture easily.

Onion Architecture

In our project, we adapted onion architecture for the following reasons.

  It is simple directory architecture for beginner.
  There are a lot of useful information on website.

  ├── application
  │   ├── dto
  │   ├── *_service.dart
  ├── domain
  │   ├── model
  │   └── service
  ├── infrastructure
  │   ├── firebase
  │   ├── repository
  │   └── sqflite
  ├── main.dart
  └── presentation
      ├── notifier
      └── ui
          └── pages
          └── templates
          └── organisms
          └── atoms

  Presentation
    Sunum katmanı, kullanıcı arayüzü ve bildirim (Sağlayıcı) içerir. 
    Ui katmanı sayfalardan ve şablonlardan, organizmalardan, 
    atomlardan (atomik tasarımı uyarladık) ve bildirim katmanından 
    durum yönetiminden sorumludur.        

  Application
    Uygulama katmanı, dto ve usecase(*_service.dart) içerir. 
    Dto katmanı, altyapı katmanından veri nesnesini aktarmaktan 
    sorumludur. Usecase, sunum katmanından usecase (kullanıcı eylemi) 
    sorumludur.

  Domain
    Etki alanı katmanı, model ve hizmeti içerir. Model katmanı, 
    Değer Nesnesi ve etki alanı nesnesi, depo arayüzünden sorumludur. 
    Hizmet katmanı, Etki Alanı hizmetinden sorumludur. 

  Infrastructure
    Altyapı katmanı, depo, firebase ve sqflite içerir. Depo katmanı, 
    depo arayüzünün uygulanmasından sorumludur. Firebase katmanı ve 
    Sqflight katmanı, bu veritabanlarının ilk ayarından sorumludur.

Conclusion
Gördüğünüz gibi, DDD ile çarpıntıdan çok fazla liyakat elde edebilirsiniz 
ve bu rahat bir gelişime yol açar. Flutter kullandığınızda ve uygulama 
mimarisini düşündüğünüzde, soğan mimarisini uyarlamanızı tavsiye ederim.


*/