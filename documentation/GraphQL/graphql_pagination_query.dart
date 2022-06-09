/*
https://api.graphqlplaceholder.com/

query{
  users(pagination: {limit: 2, page: 2}){
    data{
      name
      phone
      email
    }
  }
}

query{
  users(pagination: {limit: 2, page: 2}){
    totalPages
    currentPage
    data{
      name
      phone
      email
    }
  }
}


{
  "data": {
    "users": {
      "totalPages": 5,
      "currentPage": 2,
      "data": [
        {
          "name": "Clementine Bauch",
          "phone": "1-463-123-4447",
          "email": "Nathan@yesenia.net"
        },
        {
          "name": "Patricia Lebsack",
          "phone": "493-170-9623 x156",
          "email": "Julianne.OConner@kory.org"
        }
      ]
    }
  }
}
*/