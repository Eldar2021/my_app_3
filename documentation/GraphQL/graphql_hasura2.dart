/*
GraphQL'ye Giriş

GraphQL nedir?
    GraphQL, bir API ile nasıl konuşulacağına ilişkin bir belirtimdir. 
    POSTAnahtar fikrin, farklı kaynaklar için farklı HTTP uç 
    noktalarına ulaşmak yerine bir HTTP uç noktasına "sorgulamak" olduğu, 
    genellikle HTTP üzerinden kullanılır.

    GraphQL, web/mobil uygulama geliştiricilerinin (HTTP istemcileri) ihtiyaç 
    duydukları verileri arka uç API'lerinden uygun bir şekilde almak için API 
    çağrıları yapabilmeleri için tasarlanmıştır.

    Request1:         |  Response1:

    query {           |  {
      user (id: 1) {  |    "user": {
        id            |       "id": 1
      }               |     }
    }                 |  }

    ----------------------------------------

    Request2:         |   Response2:

    query {           |   {
      user (id: 1) {  |     "user": {
        id            |       "id": 1
        name          |       "name": "Elmo"
      }               |     }
    }                 |   }

GraphQL'de Düşünmek
    API çağrıları hakkındaki düşüncelerimizi değiştiriyoruz. 
    Verileri getirmek için farklı URL'lere farklı API çağrıları yapmak yerine, 
    sorguya dayalı olarak veri döndüren bir 
    "tek URL uç noktasına" geçici sorgular yapıyoruz.

    Bir kaynağı 'GET'lemek yerine, istediğiniz verileri açıklayan bir 
    sorguyu 'POST' edersiniz.

    API'nizin döndürdüğü verileri bir "grafik" olarak düşünürsünüz, bu, 
    "ilgili" veri parçalarını tek seferde getirmek için sorgular yapmanıza 
    olanak tanır. Yukarıdaki örnekte, 2 API çağrısı yapmak yerine, kullanıcıyı 
    ve kullanıcının adresini (iç içe JSON nesnesi olarak) aynı API çağrısında 
    alırsınız.

    POST isteğinde veri olarak gönderdiğiniz "sorgu"nun bir yapısı ve 
    sözdizimi vardır. Bu "dile" GraphQL denir.

Yukarıdaki örnekte görebileceğiniz gibi, GraphQL sorguları çok düzenli ve 
okunması kolay görünüyor! Bunun nedeni, sorgunun, istediğiniz son JSON 
verilerinin "şekli" olmasıdır. Bu, GraphQL'i birlikte çalışmayı bir keyif 
haline getiren temel nedenlerden biridir!

GraphQL avantajları

    Aşırı getirmeden kaçının : Tam olarak ihtiyacınız olan alanları 
    belirtebildiğiniz için, ihtiyacınız olandan daha fazla veri 
    getirmekten kaçınırsınız.

    Birden çok API çağrısını önleyin : Daha fazla veriye ihtiyacınız 
    olması durumunda, API'nize birden çok çağrı yapmaktan da kaçınabilirsiniz. 
    userYukarıdaki durumda, getirme ve ayrı ayrı 2 
    API çağrısı yapmanız gerekmez address.

    API geliştiricileriyle daha az iletişim: 
    Bazen, özellikle daha fazla veri almanız gerekiyorsa 
    ve birden fazla API çağrısından kaçınmak istiyorsanız, 
    tam olarak ihtiyacınız olan verileri almak için 
    API geliştiricilerinizden yeni bir API oluşturmalarını istemeniz gerekir. 
    GraphQL ile işiniz API ekibinden bağımsızdır! 
    Bu, uygulamanızda daha hızlı çalışmanıza olanak tanır.

    Self-documenting: Every GraphQL API conforms to a "schema" 
    which is the graph data model and what kinds of queries a 
    client can make. This allows the community to build lots of 
    cool tools to explore & visualise your API or create IDE plugins 
    that autocomplete your GraphQL queries and even do "codegen". We'll 
    understand this in more detail later!

    Requirement	                    REST	               GraphQL

    Fetching data objects	        GET	                   query
    Writing data	                POST	               mutation
    Updating/deleting data	        PUT/PATCH/DELETE	   mutation
    Watching/subscribing to data	-	                   subscription

    */