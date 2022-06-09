/*
Subscription

Bağlantımızı websocket bağlantısıyla birleştirerek ilk adımlarımızda 
websocket'imizi zaten kurduğumuz için, şimdi bunu abonelik widget'ımızda 
kullanabiliriz.

Subscription Widget

Kullanıcı arayüzümüze canlı veri getirmenin en kolay yolu GraphQL paketinden 
Abonelik pencere aracını kullanmaktır. Bu bize, UI'mizi oluşturabileceğimiz 
veri akışını verir! Unutulmaması gereken bir şey, abonelikler sadece 
dinleyicilerdir, ilk bağlandıklarında herhangi bir veri istemezler, sadece 
yeni veri almak için bir bağlantı açarlar.

Create Subscription and Render Result

static String fetchUsers = """
   subscription fetchOnlineUsers {
   online_users {
     user {
       name
     }
   }
 }
 """;

subscription {
  online_users{
    user{
      name
    }
  }
}
*/