/*
Mutasyonu çalıştır, önbelleği güncelle

İlk olarak, bir önceki bölümde incelediğimiz mutasyonu tanımlayalım. 
Aşağıdaki mutasyonu tanımlayın 
lib/data/todo_fetch.dart.

static String addTodo =
      '''mutation addTodo(\$title: String!, \$isPublic: Boolean!) {
 action: insert_todos(objects: { title: \$title, is_public: \$isPublic }) {
    returning {
     id
     title
     is_completed
   }
 }
 }''';


 Şimdi entegrasyon kısmını yapalım.
 AddTask widget'ını , Mutation Option'da bir belge olarak graphql mutasyon 
 dizimizi geçen widget lib/screens/tabs/todo/all.dartile birlikte 
 saracağız. Mutation

 mende bar...........................

 Mutasyon parçacığı isteğe bağlı olarak onCompletedve gibi çeşitli geri 
 aramaları alır update.

 Düğmemizin onAddgeri çağrısına runMutation işlevini çağırıyoruz. 
 Ayrıca, olan titleve isPublicbu runMutation işlevine sorgu değişkenlerini 
 geçiriyoruz, böylece mutasyonumuz bu değişkenlerle çağrılır. titletextfeild'in 
 değeri ise yapılacak işin isPublictürüdür ve özel bir yapılacak iş olduğu 
 için onu yanlış olarak işaretliyoruz.

 Mutasyon entegre edildi ve yeni todolar veritabanına eklenecek. 
 Ancak kullanıcı arayüzü, yeni bir yapılacaklar eklendiğini bilmiyor. 
 GraphQL istemcisine yapılacaklar listesini güncellemek için sorguyu yeniden 
 getirmesini söylemenin bir yoluna ihtiyacımız var.

 Geri onCompletedarama işlevi, bu mutasyon için önbelleği güncellemek için 
 kullanışlıdır. Bu nedenle refetchQuery, Tamamlanmış geri aramayı arayacağız.


*/