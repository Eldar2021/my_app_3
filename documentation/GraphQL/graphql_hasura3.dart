/*

Mimari

GraphQL'yi anlamada daha fazla ilerlemeden önce, 
GraphQL'nin bir HTTP istemcisinde (tipik olarak bir web/mobil uygulamada) 
gerçekte nasıl kullanıldığına dair bir fikir edinmek yararlıdır.

HTTP üzerinden GraphQL
    GraphQL'nin yığınınızda tipik olarak nasıl kullanıldığını 
    anlamak için aşağıdaki şemaya bakın:

GraphQL client-server flow:

1:  GraphQL sorgusunun gerçekten JSON olmadığını unutmayın; 
    istediğiniz JSON şekline benziyor . Bu nedenle, 
    GraphQL sorgumuzu sunucuya göndermek için bir 'POST' isteği yaptığımızda, 
    istemci tarafından bir "string" olarak gönderilir.

2:  Sunucu, JSON nesnesini alır ve sorgu dizesini çıkarır. 
    GraphQL sözdizimine ve grafik veri modeline (GraphQL şeması) göre, 
    sunucu GraphQL sorgusunu işler ve doğrular.

3:  Tipik bir API sunucusu gibi, GraphQL API sunucusu daha sonra istemcinin 
    istediği verileri almak için bir veritabanına veya diğer hizmetlere çağrı 
    yapar.

4:  Sunucu daha sonra verileri alır ve bir JSON nesnesinde istemciye döndürür.

Örnek GraphQL istemci kurulumu:

Günlük işlerinizde, aslında altta yatan HTTP istekleri ve yanıtları hakkında 
endişelenmenize gerek yok.

Tıpkı bir REST API ile çalıştığınızda ve API çağrıları yapmak ve yanıtları 
işlemek için standartı azaltmak için bir HTTP istemcisi kullandığınızda olduğu 
gibi, GraphQL sorgularını yazmayı, göndermeyi ve yanıtları işlemeyi çok daha 
kolay hale getirmek için bir GraphQL istemcisi seçebilirsiniz.

Aslında, GraphQL sorgusunu nasıl gönderdiğiniz ve GraphQL yanıtını nasıl kabul 
ettiğinizin mekanizması standart hale geldi. Bu, istemci üzerinde 
GraphQL ile çalışmayı çok kolaylaştırır.

Tipik bir GraphQL istemci kurulumu ve sorgu oluşturma şu şekilde görünür:

// Setup a GraphQL client to use the endpoint
const client = new client("https://myapi.com/graphql");
// Now, send your query as a string (Note that ` is used to create a multi-line
// string in javascript).

client.query (`
  query {
    user {
      id
      name
    }
  }`
);


*/