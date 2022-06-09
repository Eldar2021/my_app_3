/*

Writing data - Mutations
These are the concepts you should know before you attack mutations (haha):

GraphiQL'yi kullanma

Sorgu değişkenlerini kullanma

Şimdi, verileri "yazmak" için GraphQL'i nasıl kullanabileceğimizi görmeye 
başlayalım. 'POST'GraphQL mutasyonları, tıpkı tipik , 'PUT', 'PATCH', 
'DELETE'API'ler gibi arka uç durumunuzun "mutasyona uğramasına" veya 
değişmesine neden olabilecek GraphQL sorgu türleridir.

Temel mutasyonlar
    GraphQL API'miz için Hasura kullandığımızdan, uygulamamızda 
    kullanabileceğimiz ekleme, güncelleme veya silme işlemleri 
    için mutasyonlar alıyoruz.

Mutasyonların nasıl göründüğünü görmek için bu mutasyonları bir 
yapılacaklar uygulaması bağlamında deneyelim. Başka bir GraphQL hizmetinden 
aldığınız mutasyonlar, diyelim ki API ekibiniz kendi servislerini 
oluşturmuşsa, bunlar farklı olabilir.

Temel mutasyonlar
    GraphQL API'miz için Hasura kullandığımızdan, uygulamamızda 
    kullanabileceğimiz ekleme, güncelleme veya silme işlemleri için 
    mutasyonlar alıyoruz.

    Mutasyonların nasıl göründüğünü görmek için bu mutasyonları bir 
    yapılacaklar uygulaması bağlamında deneyelim. Başka bir GraphQL hizmetinden 
    aldığınız mutasyonlar, diyelim ki API ekibiniz kendi servislerini 
    oluşturmuşsa, bunlar farklı olabilir.

Bir yapılacaklar oluşturun
    Bir todo oluşturmak için bir API çağrısı yapalım. Tahmin edebileceğiniz 
    gibi, bu, yapılacaklar uygulamamızın kritik bir parçası olacak. 😉 

Protip : Şimdi diyelim ki bir todo oluşturacak mutasyonun adını bilmiyoruz. 
GraphiQL kurtarmaya! GraphiQL'e gidin ve sağda "belgeler" sekmesine tıklayın. 
Buraya "todo" yazın ve GraphQL sorgularının ve todo kullanan türlerin bir 
listesini göreceksiniz. Açıklamalarını okuyun ve kısa sürede 
insert_todosihtiyacınız olanın bu olduğunu göreceksiniz.

Todos oluşturmak için mutasyon başlıklı insert_todos.

mutation {
  insert_todos(objects: [{ title: "Eldar todo" }]) {
    returning {
      id
      title
    }
  }
}

Mutasyondan sonra veri döndürme
    Eklenecek todo verilerinin insert_todosmutasyona bir argüman olarak 
    gönderildiğine dikkat edin. Ancak mutasyonun "alanları", sunucudan 
    istediğiniz yanıtın şeklini belirtir.

Bir yanıt olarak oluşturulduktan sonra yapılacaklar nesnesinin tamamını almak 
istediğimizi varsayalım:

mutation {
  insert_todos(objects: [{ title: "Eldar todo" }]) {
    returning {
      id
      title
      is_completed
      user{
        name
      }
    }
  }
}

Parameterise what you insert
# The parametrised GraphQL mutation
mutation($title: String!) {
  insert_todos(objects: [{ title: $title, is_public: true }]) {
    returning {
      id
    }
  }
}



*/
