/*
Fetching data - Queries
Try out GraphQL queries

Bu eğitim için sizin için bir GraphQL API kurduk. Bir GraphQL 
API'sine göz atmanın en yaygın yolu GraphiQL kullanmaktır. GraphiQL, 
Facebook tarafından oluşturulmuş ("grafik" olarak telaffuz edilir) 
herhangi bir GraphQL API'sini keşfetmeyi kolaylaştıran bir araçtır.

GraphiQL'i bir GraphQL uç noktasına bağladığınızda, sunucuyu GraphQL 
şeması için sorgular ve size sorguları taramak ve test etmek için bir 
kullanıcı arayüzü sunar ve bu, şaşırtıcı otomatik tamamlamasını güçlendirir!

https://hasura.io/learn/graphql/graphiql?tutorial=react-native

Bir projede GraphQL API ile çalıştığınızda, GraphQL sorgularınızı 
keşfetmek ve test etmek için neredeyse her zaman GraphiQL gibi bir 
araç kullanırsınız.

Temel GraphQL sorgusu

1)GraphiQL'i şu adreste açın: 
https://hasura.io/learn/graphql/graphiql?tutorial=react-native
API'yi sorgulamak üzere bir yetkilendirme belirteci almak için giriş 
yapmanız gerekecek. Gerçek dünya senaryosunda GraphQL API'leriniz korunacaktır.

2)GraphQL sorgunuzla birlikte gönderilecek olan auth belirtecini içeren bir 
URL ve başlıklar göreceksiniz.

3)Şimdi, bu GraphQL sorgusunu GraphiQL penceresine yapıştırın
query {
   users {
     name
   }
}

4) GraphQL sorgusunu çalıştırmak için ctrl + enterveya cmd + enter(mac) 
tuşuna basın veya ▶️ simgesine tıklayın

5) Sağ tarafta, sistemde bulunan adlarına göre bir kullanıcı listesi 
görmelisiniz!

Fetch users and their todos
This GraphQL query will fetch all the users and their publicly visible todos:

 query {
   users {
     name
     todos {
       title
     }
   }
 }

Fetch online users and their profile information
This GraphQL query will fetch all the currently online users and their 
profile information 
(which is just their name for now):

 query {
   online_users {
     last_seen
     user {
       name
     }
   }
 }

 GraphQL sorgularına parametreler (argümanlar) ekleme

    Çoğu API çağrısında genellikle parametreleri kullanırsınız. 
    Örneğin, hangi verileri getirdiğinizi belirtmek için. 
    Arama yapmaya GETaşinaysanız, bir sorgu parametresi kullanırdınız. 
    Örneğin, yalnızca 10 todo almak için şu API çağrılarını yapmış 
    olabilirsiniz: GET /api/todos?limit=10.

Basic argument: Fetch 10 todos
This GraphQL query will fetch 10 todos and not all of them.

query {
  todos(limit: 10) {
    id
    title
  }
}

Burada kontrol edilmesi gereken en önemli kısım limit: 10. 
GraphQL sunucuları, belirli alanların yanında kullanılabilecek 
argümanların bir listesini sağlayacaktır . Bizim durumumuzda, 
filtre, sıralama ve sayfalama argümanları sağlayan GraphQL arka ucunu 
oluşturmak için Hasura kullanıyoruz. Kullandığınız GraphQL sunucusu 
veya API, kullanılabilecek farklı bir argüman seti sağlayabilir.

Birden çok alanda birden çok bağımsız değişken: Her kullanıcı için 1 
kullanıcı ve en son 5 yapılacakları getir

query {
  users (limit: 1) {
    id
    name
    todos(order_by: {created_at: desc}, limit: 5) {
      id
      title
    }
  }
}

GraphQL değişkenleri: Sorgularınıza dinamik olarak argümanlar iletme
    Bu harika, ama hala bir sorunumuz var. Dinamik olarak sağlanan argümanlarla 
    veri getirdiğimiz bir sorgu oluşturmak istiyorsak, tüm sorgu dizesini 
    yeniden oluşturmamız gerekir.

var limit = getMaxTodosFromUserInput();
var query = "query { todos (limit: " + limit.toString() + ") {id title} }";

$limit todo sayısını getir
GraphQL sorgumuz şöyle görünür:

query ($limit: Int!) {
  todos(limit: $limit) {
    id
    title
  }
}

*/