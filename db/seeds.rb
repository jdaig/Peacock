u = User.create(mail: "mau@codea", pk_id: "mau*pk", password: "123")
e = Enterprise.create(mail: "codea@codea",pk_id: "codea*pk",password: "123")

Info.create(enterprise_id: e.id, name_ent: "Codea")
Infoper.create(user_id: u.id, name_per: "Mau")

Reputation.create(user_id: u.id, ocupation: "Plomero")
Reputation.create(enterprise_id: u.id, ocupation: "Code")

Relation.create(sudo:e.id, enterprise_id: e.id, user_id: u.id, evaluate: "Plomero")