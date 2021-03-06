/*
GraphQL nedir?
    En basit ifadeyle GraphQL, API'ler için bir sorgu dilidir. Bu ne anlama 
    geliyor? API'nizden belirli öğeleri sorgulamanıza izin verir 
    (tıpkı veritabanınızda yaptığınız gibi). Bunun anlamı, API'nizden veri 
    istediğinizde büyük (veya küçük) bir nesne almak yerine, API'den tam 
    olarak ne istediğinizi seçebilirsiniz ve graphQL onu size geri döndürür. 
    Daha fazla ayrıntıyı kendi web sitesinde bulabilirsiniz.
    https://graphql.org/

BLOC nedir?
    BLoC, iş mantığınızı bileşenlerinizden ayırmanızı vurgulayan bir mimari
    modeldir. BLo => İş Mantığı, C => Bileşenler. BLoC modelini uygulamanın
    birkaç yolu vardır, ancak yakın zamana kadar BLoC modelini tasarlandığı 
    gibi kullanıyordum.

    felix melekov. https://medium.com/@felangelov

    ve bu demoda kullanacağım şey bu. Daha fazla

    ayrıntıyı buradan https://bloclibrary.dev/#/

    öğrenebilirsiniz . Bu kılavuzu önceden bilgi sahibi olmadan
    takip edebilirsiniz, ancak ön bilgi size en iyi şekilde yardımcı olacaktır. 
    Lafı fazla uzatmadan başlayalım.

Usage of GraphQL:-
    GraphQL is very useful for any flutter project who have complex APIs. 
    It is an easy way to fetch the exact data from any Server(API).


GraphQL işleminin üç ana türü vardır:
    Query,
    Mutation,
    Subscription.

    ticket Şemamızda bir modelimiz olduğunu ve bu modelin üç alan içerdiğini v
    arsayalım 
        :id, status, created_at

    Birden çok giriş getirme
        query {
            tickets {
                id
                status
                created_at
            }
        }

    Bireysel bir giriş getirme
        query {
            tickets(where: {id: $id_value}) {
                id
                status
                created_at
            }
        }

    Mutasyon (bir değişiklik ve ardından getirme)

    1. Tek bir giriş ekleyin
    mutation {
        createTicket(data: {
            id: $id_value
            status: $status_value
            created_at: $created_at_value
        }) {
            id
            status
            created_at
        }
    }

    2. Bir girişi güncelleyin
    mutation {
        updateTicket(
            where: {id: $id_value}
            data: {status: $status_value}
        ) {
            id
            status
            created_at
        }
    }

    3. Bir girişi silin
    mutation {
        deleteTicket(where: {id: $id_value}) {
            id
            status
        }
    }

    Abonelik (sorgu için gerçek zamanlı veri)

    subscription {
        tickets {
            id
            status
            created_at
        }
    }  

Bir temel GraphQLAPIClient oluşturun.
    
GraphQLAPIClient'ten genişleyen sınıf içinde yürütmek istediğimiz 
    mutasyon/sorgu/abonelik belgelerini içeren bir zaman uyumsuz işlev 
    oluşturun . Ardından, özel durumları işleyin ve yanıttaki verileri 
    ayrıştırın. 

Sağlayıcı sınıfımız içinde ChangeNotifier'dan uzanan başka bir zaman uyumsuz 
işlev oluşturun , 
    2. adımda işlevi çağırın ve veri işlemeye başlayın.

Dinleyicilere sunucudan gelen verilerin değişmiş olabileceğini bildirin.

> api_client.dart

    GraphQLClient(
        cache: GraphQLCache(
            store: HiveStore(),
        ),
        link: _link,
        defaultPolicies: DefaultPolicies(
            watchQuery: policies,
            query: policies,
            mutate: policies,
        ),
    );

cache: The initial cache to use in the data store.

link: The link over which GraphQL documents will be resolved into a
    Response. In this case, we are using the HttpLink which we will concatenate
    with AuthLink so as to attach our GraphCMS public token.

defaultPolicies: The default policies to set for each client action.

Future<QueryResult> query(String queries) async {
  final WatchQueryOptions _options = WatchQueryOptions(
    document: gql(queries),
    pollInterval: Duration(seconds: 15),
    fetchResults: true,
  );
  return await _client().query(_options);
}

Create a request
    Inside the class that extends from GraphQLAPIClient, we create a request
    function to send mutate/query/subscription to the server.

    Future<T> get() async {
        String your_query= """
            query {
                /// write your query
            }
        """;
        final result = await this.query(your_query);
        if (result.hasException) {
            handleException(result);
            return [];
        }
    /// parse data & return the T
    }
    >for example: signup_request.dart

https://github1s.com/felangel/bloc/blob/master/examples/flutter_graphql_jobs/lib/main.dart    

https://itnext.io/flutter-x-graphql-a2dea05e6564    

https://medium.flutterdevs.com/implement-graphql-with-flutter-153f30881915

https://blog.codemagic.io/flutter-graphql/

https://hasura.io/learn/graphql/flutter-graphql/introduction/

*/  