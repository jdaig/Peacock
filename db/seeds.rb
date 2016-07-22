u = User.create(mail: "mau@codea", pk_id: "mau*pk", password: "123")
u2 = User.create(mail: "nacho@codea", pk_id: "nacho*pk", password: "123")
u3 = User.create(mail: "roberto@codea", pk_id: "roberto*pk", password: "123")

e = Enterprise.create(mail: "codea@codea",pk_id: "codea*pk",password: "123")

Info.create(enterprise_id: e.id, name_ent: "Codea")
Infoper.create(user_id: u.id, name_per: "Mau", lname_per: "lo", born:"12-12-12", ocupation: "Plomero")
Infoper.create(user_id: u2.id, name_per: "nacho", lname_per: "lo", born:"12-12-12", ocupation: "Code")
Infoper.create(user_id: u3.id, name_per: "roberto", lname_per: "lo", born:"12-12-12", ocupation: "Master")

Reputation.create(user_id: u.id, ocupation: "Plomero", average: "0", description: "codea description")
Reputation.create(user_id: u2.id, ocupation: "Code", average: "0", description: "codea description")
Reputation.create(user_id: u2.id, ocupation: "Master", average: "0", description: "codea description")
Reputation.create(user_id: u3.id, ocupation: "Master", average: "0", description: "codea description")
Reputation.create(enterprise_id: u.id, ocupation: "Code")

Relation.create(sudo:e.id, enterprise_id: e.id, user_id: u.id, evaluate: "Plomero")