/*
Büyük Flutter uygulamaları oluştururken karar vermemiz gereken ilk şeylerden 
biri projemizi nasıl yapılandıracağımızdır .

Bu, tüm ekibin net bir kuralı izlemesini ve tutarlı bir şekilde 
özellikler eklemesini sağlar .

Bu nedenle, bu makalede projemizi yapılandırmak için iki 
yaygın yaklaşımı keşfedeceğiz: özellik-önce ve katman-önce .
feature-first and layer-first.

Bunları gerçek dünyadaki uygulamalarda uygulamaya çalışırken bunların 
ödünleşimlerini öğrenecek ve yaygın tuzakları belirleyeceğiz. Ve yol boyunca 
maliyetli hatalardan kaçınarak projenizi nasıl yapılandırabileceğiniz konusunda
adım adım net bir kılavuzla tamamlayacağız.

Pratikte, ancak hangi uygulama mimarisini kullanacağımıza karar verdikten 
sonra bir proje yapısı seçebiliriz.

Bunun nedeni, uygulama mimarisinin bizi net sınırlarla ayrı katmanlar 
tanımlamaya zorlamasıdır . Ve bu katmanlar projemizde bir yerde klasörler 
olarak görünecek.

‣ lib
  ‣ src
    ‣ presentation
      ‣ feature1
      ‣ feature2
    ‣ application
      ‣ feature1
      ‣ feature2
    ‣ domain
      ‣ feature1
      ‣ feature2
    ‣ data
      ‣ feature1
      ‣ feature2


‣ lib
  ‣ src
    ‣ presentation
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--
    ‣ application
      ‣ feature1
      ‣ feature2
      ‣ feature3 <-- only create this when needed
    ‣ domain
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--
    ‣ data
      ‣ feature1
      ‣ feature2
      ‣ feature3 <--

‣ lib
  ‣ src
    ‣ features
      ‣ feature1
        ‣ presentation
        ‣ application
        ‣ domain
        ‣ data
      ‣ feature2
        ‣ presentation
        ‣ application
        ‣ domain
        ‣ data

‣ lib
  ‣ src
    ‣ features
      ‣ account
      ‣ admin
      ‣ checkout
      ‣ leave_review_page
      ‣ orders_list
      ‣ product_page
      ‣ products_list
      ‣ shopping_cart
      ‣ sign_in

‣ lib
  ‣ src
    ‣ features
      ‣ account
      ‣ admin
      ‣ checkout
      ‣ leave_review_page
      ‣ orders_list
      ‣ product_page
      ‣ products_list
      ‣ shopping_cart
      ‣ sign_in
    ‣ models <-- should this go here?
    ‣ repositories <-- should this go here?
    ‣ services <-- should this go here?


‣ lib
  ‣ src
    ‣ common_widgets
    ‣ constants
    ‣ exceptions
    ‣ features
      ‣ address
      ‣ authentication
      ‣ cart
      ‣ checkout
      ‣ orders
      ‣ products
      ‣ reviews
    ‣ localization
    ‣ routing
    ‣ utils                 
*/