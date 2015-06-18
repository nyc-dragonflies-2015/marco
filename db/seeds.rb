
  User.create(name: "marco", email: "marco@marco.net", password_hash: "123")
  User.first.posts.create(body: "this is a body")
   User.first.comments.create(body: "this is a comment body")
