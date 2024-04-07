car

db.movie.updateMany({price:{$nin:[null],$exists:true}},{$inc:{price:-200}});

db.movie.updateMany({name:'Padmavat'},{$set:{ticket_num:100}})

db.movie.updateMany({name:/^p/},{$inc:{price:200},$set:{ticket_no:100},$currentDate:{'lastmodified':true}})

db.movie.updateMany({name:/^p/},{$unset:{ticket_num:''}})

db.movie.updateMany({name:/^P/},{$mul:{price:1.10}})

db.movie.update({},{$max:{price:450}},{multi:true})

db.movie.update({name:/^p/},{$min:{rating:3}},{multi:true})

db.movie.update({name:'kashmir files'},
{$set:{price:300},$inc:{rating:3}},
{multi:true,upsert:true})

db.movie.update({name:/^p/},{$set:{price:300}},{$inc:{rating:3}},{multi:true,upsert:true})

db.movie.find({name:'kashmir files'},{$push:{actor:'anupam kher'}})

db.movie.find({name:'kashmir files'},{$push:{actor:'anupam kher'}})

db.movie.update({name:'kashmir files'},
 {$push:{actor:'anupam kher'})
 
db.movie.update({name:'kashmir files'},{$push:{actor:'anupam kher'}) 

