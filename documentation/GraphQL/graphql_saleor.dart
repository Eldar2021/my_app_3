/*

https://saleor.io/blog/graphql-in-flutter-building-a-mobile-shop-using-saleor-api-143/

Bu öğretici, GraphQL kullanarak veri alışverişi yapan Saleor 
  API'sinin üstünde Flutter'da basit bir mobil uygulamanın nasıl 
  oluşturulacağını gösterecektir. Bazı temel stiller ile birlikte. 
  Amacımız size Flutter'da bir e-ticaret uygulamasının mobil temelini 
  nasıl oluşturacağınızı göstermektir.

giriş

GraphQL , API'ler için bir sorgu dili ve sunucu tarafı çalışma zamanıdır. 
API'nizdeki verilerin eksiksiz ve uygun bir açıklamasını sağlayabilir. 
Sorgu dili, müşterilerin ihtiyaç duydukları verilerin tam şekli için veri 
isteklerini oluşturmalarına olanak tanır. GraphQL, API'leri geliştirmeleri ve 
bakımlarını daha kolay hale getirmek için esnek ve kullanımı kolay hale 
getirmek için tasarlanmıştır. GraphQL, uygulamaların artan karmaşıklığına ayak 
uydurmanıza yardımcı olur.

GraphQL, REST'e kıyasla birçok avantaja sahiptir. Sabit bir veri yapısı 
yaklaşımı kullanmak yerine GraphQL, müşterinin ihtiyaç duyduğu belirli 
verileri talep eder. REST yanıtları, çok fazla veri içermesi veya yetersiz 
olmasıyla ünlüdür. GraphQL, tek bir istekte kesin verileri getirerek bunu çözer. 
GraphQL ayrıca geliştiricilerin verileri doğru şekilde istediklerinden emin 
olmak için türleri ve şemayı kontrol etmelerini sağlayan bir iç gözlem 
özelliğine sahiptir.

Saleor , İnternette üretim düzeyinde bir alışveriş deneyimi yaratmak için 
hepsi bir arada bir platformdur. Saleor, kapsamlı bir e-ticaret kavramları 
kümesini bir GraphQL uç noktası olarak sunar. Dijital mağazalar oluşturmak 
eskiden karmaşıktı. Günümüzde, kullanımı kolay bir şekilde ortaya çıkaran 
konsolide e-ticaret bilgisi sağlayan Saleor gibi uzman çözümlere 
güvenebilirsiniz. Saleor, web veya mobil uygulamalar gibi istediğiniz sayıda 
vitrini tek bir arka uçtan yönetmenize olanak tanır.

query products {
  products(first: 10) {
    edges {
      node {
        id
        name
        description
        thumbnail {
          url
        }
      }
    }
  }
}

Ardından, bir entegrasyon yazacağız ve GraphQL istemcisini oluşturacağız. 
Ayrıca müşterimizi bir değer bildiricisinin içine saracağız.

void main() {
  final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  runApp(MyApp());
}

Ardından , sınıf clientkullanılarak uygulama widget ağacına sağlanmalıdır . 
GraphQLProviderYine, üretim için kod yazmak isteyeceğiniz yol bu değil. 
Ancak bu eğitim için yeterli olacaktır.

void main() {
  final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  var app = GraphQLProvider(client: client, child: MyApp());
  runApp(app);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Query(
        options: QueryOptions(
          document: gpl(productsGraphQL),
        ),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final productList = result.data?['products']['edges'];
          print(productList);

          return Text("Something");
        },
      ),
    );
  }
}

return Column(
  children: [
    Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "Products",
        style: Theme.of(context).textTheme.headline5,
      ),
    ),
    Expanded(
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: SilverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 0.75,
        ), // SilverGridDelegateWithFixedCrossAxisCount
        itemBuilder: (_, index) {
          var product = productList[index]['node'];
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(2.0),
                width: 180,
                height: 180,
                child: Image.network(product['thumbnail']['url']),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  product['name'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text("\$4.50")
            ],
          );
        }
      )
    )
  ],
);

*/
