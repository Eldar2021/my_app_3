/*
Query Widget
Bu bölümde GraphQL Sorgularını uygulayacağız ve UI ile entegre edeceğiz.

Sorgular için, graphql_flutter paketi adlı bir pencere öğesi sağlar Query. 
QueryWidget iki parametre, seçenekler ve oluşturucu sağlar . yine bize sorgu 
iletmek, sorgu değişkenlerini iletmek ve sorguya yoklama eklemek gibi birkaç 
parametre sağlayan optionstürde bir widget argümanı alır . parametresi, sorgu 
sonucundan alınan verilere göre pencere öğeleri oluşturmak için kullanılır.
QueryOptions document variables pollInterval builder

Harika! Şimdi kullanılacak GraphQL sorgusunu tanımlayalım:

lib/data/Adlı dosyayı açın ve ekleyin todo_fetch.dartve aşağıdaki kodu ekleyin:

class TodoFetch {
  static String fetchAll = """query getMyTodos {
  todos(where: { is_public: { _eq: false} },
   order_by: { created_at: desc }) {
      __typename
      id
      title
      is_completed
    }
  }""";
}

Bu sorgu ne işe yarıyor?

Sorgu değişkenleriyle tanışın

Gördüğünüz gibi, is_publicbunun yanlış olması gerektiğini açıkça belirttik. 
Ancak bu sorguyu özel ve genel yapılacaklar için yeniden kullanmak için, bu 
sorguyu kullanarak parametreleştirmeliyiz query variables. adlı bir boole 
sorgu değişkeni tanımlayalım is_public. GraphQL sorgusu is_public, doğruysa 
genel yapılacakları is_public, yanlışsa kişisel yapılacakları getirir; bu, 
kodda aşağıdaki gibi gösterilir:

*/