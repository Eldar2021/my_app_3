/*

Bir GraphQL istemcisi kurun

graphql_flutter eklentisi, GraphQL sunucunuza düzgün bir soyutlama 
katmanı ve bir arayüz sağlar. httpSorgularınızı, yapmış olabileceğiniz 
veya söylemiş olabileceğiniz istek gövdesi, başlıklar ve seçeneklerle 
oluşturma konusunda endişelenmenize gerek yok dio. Sorguları ve 
mutasyonları doğrudan GraphQL'de yazabilirsiniz ve bunlar istemci 
örneğiniz aracılığıyla otomatik olarak sunucunuza gönderilir.

Graphql_flutter'ı kurmak graphql_flutter: ^3.0.1için,pubspec.yaml

Önce uygulamamızı yapılandırmamız gereken GraphQl istemcisini oluşturalım. 
Uygulamamız hem sorgular, mutasyonlar için http bağlantısı hem de 
abonelikler için websocket bağlantısı gerektirir.

Bunu yapmak için client.dartiçinde lib/configklasör 
adında bir dosya oluşturun ve içine aşağıdaki kodu ekleyin

*/