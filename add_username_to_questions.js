 db.users.find().forEach(function(x) { db.questions.update( {"userId" : x._id}, {$set: { "username": x.username }});});
