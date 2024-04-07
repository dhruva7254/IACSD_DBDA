car
---Mongo DB---
db.restaurent.find()
show collection
db.restaurent.findOne()
--to display movie with name='kahani'
db.movie.find({name:'kahani'})
--to display name, rating, price of all movies
db.movie.find({},{name:1,rating:1,price:1})
--to display all movies with price > 200 and < 600
db.movie.find({$and:[{price:{$gt:200}},{price:{$lt:600}}]})
db.movie.find({price:{$gt:200,$lt:600}})
--to find all movies with price = either 200 or 310 or 500
db.movie.find({price:{$in:[200,310,500]}})
--to find all movies with price not = either 200 or 310 or 500
db.movie.find({price:{$nin:[200,310,500]}})
--to find all movies with ticket_num>150 and price>200
db.movie.find({$and:[{ticket_no:{$gt:150}},{price:{$gt:200}}]})
db.movie.find({ticket_no:{$gt:150},price:{$gt:200}})
--to find movies with rating is NULL
db.movie.find({rating:null})
db.movie.find({rating:{$in:[null],$exists:true}})
--to find all documents with no rating key in it
db.movie.find({rating:{$exists:false}})
--to find all movies with actor amithabh acted in
db.movie.find({actor:'Amitabh'})
--to find all movies with actor Amitabh acted, and his name is at o th position
db.movie.find({'actor.0':'Amitabh'})
--to find all movies with length of actor array is 3
db.movie.find({actor:{$size:3}})
--to find all movies with rating divisible by 7
db.movie.find({rating:{$mod:[7,0]}})
--to find all movies with even rating
db.movie.find({rating:{$mod:[2,0]}})
--to find all movies with odd rating
db.movie.find({rating:{$mod:[2,1]}})

db.movie.find({rating:{$type:'string'}})
db.movie.insert({rating:{$type:'string'}})

