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

  static String addTodo = '''mutation addTodo(\$title: String!, \$isPublic: Boolean!) {
 action: insert_todos(objects: { title: \$title, is_public: \$isPublic }) {
    returning {
     id
     title
     is_completed
   }
 }
 }''';

  static String toggleTodo = """mutation toggleTodo(\$id:Int!, \$isCompleted: Boolean!) {
  action: update_todos(where: {id: {_eq: \$id}}, _set: {is_completed: \$isCompleted}) {
   returning {
      is_completed
    }
  }
 }""";

  static String deleteTodo = """mutation delete(\$id:Int!) {
 action: delete_todos(where: {id: {_eq: \$id}}) {
    returning {
      id
    }
  }
 }""";
}
