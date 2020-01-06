 db.users.find().forEach(function(x) { db.lessons.update( {"userId" : x._id}, {$set: { "username": x.username }});});