db.movie.find({'expr'

db.restaurent.findOne()
--find all restaurents where longitude > 40
db.restaurent.find({'address.coord.1':{$gt:40}})
db.restaurent.find({'address.coord.1':{$gt:40}}).count()
db.restaurent.find().count()
db.restaurent.find().skip(20000).limit(2).sort({name:-1})

db.movie.find({rating:{$gt:4}}).limit(3)
db.movie.find({rating:{$gt:4}}).limit(3).skip(2).sort(2).

db.restaurent.find({grades:{$elemMatch:{grade:'A',score:38}}})

iacsd0324> db.restaurent.find({grades:{$elemMatch:{grade:'C',score:38}}})

db.movie.find({actor:/^[Aa]mitabh/})
db.movie.find({actor:{$regex:'[Aa]mitabh'}})
db.movie.find({name:/t$/})
db.movie.find({name:/^[0-9]/})
db.movie.find({name:/^\d/})
-- \d 
db.movie.find({name:/^p.*t|.*i$/})

-----------------
 {
    _id: ObjectId('660c3060a3fb5118334586aa'),
    address: {
      building: '522',
      coord: [ -73.95171, 40.767461 ],
      street: 'East   74 Street',
      zipcode: '10021'
    },
    borough: 'Manhattan',
    cuisine: 'American',
    grades: [
      {
        date: ISODate('2014-09-02T00:00:00.000Z'),
        grade: 'A',
        score: 12
      },
      {
        date: ISODate('2013-12-19T00:00:00.000Z'),
        grade: 'B',
        score: 16
      },
      {
        date: ISODate('2013-05-28T00:00:00.000Z'),
        grade: 'A',
        score: 9
      },
      {
        date: ISODate('2012-12-07T00:00:00.000Z'),
        grade: 'A',
        score: 13
      },
      {
        date: ISODate('2012-03-29T00:00:00.000Z'),
        grade: 'A',
        score: 11
      }
    ],
    name: 'Glorious Food',
    restaurant_id: '40361521'
  }
-----------

-------------
--Assignment 1
--
db.restaurent.find()
db.restaurent.find({},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({},{restaurant_id:1,name:1,borough:1,cuisine:1,_id:0})
db.restaurent.find({},{restaurant_id:1,name:1,borough:1,'address.zipcode':1,_id:0})
db.restaurent.find({borough:'Bronx'})
db.restaurent.find({borough:'Bronx'}).limit(5)
db.restaurent.find({borough:'Bronx'}).limit(5).skip(5)
db.restaurent.find({'grades.score':{$gt:90}})
db.restaurent.find({'grades.score':{$gt:80,$lt:100}})
db.restaurent.find({'grades.1.score':{$gt:80,$lt:100}},{'grades.score':{$gt:80,$lt:100}})
db.restaurent.find({$and:[{'grades.score':{$gt:80}},{'grades.score':{$lt:100}}]}
db.restaurent.find({$and:($and:[{'grades.0.score':{$gt:80,$lt:100}},{'grades.1.score':{$gt:80,$lt:100}}],{'grades.2.score':{$gt:80,$lt:100}})})
db.restaurent.find({$and:[{'grades.0.score':{$gt:80,$lt:100}},{'grades.1.score':{$gt:80,$lt:100}},{'grades.2.score':{$gt:80,$lt:100}}]})
db.restaurent.find({'address.coord.1':{$gt:40}})
db.restaurent.find({'grades.0.score':{$gt:80,$lt:100}})
db.restaurent.find({'address.coord.1':{$lt:95.754168}})
--db.restaurent.find({borough:$nin['American']},{'grades.score':{$gt:70}},{'address.coord.1':{$lt:-65.754168}})
iacsd0324> db.restaurent.find({cuisine:{$nin:['American']},'grades.score':{$gt:70},'address.coord.0':{$lt:-65.754168}})
db.restaurent.find({cuisine:{$nin:['American']},'grades.score':{$gt:70},'address.coord.1':{$lt:65.754168}})
db.restaurent.find({cuisine:{$nin:['American']},'grades.grade':'A',borough:{$nin:['Brooklyn']}}).sort({cuisine:-1})
db.restaurent.find({},{restaurant_id:1,name:1,borough:1,cuisine:1},{name:/^Wil.*/})
db.restaurent.find({name:/^Wil.*/},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({name:/.*ces$/},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({name:/.*Reg.*/},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({borough:'Bronx',cuisine:{$in:['American','Chinese']}})
db.restaurent.find({borough:{$in:['Staten Island','Queens','Bronx','Brooklyn']}},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({borough:{$nin:['Staten Island','Queens','Bronx','Brooklyn']}},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({'grades.score':{$lte:10}},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({cuisine:{$nin:['American','Chinese']},name:/^Wil.*/},{restaurant_id:1,name:1,borough:1,cuisine:1})
db.restaurent.find({'grades.1.grade':'A','grades.1.score':9,'grades.1.date': ISODate('2014-08-11T00:00:00.000Z')},{restaurant_id:1,name:1,grades:1})
db.restaurent.find({'grades.grade':'A','grades.score':11,'grades.1.date': ISODate('2014-08-11T00:00:00.000Z')},{restaurant_id:1,name:1,grades:1})
db.restaurent.find({'address.coord.1':{$gt:42,$lt:52}},{restaurant_id:1,name:1,address:1})
db.restaurent.find({}).sort({name:1})
db.restaurent.find({}).sort({name:-1})
db.restaurent.find({}).sort({cuisine:1},{borough:-1})
db.restaurent.find({'address.street':{$in:[null],$exists:true}})
db.restaurent.find({'address.street':null})
db.restaurent.find({})
db.restaurent.find({'address.coord':{$type:'double'}})
db.restaurent.find({'grades.score':{$mod:[7,0]}},{restaurant_id:1,name:1,grades:1})
db.restaurent.find({name:/.*mon.*/},{name:1,borough:1,'address.coord':1,cuisine:1})
db.restaurent.find({name:/^Mad.*/},{name:1,borough:1,'address.coord':1,cuisine:1})
db.restaurent.find({grades:{$elemMatch:{grade:'A',score:11,date:ISODate('2014-08-11T00:00:00.000Z')}}},{restaurant_id:1,name:1,grades:1})





















-------------------
update in mondo db
to increase the price by 10%
db.movie.updateMany({name:/^p/},{$mul:{price:1.10}});

upsert means update if exists or insert it
 















