/*
Remove todos - Mutation

Eğitimin bu bölümünde, GraphQL Mutations'ı kullanarak mevcut todo'ları nasıl 
kaldıracağınızı öğreneceksiniz.

Todos'ta bir mutasyon yapmak için bir GraphQL sorgusu tanımlayalım.

mutation delete($id:Int!) {
 action: delete_todos(where: {id: {_eq: $id}}) {
    returning {
      id
    }
  }
}

mutation{
	delete_todos (where: {id: {_eq: 64065}}){
    returning {
      id
      title
      is_completed
    }
  } 
}
*/