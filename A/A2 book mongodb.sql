car
db.book.find({authors:'Faisal Abid'},{title:1,authors:1,categories:1})

db.book.find({'categories.0':'Internet'})

db.book.updateMany({pageCount:{$gt:500},{$eq:{ryear:{$year:'publishedDate'}}:2009}},{$set:{status:'undergoing change'}})

db.book.updateMany({$expr:{$eq:[{$year:'$publishedDate'},2009]},pageCount:{$gt:500}},{$set:{status:'undergoing change'}})

db.book.find({status:1})

iacsd0324> db.book.find({pageCount:{$gt:500},status:'undergoing change'},{status:1})

db.book.find({status:'undergoing change'},{status:1})

db.book.find({longDescription:'highlighting'},{title:1})



highlighting



db.book.find({longDescription:/highlighting/,/depth/},{title:1}).count()

db.book.find({$expr:{$eq:[{$year:'$publishedDate'},2009]}},{publishedDate:1})


db.book.find({longDescription:/highlighting and depth/},{title:1}).count()

db.book.find({$pageCount:{$in:[500,556,670]}},{title:1})

iacsd0324> db.book.find({pageCount:{$in:[500,556,670]}},{title:1,pageCount:1})


db.book.updateMany({$and:[{pageCount:{$gt:200}},{pageCount:{$lt:500}}]},{categories:{$push:{$each:['kindle']}}})














--------------------------
yearj:{$year:'$hiredate'}
ryear:{$year:'$rdate'}

db.book.find({$year: ISODate("1998-11-07T00:00:00Z")})

ISODate('2011-03-10T00:00:00.000Z')

{ $year: ISODate("1998-11-07T00:00:00Z") }
publishedDate

{ $year: ISODate("1998-11-07T00:00:00Z") }

db.book.find({ $year: 'publishedDate' })

db.book.update({ $year: ISODate('2011-03-10T00:00:00.000Z') })


db.sales.aggregate(
   [
     {
       $project:
         {
           year: { $year: "$date" },
           month: { $month: "$date" },
           day: { $dayOfMonth: "$date" },
           hour: { $hour: "$date" },
           minutes: { $minute: "$date" },
           seconds: { $second: "$date" },
           milliseconds: { $millisecond: "$date" },
           dayOfYear: { $dayOfYear: "$date" },
           dayOfWeek: { $dayOfWeek: "$date" },
           week: { $week: "$date" }
         }
     }
   ]
)



db.sales.aggregate([{$project:{year: { $year: "$publishedDate" }}}])

db.book.aggregate([{$project:{year: { $year: "$publishedDate" }}}])

db.movie.aggregate([{$project:{name:1,rating:1,release_date:1,ryear:{$year:'$rdate'}}},{$project:{name:1,rating:1,rdate:1,ryear:1,numy:{$subtract:[{$year:new Date()},'$ryear']}}}]);

db.book.aggregate([{$project:{ryear:{$year:'$publishedDate'}}},{$project:{ryear:1,numy:{$eq:[{'$ryear',2009]}}}])

iacsd0324> db.movie.aggregate([{ $group: { _id: '$rating', sump: { $sum: '$price' }, minp: { $min: '$price' }, maxp: { $max: '$price' }, count: { $sum: 1 } } },{$sort:{_id:-1}},{$limit:2}]);

db.movie.aggregate([{$group:{_id:'$rating',ryear:{$year:'$publishedDate'},pageCount:{$gt:500}}},{$set:{status:'undergoing change'}}]);

db.book.aggregate([{$project:{name:1,numz:{$gt:['$pageCount',500]},numy:{$eq:[{ryear:{$year:'$publishedDate'}},2009]},numq:{$set:{status:'undergoing change'}}}}])

db.book.aggregate([{$project:{name:1,numz:{$gt:['$pageCount',500]},numy:{$eq:[{ryear:{$year:'$publishedDate'}},2009]}}}])

db.book.updateMany({$expr:{$eq:[{$year:'$publishedDate'},2009]},pageCount:{$gt:500}},{$set:{status:'undergoing change'}})






--------------------------------------------------------------------










-------------------------------------------------------------------------------
iacsd0324> db.book.aggregate([{$project:{year: { $year: "$publishedDate" }}}])
[
  { _id: 2, year: 2011 },  { _id: 3, year: 2011 },
  { _id: 1, year: 2009 },  { _id: 4, year: 2009 },
  { _id: 6, year: 2008 },  { _id: 5, year: 2010 },
  { _id: 7, year: 2008 },  { _id: 8, year: 2010 },
  { _id: 9, year: 2012 },  { _id: 10, year: 2011 },
  { _id: 13, year: 2009 }, { _id: 11, year: 2008 },
  { _id: 14, year: 1997 }, { _id: 16, year: 2010 },
  { _id: 18, year: 1998 }, { _id: 15, year: 2008 },
  { _id: 21, year: 2000 }, { _id: 22, year: 2004 },
  { _id: 20, year: 2000 }, { _id: 17, year: 2011 }
]
Type "it" for more
------------------------------------------------------------------



