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
  image:
  "https://img0.etsystatic.com/011/0/5850505/il_570xN.461842036_6ooc.jpg"
)
ishii.posts.create!(
  image:
  "https://static.comicvine.com/uploads/original/14/146991/3143844-3969512460-79715.jpg"
)
kiddo.posts.create!(
  image: "https://pmd205465tn-a.akamaihd.net/Miramax/292/783/VpZWdvYTplBLL80FJqk4sncCoDe644Na_h264_3800_640x360_352069187719.jpg"
)
green.posts.create!(
  image: "http://vignette2.wikia.nocookie.net/killbill/images/2/2f/ElleAndANotepad.jpg/revision/latest?cb=20110305205753"
)



kiddo.contents.create!([{
  title: "Chapter 3 The man from Okinawa",
  body: "Beatrice si rivolge a Dante e, chiamandolo per nome, lo invita a non piangere ancora per la dipartita di Virgilio, in quanto dovrà versare altre lacrime per altri motivi. La donna è simile a un ammiraglio che percorre il ponte per osservare le altre navi, volta sul fianco sinistro del carro: Dante la guarda e vede che fissa i suoi occhi su di lui, nonostante sia ancora coperta dal velo. Beatrice ha un atteggiamento duro e intransigente ed esorta Dante a guardarla bene, rivelando il proprio nome e accusando il poeta di aver osato accedere al Paradiso Terrestre dove l'uomo è felice. Dante abbassa lo sguardo verso le acque del Lete, ma poiché si vede riflesso in esse e si vergogna, volge gli occhi all'erba. Beatrice gli sembra tanto severa quanto lo è la madre che rimprovera aspramente il figlio.",
  language: "en",
  post_id: 1
},{
  title: "Capitolo 3 L'uomo che venivea da Okinawa",
  body: "Lo sacos a è questo? È il violino piu piccolo del mondo che suona per la cameriera.",
  language: "it",
  post_id: 1
}])

ishii.contents.create!(
  title: "Chapter 7 O-Ren Ishii origins",
  body: "That woman deserves her revenge and we deserve to die.",
  language: "en",
  post_id: 2
)
kiddo.contents.create!(
  title: "Chapter 5 I'm gonna kill bill",
  body: "Oh, you believe in Jesus now, huh, bitch? Good, ’cause you ’bout to meet him!",
  language: "en",
  post_id: 3
)
green.contents.create!(
  title: "Chapter 9 Born to the wild",
  body: "You know somethin’, Utivich? I think this just might be my masterpiece",
  language: "en",
  post_id: 4
)
