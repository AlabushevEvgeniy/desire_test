user1 = User.create!(name: "Vasya", email: "foo1@bar.com", signature: "signature1", password: "123123")
user2 = User.create!(name: "Petya", email: "foo2@bar.com", signature: "signature2", encrypted_password: "123123")

Favorite.create!([
  {user_id: user2.id, post_id: 2},
  {user_id: user2.id, post_id: 4},
])

Post.create!(title: "title1", preview: "preview1", text: "text1", published: false, user_id: user1.id)
Post.create!(title: "title2", preview: "preview2", text: "text2", published: false, user_id: user1.id)
Post.create!(title: "title3", preview: "preview3", text: "text3", published: false, user_id: user1.id)
Post.create!(title: "title4", preview: "preview4", text: "text4", published: false, user_id: user1.id)

ReadPost.create!([
  {user_id: user1.id, post_id: 4},
  {user_id: user2.id, post_id: 1},
  {user_id: user2.id, post_id: 2}
])
