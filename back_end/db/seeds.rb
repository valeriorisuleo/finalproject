[User, Post, Content].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

kiddo = User.create!(
username: "blackmamba", email:"blackmamba@ga.co", password: "password", password_confirmation: "password", firstname: "Beatrix", lastname: "Kiddo")
ishii = User.create!(
username: "cottonmouth", email:"cottonmouth@ga.co", password: "password", password_confirmation: "password", firstname: "O-Ren", lastname: "Ishii")
green = User.create!(
username: "copperhead", email:"copperhead@ga.co", password: "password", password_confirmation: "password", firstname: "Vernita", lastname: "Green")

kiddo.posts.create!(
  title: "Chapter 3 The Origin of O-Ren",
  image: "https://img0.etsystatic.com/011/0/5850505/il_570xN.461842036_6ooc.jpg"
)
ishii.posts.create!(
  title: "Chapter 8 Pai Mei",
  image: "https://static.comicvine.com/uploads/original/14/146991/3143844-3969512460-79715.jpg"
)
kiddo.posts.create!(
  title: "Chapter 11 The Man fron Okinawa",
  image: "https://pmd205465tn-a.akamaihd.net/Miramax/292/783/VpZWdvYTplBLL80FJqk4sncCoDe644Na_h264_3800_640x360_352069187719.jpg"
)
green.posts.create!(
  title: "Chapter 7 Elle and I",
  image: "http://vignette2.wikia.nocookie.net/killbill/images/2/2f/ElleAndANotepad.jpg/revision/latest?cb=20110305205753"
)



kiddo.contents.create!(
body: "Do you know what this is? It’s the world’s smallest violin playing just for the waitresses.",
language: "english",
post_id: 1
)
ishii.contents.create!(
body: "That woman deserves her revenge and we deserve to die.",
language: "english",
post_id: 2
)
kiddo.contents.create!(
body: "Oh, you believe in Jesus now, huh, bitch? Good, ’cause you ’bout to meet him!",
language: "english",
post_id: 3
)
green.contents.create!(
body: "You know somethin’, Utivich? I think this just might be my masterpiece",
language: "english",
post_id: 4
)
