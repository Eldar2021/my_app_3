/*
Bir GraphQL istemcisi kurun

graphql_flutter eklentisi, GraphQL sunucunuza düzgün bir soyutlama katmanı ve 
bir arayüz sağlar. httpSorgularınızı, yapmış olabileceğiniz veya söylemiş 
olabileceğiniz istek gövdesi, başlıklar ve seçeneklerle oluşturma konusunda 
endişelenmenize gerek yok dio. Sorguları ve mutasyonları doğrudan GraphQL'de 
yazabilirsiniz ve bunlar istemci örneğiniz aracılığıyla otomatik olarak 
sunucunuza gönderilir.

graphql_flutter: ^3.0.1  pubspec.yaml

Önce uygulamamızı yapılandırmak için ihtiyaç duyacağımız GraphQl istemcisini 
oluşturalım. Uygulamamız hem sorgular, mutasyonlar için http bağlantısı hem 
de abonelikler için websocket bağlantısı gerektirir.

Bunu yapmak için client.dartiçinde lib/configklasör adında bir dosya oluşturun 
ve içine aşağıdaki kodu ekleyin.

minin githubimda bar......................................

Yukarıdaki kodda 'yi oluşturuyoruz httpLinkve authLinkbunları 
websocketLinkdeğişken tipinde Linklink ile birleştiriyoruz. Adlı işlevde, 
paketin kendisi tarafından sağlanan kullanım aracımızı yapılandırıyoruz ve 
bir tür örneği initailizeClientdöndürüyoruz . 
client GraphQLClient ValueNotifier<GraphQLClient>

https://hasura.io/learn/graphql/graphiql?tutorial=react-native

 query getMyTodos {
  todos(where: { is_public: { _eq: false} }, order_by: { created_at: desc }) {
    __typename
    id
    title
    is_completed
  }
 }

*/
