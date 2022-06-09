/*
Mutasyonları ve otomatik önbellek güncellemelerini güncelleyin
Update mutations and automatic cache updates

Bu bölümde aşağıdaki kavramları öğreneceğiz:
  GraphQL mutasyonu oluşturma
  MutationWidget'ı kullanma
  Otomatik önbellek güncellemeleri

Eğitimin bu bölümünde, GraphQL Mutations kullanarak mevcut bir 
yapılacakları tamamlandı olarak nasıl işaretleyeceğinizi öğreneceksiniz.

Todos'a mutasyon yapmak için bir GraphQL sorgusu tanımlayalım.  

mutation toggleTodo($id:Int!, $isCompleted: Boolean!) {
  action: update_todos(where: {id: {_eq: $id}}, _set: {is_completed: $isCompleted}) {
    returning {
      is_completed
    }
  }
}

Ayrıca değişkenlerin değerlerini de girmeniz gerekecektir.

mutation{
	update_todos (where: {id: {_eq: 64065}}, _set: {title: "oshun balasy"}){
    returning {
      id
      title
      is_completed
    }
  } 
}

Şimdi bu GraphQL mutasyonunu Flutter uygulamamıza entegre edelim.
*/