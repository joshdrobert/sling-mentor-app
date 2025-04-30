# -----------------------------------------------------
# Seeding from Alumni Contact Information.xlsx
# -----------------------------------------------------

existing = User.find_by(email: "samika_tamu@tamu.edu")
if existing
  existing.update!(
    first_name: "Samika",
    last_name: "Gandhi",
    role: "student"
  )
else
  User.create!(
    first_name: "Samika",
    last_name: "Gandhi",
    email: "samika_tamu@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "samika_tamu@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "anabaw@tamu.edu")
if existing
  existing.update!(
    first_name: "Anaya",
    last_name: "Bawiskar",
    role: "student"
  )
else
  User.create!(
    first_name: "Anaya",
    last_name: "Bawiskar",
    email: "anabaw@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "anabaw@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "marygrace.wahby@tamu.edu")
if existing
  existing.update!(
    first_name: "Mary",
    last_name: "Grace Wahby",
    role: "student"
  )
else
  User.create!(
    first_name: "Mary",
    last_name: "Grace Wahby",
    email: "marygrace.wahby@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "marygrace.wahby@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "amandameawad@tamu.edu")
if existing
  existing.update!(
    first_name: "Amanda",
    last_name: "Meawad",
    role: "student"
  )
else
  User.create!(
    first_name: "Amanda",
    last_name: "Meawad",
    email: "amandameawad@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "amandameawad@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "yashtiwari10@tamu.edu")
if existing
  existing.update!(
    first_name: "Yash",
    last_name: "Tiwari",
    role: "student"
  )
else
  User.create!(
    first_name: "Yash",
    last_name: "Tiwari",
    email: "yashtiwari10@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "yashtiwari10@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "abhashirolkar@tamu.edu")
if existing
  existing.update!(
    first_name: "Abha",
    last_name: "Shirolkar",
    role: "student"
  )
else
  User.create!(
    first_name: "Abha",
    last_name: "Shirolkar",
    email: "abhashirolkar@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "abhashirolkar@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "nshenoda@tamu.edu")
if existing
  existing.update!(
    first_name: "Nicholas",
    last_name: "Shenoda",
    role: "student"
  )
else
  User.create!(
    first_name: "Nicholas",
    last_name: "Shenoda",
    email: "nshenoda@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "nshenoda@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "prajabi@tamu.edu")
if existing
  existing.update!(
    first_name: "Parsa",
    last_name: "Rajabi",
    role: "student"
  )
else
  User.create!(
    first_name: "Parsa",
    last_name: "Rajabi",
    email: "prajabi@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "prajabi@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "henryparm@tamu.edu")
if existing
  existing.update!(
    first_name: "Henry",
    last_name: "Parmenter",
    role: "student"
  )
else
  User.create!(
    first_name: "Henry",
    last_name: "Parmenter",
    email: "henryparm@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "henryparm@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "zr171441@tamu.edu")
if existing
  existing.update!(
    first_name: "Zane",
    last_name: "Richter",
    role: "student"
  )
