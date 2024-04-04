car
db.movie.updateMany({name:/^kashmir/},{$pull:{actor:'sss'}})

db.student.update({},{$inc:{'marks.$[]':5}},{arrayFilters:[{element:{$gte:90}}],multi:true});

--increase one 

db.movie.aggregate([{$sort:{rating:1}},{$skip:2},{$limit:2},{$sort:{name:1}}])

db.movie.aggregate([{$sort:{rating:1}},{$skip:2},{$limit:3},{$sort:{name:1}}])

$project{name:1,rating:1,price:1,addition:{$add:['$rating','$price']}}


db.movie.aggregate([{$project:{name:1,actor:1,rating:1,price:1,ticket_no:1,sumtp:{$add:[{$ifNull:['$ticket_no',0]},'$price']}}}])

db.movie.aggregate([{$match:{price:{$nin:[null],$exists:true},ticket_no:{$nin:[null],$exists:true}}},{$project:{name:{$toUpper:'$name'},price:1,ticket_no:1,differ:{$subtract:['$price','$ticket_no']}}}])

$subtract:['$price',{$multiply:['$price',0.10]}]
$multiply:['$price',0.90]

db.movie.aggregate([{$match:{rating:{$gte:3}}},{$project:{name:1,price:1,rating:1,discount1:{$multiply:['$price',0.90]},discount2:{$subtratct}}}])

db.movie.aggregate([{$project:{name:{$toUpper:'$name'},price:1,mcode:{$substr:['$name',0,3]}}}])

db.movie.aggregate([{$project:{name:1,rating:1,release_date:1,ryear:{$year:'$rdate'}}},{$project:{name:1,rating:1,rdate:1,ryear:1,numy:{$subtract:[{$year:new Date()},'$ryear']}}}])

db.movie.aggregate([{$group:{_id:null,sump:{$sum:'$price'}}}])

db.movie.aggregate([{$group:{_id:null,sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'},count:{$sum:1}}}])

db.movie.aggregate([{$group:{_id:null,sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'}}}])

db.movie.aggregate([{$group:{_id:'$rating',sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'},count:{$sum:1}}}])

{$sort:{_id:-1}}

db.movie.aggregate([{$group:{_id:'$rating',sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'},count:{$sum:1}}},{$sort:{_id:-1}}])

{$limit:2}

db.movie.aggregate([{$group:{_id:'$rating',sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'},count:{$sum:1}}},{$sort:{_id:-1}},{$limit:2}])

db.movie.aggregate([{$group:{_id:'$rating',sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'},count:{$sum:1}}},{$sort:{_id:-1}},{$match:{count:{$gte:3}}}]);

iacsd0324> db.movie.aggregate([{$group:{_id:'$rating',sump:{$sum:'$price'},minp:{$min:'$price'},maxp:{$max:'$price'},count:{$sum:1}}},{$sort:{_id:-1}},{$match:{sump:{$gt:600}}}]);

--unwind--
db.student.aggregate([{$unwind:'$marks'},{$match:{marks:{$gt:90}}}])

db.emp.aggregate([{$unwind:'$company'},{$match:{'company.exp':{$gt:7}}}])



