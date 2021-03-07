User.destroy_all
Team.destroy_all

sixers = Team.create(name: "76ers", password: "password")

dan = User.create(name: "Dan", email: "DanielMooreRealPerson", password: "password", position: "SF", alt_position: "SG", skill_level: 4, coaching_skill_level: 6)

tom = User.create(name: "Tom", email: "Tom@tom.com", password: "password", position: "SF", alt_position: "SG", skill_level: 4, coaching_skill_level: 6)