else
  User.create!(
    first_name: "Zane",
    last_name: "Richter",
    email: "zr171441@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "zr171441@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ogbaslaim04@tamu.edu")
if existing
  existing.update!(
    first_name: "Omar",
    last_name: "Baslaim",
    role: "student"
  )
else
  User.create!(
    first_name: "Omar",
    last_name: "Baslaim",
    email: "ogbaslaim04@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ogbaslaim04@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "mariestrittmatter@tamu.edu")
if existing
  existing.update!(
    first_name: "Marie",
    last_name: "Strittmatter",
    role: "student"
  )
else
  User.create!(
    first_name: "Marie",
    last_name: "Strittmatter",
    email: "mariestrittmatter@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "mariestrittmatter@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ananya_j@tamu.edu")
if existing
  existing.update!(
    first_name: "Ananya",
    last_name: "Joshi",
    role: "student"
  )
else
  User.create!(
    first_name: "Ananya",
    last_name: "Joshi",
    email: "ananya_j@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ananya_j@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "vikash@tamu.edu")
if existing
  existing.update!(
    first_name: "Vikash",
    last_name: "Ravuri",
    role: "student"
  )
else
  User.create!(
    first_name: "Vikash",
    last_name: "Ravuri",
    email: "vikash@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "vikash@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jdudley9@tamu.edu")
if existing
  existing.update!(
    first_name: "Joshua",
    last_name: "Dudley",
    role: "student"
  )
else
  User.create!(
    first_name: "Joshua",
    last_name: "Dudley",
    email: "jdudley9@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jdudley9@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "theresa_tran24@tamu.edu")
if existing
  existing.update!(
    first_name: "Theresa",
    last_name: "Tran",
    role: "student"
  )
else
  User.create!(
    first_name: "Theresa",
    last_name: "Tran",
    email: "theresa_tran24@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "theresa_tran24@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "janakabraham4@tamu.edu")
if existing
  existing.update!(
    first_name: "Janak",
    last_name: "Abraham",
    role: "student"
  )
else
  User.create!(
    first_name: "Janak",
    last_name: "Abraham",
    email: "janakabraham4@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "janakabraham4@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "arham.hassan@tamu.edu")
if existing
  existing.update!(
    first_name: "Arham",
    last_name: "Hassan",
    role: "student"
  )
else
  User.create!(
    first_name: "Arham",
    last_name: "Hassan",
    email: "arham.hassan@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "arham.hassan@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "alicequeiroz1510@tamu.edu")
if existing
  existing.update!(
    first_name: "Alice",
    last_name: "Queiroz",
    role: "student"
  )
else
  User.create!(
    first_name: "Alice",
    last_name: "Queiroz",
    email: "alicequeiroz1510@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "alicequeiroz1510@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "aditya.tripathy@tamu.edu")
if existing
  existing.update!(
    first_name: "Adi",
    last_name: "Tripathy",
    role: "student"
  )
else
  User.create!(
    first_name: "Adi",
    last_name: "Tripathy",
    email: "aditya.tripathy@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "aditya.tripathy@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ashatby@tamu.edu")
if existing
  existing.update!(
    first_name: "Anthony",
    last_name: "Shatby",
    role: "student"
  )
else
  User.create!(
    first_name: "Anthony",
    last_name: "Shatby",
    email: "ashatby@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ashatby@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "nacole1120@tamu.edu")
if existing
  existing.update!(
    first_name: "Nathan",
    last_name: "Cole",
    role: "student"
  )
else
  User.create!(
    first_name: "Nathan",
    last_name: "Cole",
    email: "nacole1120@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "nacole1120@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "richardabalbin@tamu.edu")
if existing
  existing.update!(
    first_name: "Richard",
    last_name: "Balbin",
    role: "student"
  )
else
  User.create!(
    first_name: "Richard",
    last_name: "Balbin",
    email: "richardabalbin@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "richardabalbin@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "vishaka05@tamu.edu")
if existing
  existing.update!(
    first_name: "Vishaka",
    last_name: "Bhora",
    role: "student"
  )
else
  User.create!(
    first_name: "Vishaka",
    last_name: "Bhora",
    email: "vishaka05@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "vishaka05@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "sarayu_m@tamu.edu")
if existing
  existing.update!(
    first_name: "Sarayu",
    last_name: "Malireddy",
    role: "student"
  )
else
  User.create!(
    first_name: "Sarayu",
    last_name: "Malireddy",
    email: "sarayu_m@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "sarayu_m@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ayaan244@tamu.edu")
if existing
  existing.update!(
    first_name: "Ayaan",
    last_name: "Mohammed",
    role: "student"
  )
else
  User.create!(
    first_name: "Ayaan",
    last_name: "Mohammed",
    email: "ayaan244@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ayaan244@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "anokhisheth@tamu.edu")
if existing
  existing.update!(
    first_name: "Anokhi",
    last_name: "Sheth",
    role: "student"
  )
else
  User.create!(
    first_name: "Anokhi",
    last_name: "Sheth",
    email: "anokhisheth@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "anokhisheth@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "somya.mehrotra2005@tamu.edu")
if existing
  existing.update!(
    first_name: "Somya",
    last_name: "Mehrotra",
    role: "student"
  )
else
  User.create!(
    first_name: "Somya",
    last_name: "Mehrotra",
    email: "somya.mehrotra2005@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "somya.mehrotra2005@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "rishikhot@tamu.edu")
if existing
  existing.update!(
    first_name: "Rishi",
    last_name: "Khot",
    role: "student"
  )
else
  User.create!(
    first_name: "Rishi",
    last_name: "Khot",
    email: "rishikhot@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "rishikhot@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "deenos25@tamu.edu")
if existing
  existing.update!(
    first_name: "Deen",
    last_name: "Osman",
    role: "student"
  )
else
  User.create!(
    first_name: "Deen",
    last_name: "Osman",
    email: "deenos25@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "deenos25@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "vedanshi@tamu.edu")
if existing
  existing.update!(
    first_name: "Vedanshi",
    last_name: "Patel",
    role: "student"
  )
else
  User.create!(
    first_name: "Vedanshi",
    last_name: "Patel",
    email: "vedanshi@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "vedanshi@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "alexandram32@tamu.edu")
if existing
  existing.update!(
    first_name: "Alexandra",
    last_name: "Moran",
    role: "student"
  )
else
  User.create!(
    first_name: "Alexandra",
    last_name: "Moran",
    email: "alexandram32@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "alexandram32@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "aryanp313@tamu.edu")
if existing
  existing.update!(
    first_name: "Aryan",
    last_name: "Patel",
    role: "student"
  )
else
  User.create!(
    first_name: "Aryan",
    last_name: "Patel",
    email: "aryanp313@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "aryanp313@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "emadk712@tamu.edu")
if existing
  existing.update!(
    first_name: "Emad",
    last_name: "Khalid",
    role: "student"
  )
else
  User.create!(
    first_name: "Emad",
    last_name: "Khalid",
    email: "emadk712@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "emadk712@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jan.escanan@tamu.edu")
if existing
  existing.update!(
    first_name: "Jan",
    last_name: "Escanan",
    role: "student"
  )
else
  User.create!(
    first_name: "Jan",
    last_name: "Escanan",
    email: "jan.escanan@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jan.escanan@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "cagunawan@tamu.edu")
if existing
  existing.update!(
    first_name: "Cathryn",
    last_name: "Gunawan",
    role: "student"
  )
else
  User.create!(
    first_name: "Cathryn",
    last_name: "Gunawan",
    email: "cagunawan@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "cagunawan@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "nithinchidambara@gmail.com")
if existing
  existing.update!(
    first_name: "Nithin",
    last_name: "Chidambara",
    role: "student"
  )
else
  User.create!(
    first_name: "Nithin",
    last_name: "Chidambara",
    email: "nithinchidambara@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "nithinchidambara@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "christalguevara@tamu.edu")
if existing
  existing.update!(
    first_name: "Christal",
    last_name: "Guevera Escobar",
    role: "student"
  )
else
  User.create!(
    first_name: "Christal",
    last_name: "Guevera Escobar",
    email: "christalguevara@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "christalguevara@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "mcauleym@tamu.edu")
if existing
  existing.update!(
    first_name: "Michael",
    last_name: "McAuley",
    role: "student"
  )
else
  User.create!(
    first_name: "Michael",
    last_name: "McAuley",
    email: "mcauleym@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "mcauleym@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "asadahmad7163@tamu.edu")
if existing
  existing.update!(
    first_name: "Asad",
    last_name: "Ahmad",
    role: "student"
  )
else
  User.create!(
    first_name: "Asad",
    last_name: "Ahmad",
    email: "asadahmad7163@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "asadahmad7163@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "shaunak@tamu.edu")
if existing
  existing.update!(
    first_name: "Shaunak",
    last_name: "Dabir",
    role: "student"
  )
else
  User.create!(
    first_name: "Shaunak",
    last_name: "Dabir",
    email: "shaunak@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "shaunak@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "lindsey.colgin@tamu.edu")
if existing
  existing.update!(
    first_name: "Lindsey",
    last_name: "Colgin",
    role: "student"
  )
else
  User.create!(
    first_name: "Lindsey",
    last_name: "Colgin",
    email: "lindsey.colgin@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "lindsey.colgin@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "bkaparthi11@tamu.edu")
if existing
  existing.update!(
    first_name: "Bhavika",
    last_name: "Kaparthi",
    role: "student"
  )
else
  User.create!(
    first_name: "Bhavika",
    last_name: "Kaparthi",
    email: "bkaparthi11@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "bkaparthi11@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "it177750@tamu.edu")
if existing
  existing.update!(
    first_name: "Isabella",
    last_name: "Thomas",
    role: "student"
  )
else
  User.create!(
    first_name: "Isabella",
    last_name: "Thomas",
    email: "it177750@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "it177750@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "surishettysnikitha@tamu.edu")
if existing
  existing.update!(
    first_name: "Snikitha",
    last_name: "Surishetty",
    role: "student"
  )
else
  User.create!(
    first_name: "Snikitha",
    last_name: "Surishetty",
    email: "surishettysnikitha@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "surishettysnikitha@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "caitdo@tamu.edu")
if existing
  existing.update!(
    first_name: "Caitlin",
    last_name: "Do",
    role: "student"
  )
else
  User.create!(
    first_name: "Caitlin",
    last_name: "Do",
    email: "caitdo@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "caitdo@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "harrison2204@tamu.edu")
if existing
  existing.update!(
    first_name: "Harrison",
    last_name: "Pham",
    role: "student"
  )
else
  User.create!(
    first_name: "Harrison",
    last_name: "Pham",
    email: "harrison2204@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "harrison2204@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "fayobamitaiwo567@tamu.edu")
if existing
  existing.update!(
    first_name: "Fayobami",
    last_name: "Taiwo",
    role: "student"
  )
else
  User.create!(
    first_name: "Fayobami",
    last_name: "Taiwo",
    email: "fayobamitaiwo567@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "fayobamitaiwo567@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "hannahkrenz@tamu.edu")
if existing
  existing.update!(
    first_name: "Hannah",
    last_name: "Krenz",
    role: "student"
  )
else
  User.create!(
    first_name: "Hannah",
    last_name: "Krenz",
    email: "hannahkrenz@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "hannahkrenz@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "oliviabehne@tamu.edu")
if existing
  existing.update!(
    first_name: "Olivia",
    last_name: "Behne",
    role: "student"
  )
else
  User.create!(
    first_name: "Olivia",
    last_name: "Behne",
    email: "oliviabehne@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "oliviabehne@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "rfb32@tamu.edu")
if existing
  existing.update!(
    first_name: "Ronin",
    last_name: "Burke",
    role: "student"
  )
else
  User.create!(
    first_name: "Ronin",
    last_name: "Burke",
    email: "rfb32@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "rfb32@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ericgu@tamu.edu")
if existing
  existing.update!(
    first_name: "Eric",
    last_name: "Gu",
    role: "student"
  )
else
  User.create!(
    first_name: "Eric",
    last_name: "Gu",
    email: "ericgu@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ericgu@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "josephfadigeorges@gmail.com")
if existing
  existing.update!(
    first_name: "Joseph",
    last_name: "Georges",
    role: "student"
  )
else
  User.create!(
    first_name: "Joseph",
    last_name: "Georges",
    email: "josephfadigeorges@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "josephfadigeorges@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "rzakarevicz@tamu.edu")
if existing
  existing.update!(
    first_name: "Rachel",
    last_name: "Zakarevicz",
    role: "student"
  )
else
  User.create!(
    first_name: "Rachel",
    last_name: "Zakarevicz",
    email: "rzakarevicz@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "rzakarevicz@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "gowtham_kadiyala@tamu.edu")
if existing
  existing.update!(
    first_name: "Gowtham",
    last_name: "Kadiyala",
    role: "student"
  )
else
  User.create!(
    first_name: "Gowtham",
    last_name: "Kadiyala",
    email: "gowtham_kadiyala@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "gowtham_kadiyala@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "monish2c@tamu.edu")
if existing
  existing.update!(
    first_name: "Monish",
    last_name: "Civunigunta",
    role: "student"
  )
else
  User.create!(
    first_name: "Monish",
    last_name: "Civunigunta",
    email: "monish2c@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "monish2c@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "cvvisruth@gmail.com")
if existing
  existing.update!(
    first_name: "Visruth",
    last_name: "Chakka",
    role: "student"
  )
else
  User.create!(
    first_name: "Visruth",
    last_name: "Chakka",
    email: "cvvisruth@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "cvvisruth@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jacksona1107@tamu.edu")
if existing
  existing.update!(
    first_name: "Jackson",
    last_name: "Angell",
    role: "student"
  )
else
  User.create!(
    first_name: "Jackson",
    last_name: "Angell",
    email: "jacksona1107@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jacksona1107@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "kirstenbrowne@tamu.edu")
if existing
  existing.update!(
    first_name: "Kirsten",
    last_name: "Browne",
    role: "student"
  )
else
  User.create!(
    first_name: "Kirsten",
    last_name: "Browne",
    email: "kirstenbrowne@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "kirstenbrowne@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "cc81529@tamu.edu")
if existing
  existing.update!(
    first_name: "Connor",
    last_name: "Cunningham",
    role: "student"
  )
else
  User.create!(
    first_name: "Connor",
    last_name: "Cunningham",
    email: "cc81529@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "cc81529@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "sharon.thomas@tamu.edu")
if existing
  existing.update!(
    first_name: "Sharon",
    last_name: "Thomas",
    role: "student"
  )
else
  User.create!(
    first_name: "Sharon",
    last_name: "Thomas",
    email: "sharon.thomas@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "sharon.thomas@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "hetvi_desai@tamu.edu")
if existing
  existing.update!(
    first_name: "Hetvi",
    last_name: "Desai",
    role: "student"
  )
else
  User.create!(
    first_name: "Hetvi",
    last_name: "Desai",
    email: "hetvi_desai@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "hetvi_desai@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "cspercussionist@gmail.com")
if existing
  existing.update!(
    first_name: "Noah",
    last_name: "Taylor",
    role: "student"
  )
else
  User.create!(
    first_name: "Noah",
    last_name: "Taylor",
    email: "cspercussionist@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "cspercussionist@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "zahlfinger@tamu.edu")
if existing
  existing.update!(
    first_name: "Zane",
    last_name: "Ahlfinger",
    role: "student"
  )
else
  User.create!(
    first_name: "Zane",
    last_name: "Ahlfinger",
    email: "zahlfinger@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "zahlfinger@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "megan.guy@tamu.edu")
if existing
  existing.update!(
    first_name: "Megan",
    last_name: "Guy",
    role: "student"
  )
else
  User.create!(
    first_name: "Megan",
    last_name: "Guy",
    email: "megan.guy@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "megan.guy@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "vaishu_suresh01@tamu.edu")
if existing
  existing.update!(
    first_name: "Vaishnavi",
    last_name: "Suresh",
    role: "student"
  )
else
  User.create!(
    first_name: "Vaishnavi",
    last_name: "Suresh",
    email: "vaishu_suresh01@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "vaishu_suresh01@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "eitan@tamu.edu")
if existing
  existing.update!(
    first_name: "Eitan",
    last_name: "Hollander",
    role: "student"
  )
else
  User.create!(
    first_name: "Eitan",
    last_name: "Hollander",
    email: "eitan@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "eitan@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "myckiealacooper@gmail.com")
if existing
  existing.update!(
    first_name: "Myckieala",
    last_name: "Cooper",
    role: "student"
  )
else
  User.create!(
    first_name: "Myckieala",
    last_name: "Cooper",
    email: "myckiealacooper@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "myckiealacooper@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "njfernandes24@tamu.edu")
if existing
  existing.update!(
    first_name: "Nathaniel",
    last_name: "Fernandez",
    role: "student"
  )
else
  User.create!(
    first_name: "Nathaniel",
    last_name: "Fernandez",
    email: "njfernandes24@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "njfernandes24@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "meghgore@tamu.edu")
if existing
  existing.update!(
    first_name: "Megh",
    last_name: "Gore",
    role: "student"
  )
else
  User.create!(
    first_name: "Megh",
    last_name: "Gore",
    email: "meghgore@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "meghgore@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ramlahkhan12@tamu.edu")
if existing
  existing.update!(
    first_name: "Ramlah",
    last_name: "Khan",
    role: "student"
  )
else
  User.create!(
    first_name: "Ramlah",
    last_name: "Khan",
    email: "ramlahkhan12@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ramlahkhan12@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "vipul17@tamu.edu")
if existing
  existing.update!(
    first_name: "Vipul",
    last_name: "Vipul",
    role: "student"
  )
else
  User.create!(
    first_name: "Vipul",
    last_name: "Vipul",
    email: "vipul17@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "vipul17@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "nmcelrath1999@tamu.edu")
if existing
  existing.update!(
    first_name: "Natalie",
    last_name: "McElrath",
    role: "student"
  )
else
  User.create!(
    first_name: "Natalie",
    last_name: "McElrath",
    email: "nmcelrath1999@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "nmcelrath1999@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "davidluo123@tamu.edu")
if existing
  existing.update!(
    first_name: "David",
    last_name: "Luo",
    role: "student"
  )
else
  User.create!(
    first_name: "David",
    last_name: "Luo",
    email: "davidluo123@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "davidluo123@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "johnnymcmurray123@tamu.edu")
if existing
  existing.update!(
    first_name: "John",
    last_name: "McMurray",
    role: "student"
  )
else
  User.create!(
    first_name: "John",
    last_name: "McMurray",
    email: "johnnymcmurray123@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "johnnymcmurray123@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "dakota.doucet@tamu.edu")
if existing
  existing.update!(
    first_name: "Dakota",
    last_name: "Doucet",
    role: "student"
  )
else
  User.create!(
    first_name: "Dakota",
    last_name: "Doucet",
    email: "dakota.doucet@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "dakota.doucet@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "daniela.5arredondo@tamu.edu")
if existing
  existing.update!(
    first_name: "Daniela",
    last_name: "Arrendondo",
    role: "student"
  )
else
  User.create!(
    first_name: "Daniela",
    last_name: "Arrendondo",
    email: "daniela.5arredondo@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "daniela.5arredondo@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "suri_10@tamu.edu")
if existing
  existing.update!(
    first_name: "Sai",
    last_name: "Raghava Bhargavi Suri",
    role: "student"
  )
else
  User.create!(
    first_name: "Sai",
    last_name: "Raghava Bhargavi Suri",
    email: "suri_10@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "suri_10@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "zdm2022@tamu.edu")
if existing
  existing.update!(
    first_name: "Zachary",
    last_name: "Mendoza",
    role: "student"
  )
else
  User.create!(
    first_name: "Zachary",
    last_name: "Mendoza",
    email: "zdm2022@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "zdm2022@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "aawallace9@tamu.edu")
if existing
  existing.update!(
    first_name: "Alexander",
    last_name: "Wallace",
    role: "student"
  )
else
  User.create!(
    first_name: "Alexander",
    last_name: "Wallace",
    email: "aawallace9@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "aawallace9@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jaredhill@tamu.edu")
if existing
  existing.update!(
    first_name: "Jared",
    last_name: "Hill",
    role: "student"
  )
else
  User.create!(
    first_name: "Jared",
    last_name: "Hill",
    email: "jaredhill@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jaredhill@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "sameeksha_sharma@tamu.edu")
if existing
  existing.update!(
    first_name: "Sameeksha",
    last_name: "Sharma",
    role: "student"
  )
else
  User.create!(
    first_name: "Sameeksha",
    last_name: "Sharma",
    email: "sameeksha_sharma@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "sameeksha_sharma@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "fouzul.k@tamu.edu")
if existing
  existing.update!(
    first_name: "Fouzul",
    last_name: "Kansul",
    role: "student"
  )
else
  User.create!(
    first_name: "Fouzul",
    last_name: "Kansul",
    email: "fouzul.k@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "fouzul.k@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "parkandrew567@gmail.com")
if existing
  existing.update!(
    first_name: "Andrew",
    last_name: "Park",
    role: "student"
  )
else
  User.create!(
    first_name: "Andrew",
    last_name: "Park",
    email: "parkandrew567@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "parkandrew567@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "oconnellcailin@tamu.edu")
if existing
  existing.update!(
    first_name: "Cailin",
    last_name: "O'Connell",
    role: "student"
  )
else
  User.create!(
    first_name: "Cailin",
    last_name: "O'Connell",
    email: "oconnellcailin@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "oconnellcailin@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "dianasalha123@tamu.edu")
if existing
  existing.update!(
    first_name: "Diana",
    last_name: "Salha",
    role: "student"
  )
else
  User.create!(
    first_name: "Diana",
    last_name: "Salha",
    email: "dianasalha123@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "dianasalha123@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "mikashkothari2000@gmail.com")
if existing
  existing.update!(
    first_name: "Mikash",
    last_name: "Kothari",
    role: "student"
  )
else
  User.create!(
    first_name: "Mikash",
    last_name: "Kothari",
    email: "mikashkothari2000@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "mikashkothari2000@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "saf180003@tamu.edu")
if existing
  existing.update!(
    first_name: "Syeda",
    last_name: "Fatima",
    role: "student"
  )
else
  User.create!(
    first_name: "Syeda",
    last_name: "Fatima",
    email: "saf180003@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "saf180003@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jchapa5@tamu.edu")
if existing
  existing.update!(
    first_name: "Jessica",
    last_name: "Chapa",
    role: "student"
  )
else
  User.create!(
    first_name: "Jessica",
    last_name: "Chapa",
    email: "jchapa5@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jchapa5@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "Japowell98@tamu.edu")
if existing
  existing.update!(
    first_name: "Jacob",
    last_name: "Powell",
    role: "student"
  )
else
  User.create!(
    first_name: "Jacob",
    last_name: "Powell",
    email: "Japowell98@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "Japowell98@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "eugeneschao@tamu.edu")
if existing
  existing.update!(
    first_name: "Eugene",
    last_name: "Chao",
    role: "student"
  )
else
  User.create!(
    first_name: "Eugene",
    last_name: "Chao",
    email: "eugeneschao@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "eugeneschao@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "sophia.abbasali@gmail.com")
if existing
  existing.update!(
    first_name: "Sophia",
    last_name: "Abbasali",
    role: "student"
  )
else
  User.create!(
    first_name: "Sophia",
    last_name: "Abbasali",
    email: "sophia.abbasali@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "sophia.abbasali@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "bpiecewicz@tamu.edu")
if existing
  existing.update!(
    first_name: "Bailyn",
    last_name: "Piecewicz",
    role: "student"
  )
else
  User.create!(
    first_name: "Bailyn",
    last_name: "Piecewicz",
    email: "bpiecewicz@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "bpiecewicz@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "kathyxiao98@tamu.edu")
if existing
  existing.update!(
    first_name: "Kathy",
    last_name: "Xiao Cai",
    role: "student"
  )
else
  User.create!(
    first_name: "Kathy",
    last_name: "Xiao Cai",
    email: "kathyxiao98@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "kathyxiao98@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "shyamram5@tamu.edu")
if existing
  existing.update!(
    first_name: "Shyam",
    last_name: "Ramachandran",
    role: "student"
  )
else
  User.create!(
    first_name: "Shyam",
    last_name: "Ramachandran",
    email: "shyamram5@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "shyamram5@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jakegibbs5413@tamu.edu")
if existing
  existing.update!(
    first_name: "Jacob",
    last_name: "Gibbs",
    role: "student"
  )
else
  User.create!(
    first_name: "Jacob",
    last_name: "Gibbs",
    email: "jakegibbs5413@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jakegibbs5413@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "susheeldeshpande2@gmail.com")
if existing
  existing.update!(
    first_name: "Susheel",
    last_name: "Deshpande",
    role: "student"
  )
else
  User.create!(
    first_name: "Susheel",
    last_name: "Deshpande",
    email: "susheeldeshpande2@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "susheeldeshpande2@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "joshdrobert@gmail.com")
if existing
  existing.update!(
    first_name: "Josh",
    last_name: "Robert",
    role: "student"
  )
else
  User.create!(
    first_name: "Josh",
    last_name: "Robert",
    email: "joshdrobert@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "joshdrobert@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "Marcusreece@tamu.edu")
if existing
  existing.update!(
    first_name: "Marcus",
    last_name: "Caldera",
    role: "student"
  )
else
  User.create!(
    first_name: "Marcus",
    last_name: "Caldera",
    email: "Marcusreece@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "Marcusreece@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end




# -----------------------------------------------------
# Seeding from Contact Information (Team, Boad Memebers, EnMed).xlsx
# -----------------------------------------------------

existing = User.find_by(email: "reidmaster12@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "reidmaster12@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "reidmaster12@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "sanjna0720@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "sanjna0720@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "sanjna0720@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "varunkumar@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "varunkumar@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "varunkumar@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ckeehn@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "ckeehn@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ckeehn@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "tinsleja@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "tinsleja@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "tinsleja@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "brooklynhclark@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "brooklynhclark@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "brooklynhclark@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "punit.d@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "punit.d@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "punit.d@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "zrickmeyer@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "zrickmeyer@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "zrickmeyer@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "15loygenblik@gmail.com")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "15loygenblik@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "15loygenblik@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "nathan.harward@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "nathan.harward@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "nathan.harward@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "maggiezhangjordan@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "maggiezhangjordan@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "maggiezhangjordan@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "kholwadwala@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "kholwadwala@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "kholwadwala@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "ecem_simay@tamu.edu")
if existing
  existing.update!(
    role: "student"
  )
else
  User.create!(
    email: "ecem_simay@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "ecem_simay@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end




# -----------------------------------------------------
# Seeding from Sling Health Mentor Contacts.xlsx
# -----------------------------------------------------

existing = User.find_by(email: "saurabh_biswas@tamu.edu")
if existing
  existing.update!(
    first_name: "Saurabh",
    last_name: "Biswas",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Saurabh",
    last_name: "Biswas",
    email: "saurabh_biswas@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "saurabh_biswas@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Biomedical Engineering Professor"
  end
end

existing = User.find_by(email: "m-lagoudas@tamu.edu")
if existing
  existing.update!(
    first_name: "Magdalini",
    last_name: "Lagoudas",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Magdalini",
    last_name: "Lagoudas",
    email: "m-lagoudas@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "m-lagoudas@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Executive Director Industry/Nonprofit Partnerships"
  end
end

existing = User.find_by(email: "aginn@tamu.edu")
if existing
  existing.update!(
    first_name: "Annie",
    last_name: "Hedman",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Annie",
    last_name: "Hedman",
    email: "aginn@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "aginn@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Instructional Professor"
  end
end

existing = User.find_by(email: "zbujnoch@tamu.edu")
if existing
  existing.update!(
    first_name: "Zachary",
    last_name: "Bujnoch",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Zachary",
    last_name: "Bujnoch",
    email: "zbujnoch@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "zbujnoch@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Associate Professor of Practice"
  end
end

# Skipping row because email is missing: {'Engineering, Entrepreneurship, Healthcare, and Alumni Contacts': nan, 'Name': 'Jim Donnell', 'Department': nan, 'Role': nan, 'Areas of Interest': nan, 'Email': nan}

existing = User.find_by(email: "chriscurran@tamu.edu")
if existing
  existing.update!(
    first_name: "Chris",
    last_name: "Curran",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Chris",
    last_name: "Curran",
    email: "chriscurran@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "chriscurran@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Associate Professor of Practice"
  end
end

existing = User.find_by(email: "rblock@tamu.edu")
if existing
  existing.update!(
    first_name: "Roland",
    last_name: "Block",
    role: "student"
  )
else
  User.create!(
    first_name: "Roland",
    last_name: "Block",
    email: "rblock@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "rblock@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

# Skipping row because email is missing: {'Engineering, Entrepreneurship, Healthcare, and Alumni Contacts': nan, 'Name': 'Prof. William Montgomery', 'Department': 'BMEN', 'Role': 'Visiting Associate Professor of Practice', 'Areas of Interest': 'cardiovascular disease, pediatric and adult cardiac reconstruction', 'Email': nan}

existing = User.find_by(email: "john.hanks@tamu.edu")
if existing
  existing.update!(
    first_name: "John",
    last_name: "Hanks",
    role: "mentor"
  )
else
  User.create!(
    first_name: "John",
    last_name: "Hanks",
    email: "john.hanks@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "john.hanks@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Professor of Practice"
  end
end

existing = User.find_by(email: "gcote@tamu.edu")
if existing
  existing.update!(
    first_name: "Gerard",
    last_name: "Cote",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Gerard",
    last_name: "Cote",
    email: "gcote@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "gcote@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Director of Center for Remote Health Tech and Systems"
  end
end

existing = User.find_by(email: "bharidas@tamu.edu")
if existing
  existing.update!(
    first_name: "Balakrishna",
    last_name: "Haridas",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Balakrishna",
    last_name: "Haridas",
    email: "bharidas@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "bharidas@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Executive Director/PI for FDA Southewest Pediatric Devices Innovation Consortium"
  end
end

existing = User.find_by(email: "cpatrick@tamu.edu")
if existing
  existing.update!(
    first_name: "Charles",
    last_name: "Patrick",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Charles",
    last_name: "Patrick",
    email: "cpatrick@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "cpatrick@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Professor of Practice"
  end
end

existing = User.find_by(email: "mpmcdougall@tamu.edu")
if existing
  existing.update!(
    first_name: "Mary",
    last_name: "McDougall",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Mary",
    last_name: "McDougall",
    email: "mpmcdougall@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "mpmcdougall@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Associate Professor"
  end
end

existing = User.find_by(email: "gaharwar@tamu.edu")
if existing
  existing.update!(
    first_name: "Akhilesh",
    last_name: "Gaharwar",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Akhilesh",
    last_name: "Gaharwar",
    email: "gaharwar@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "gaharwar@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "Professor"
  end
end

existing = User.find_by(email: "tfalohun@tamu.edu")
if existing
  existing.update!(
    first_name: "TJ",
    last_name: "Falohun",
    role: "student"
  )
else
  User.create!(
    first_name: "TJ",
    last_name: "Falohun",
    email: "tfalohun@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "tfalohun@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jessefphipps@gmail.com")
if existing
  existing.update!(
    first_name: "Jesse",
    last_name: "Phipps",
    role: "student"
  )
else
  User.create!(
    first_name: "Jesse",
    last_name: "Phipps",
    email: "jessefphipps@gmail.com",
    role: "student"
  )
end

u = User.find_by(email: "jessefphipps@gmail.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "jaredhill@tamu.edu")
if existing
  existing.update!(
    first_name: "Jared",
    last_name: "Hill",
    role: "student"
  )
else
  User.create!(
    first_name: "Jared",
    last_name: "Hill",
    email: "jaredhill@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "jaredhill@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "japowell98@tamu.edu")
if existing
  existing.update!(
    first_name: "Jacob",
    last_name: "Powell",
    role: "student"
  )
else
  User.create!(
    first_name: "Jacob",
    last_name: "Powell",
    email: "japowell98@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "japowell98@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "logandubose960@tamu.edu")
if existing
  existing.update!(
    first_name: "Logan",
    last_name: "Dubose",
    role: "student"
  )
else
  User.create!(
    first_name: "Logan",
    last_name: "Dubose",
    email: "logandubose960@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "logandubose960@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "njfernandes24@tamu.edu")
if existing
  existing.update!(
    first_name: "Nathaniel",
    last_name: "Fernandes",
    role: "student"
  )
else
  User.create!(
    first_name: "Nathaniel",
    last_name: "Fernandes",
    email: "njfernandes24@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "njfernandes24@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "janakabraham4@tamu.edu")
if existing
  existing.update!(
    first_name: "Janak",
    last_name: "Abraham",
    role: "student"
  )
else
  User.create!(
    first_name: "Janak",
    last_name: "Abraham",
    email: "janakabraham4@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "janakabraham4@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "vikash@tamu.edu")
if existing
  existing.update!(
    first_name: "Vikash",
    last_name: "Ravuri",
    role: "student"
  )
else
  User.create!(
    first_name: "Vikash",
    last_name: "Ravuri",
    email: "vikash@tamu.edu",
    role: "student"
  )
end

u = User.find_by(email: "vikash@tamu.edu")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "abr90@tamu.edu")
if existing
  existing.update!(
    first_name: "Andrew",
    last_name: "Robbins",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Andrew",
    last_name: "Robbins",
    email: "abr90@tamu.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "abr90@tamu.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "now assistant professor at UT Tyler"
  end
end

existing = User.find_by(email: "oldschool1@runbox.com")
if existing
  existing.update!(
    first_name: "Barry",
    last_name: "Creighton",
    role: "student"
  )
else
  User.create!(
    first_name: "Barry",
    last_name: "Creighton",
    email: "oldschool1@runbox.com",
    role: "student"
  )
end

u = User.find_by(email: "oldschool1@runbox.com")
if u
  Student.find_or_create_by(user: u)
end

existing = User.find_by(email: "daniel.usera@uta.edu")
if existing
  existing.update!(
    first_name: "Daniel",
    last_name: "Usera",
    role: "mentor"
  )
else
  User.create!(
    first_name: "Daniel",
    last_name: "Usera",
    email: "daniel.usera@uta.edu",
    role: "mentor"
  )
end

u = User.find_by(email: "daniel.usera@uta.edu")
if u
  Mentor.find_or_create_by(user: u) do |m|
    m.profession = "now professor at UTA"
  end
end



