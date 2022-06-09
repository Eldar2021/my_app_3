/*
Mutations
Şimdi, kullanıcılarımıza yeni yapılacaklar oluşturma ve bunları görev 
listelerine ekleme yeteneğini ekleyelim.

Aşağıdaki kavramları öğreneceğiz:
  GraphQL mutasyonu oluşturma
  Mutation Widget'ı kullanma
  Yükleme/bitmiş/hata durumlarını yakalama

Todos oluştur - mutasyon
Eğitimin bu bölümünde, GraphQL Mutations kullanarak yeni todo'ların nasıl 
oluşturulacağını öğreneceksiniz.
Todos'a mutasyon yapmak için bir GraphQL sorgusu tanımlayalım.

mutation addTodo($title: String!, $isPublic: Boolean!) {
  action: insert_todos(objects: { title: $title, is_public: $isPublic }) {
    returning {
      id
      title
      is_completed
    }
  }
}

mutation{
	insert_todos(objects: { title: "kyrgyz balasy", is_public: false }) {
    returning {
      id
      title
      is_completed
    }
  } 
}


*/