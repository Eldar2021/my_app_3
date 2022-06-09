/*
Watching data - Subscriptions

GraphQL özelliği, GraphQL sorguları gibi abonelik adı verilen bir 
şeye izin verir, ancak verileri tek bir okumada döndürmek yerine, 
sunucudan gönderilen verileri alırsınız.

Bu, uygulamanızın arka uçtan "etkinliklere" veya "canlı sonuçlara" 
abone olması için yararlıdır, ancak etkinliğin "şeklini" 
uygulamanızdan kontrol etmenize olanak tanır.

GraphQL abonelikleri, uygulamalarınıza kolayca gerçek zamanlı 
özellikler eklemek için kritik bir pencere öğesidir. Abonelikleri 
destekleyen GraphQL istemcileri ve sunucuları harikadır çünkü 
websocket koduyla uğraşmak zorunda kalmadan harika deneyimler 
oluşturmanıza olanak tanır!

İlk GraphQL aboneliğinizi yapın

subscription {
  online_users {
    id
    last_seen
    user {
      name
    }
  }
}

GraphQL abonelikleri nasıl çalışır?
    GraphQL sorguları ve mutasyonları, bir POST uç noktasına gönderilen 
    dizelerdir. GraphQL aboneliği nedir? Bu, bir POST uç noktası üzerinden 
    gerçekleşemez, çünkü basit bir HTTP uç noktası yalnızca yanıtı döndürür 
    ve bağlantı kapanır.

    GraphQL aboneliği, bir websocket uç noktasına gönderilen bir abonelik 
    sorgu dizesidir. Ve arka uçtaki veriler her değiştiğinde, yeni veriler 
    web yuvaları üzerinden sunucudan istemciye gönderilir.


*/