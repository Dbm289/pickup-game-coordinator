User.destroy_all
Team.destroy_all
Court.destroy_all

sixers = Team.create(name: "76ers")

dan = User.create(name: "Dan", email: "DanielMooreRealPerson", password: "password", position: "SF", alt_position: "SG", skill_level: 4, coaching_skill_level: 6)

tom = User.create(name: "Tom", email: "Tom@tom.com", password: "password", position: "SF", alt_position: "SG", skill_level: 4, coaching_skill_level: 6)

court1 = Court.create(name: "court1", quality: 6, team_id: sixers.id)