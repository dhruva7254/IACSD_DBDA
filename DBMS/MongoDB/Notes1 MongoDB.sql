operators in mogodb

$lt, $gt, $gte, $lte, $in, $nin, $mod, $size, $type, 
$exists, $elemMatch, $or, $and,$expr,$year,$month

----to find all movies withe name='3 idiot'
db.movie.find({name:'3 idiots'},{name:1,price:1,actor:1})

----to find all movies withe rating 3
db.movie.find({rating:3})

----to find all movies with rating =3 and price=200
db.movie.find({rating:3,price:200},{actor:0,_id:0})

---to find all movies with price>200
db.movie.find({price:{$gt:200}})

---to find all movies with price<=200
db.movie.find({price:{$lte:200}})

---to find all movies with price>200 and rating<4
price:{$gt:200}
rating:{$lt:4}
$and:[{price:{$gt:200}},{rating:{$lt:4}}]
db.movie.find({price:{$gt:200},rating:{$lt:4}})
db.movie.find({$and:[{price:{$gt:200}},{rating:{$lt:4}}]})

---to find all movies with price>200 or rating<4
price:{$gt:200}
rating:{$lt:4}
$or:[{price:{$gt:200}},{rating:{$lt:4}}]
db.movie.find({$or:[{price:{$gt:200}},{rating:{$lt:4}}]})

---to display all movies with price >200 and <400
db.movie.find({price:{$gt:200,$lt:400}})

---to display all the movies with rating is either 3 or 4 or 5
db.movie.find({rating:{$in:[3,4,5]}})

---to display all the movies with rating is not  3 or 4 or 5
db.movie.find({rating:{$nin:[3,4,5]}})

----to display movie with name='kahani'
db.movie.find({name:'Kahani'})

----to display name, rating, price of all movies
db.movie.find({},{name:1,rating:1,price:1}

----to display all movies with price>200 and < 600.
db.movie.find({$and:[{price:{$gt:200}},{price:{$lt:600}}]}
db.movie.find({price:{$gt:200,$lt:600}})

----to find all movies with price = either 200 or 
310 or 500
db.movie.find({price:{$in:[200,310,500]}})

----to find all movies with price not = either 200 or 
310 or 500
db.movie.find({price:{$nin:[200,310,500]}})

----to find all movies with ticket_num>150 
and price>200
db.movie.find({ticket_num:{$gt:150},price:{$gt:200}})

----to find movies with rating is null
db.movie.find({rating:null})  --- it will show you 
all movies with rating key and value null, also 
display movieswhich do not have rating key

db.movie.find({rating:{$in:[null],$exists:true}})

-----to find all documents with no rating key in it
db.movie.find({rating:{$exists:false}})

-----to find all movies with actor Amithabh acted in it
db.movie.find({actor:'Amitabh'})

---to find all movies with actor Amithabh acted, 
and his name is at 0 th position.
db.movie.find({'actor.0':'Amitabh'})

---to find all movies with length of actor array is =3
db.movie.find({actor:{$size:3}})

----to find all movies with rating divisible by 7
db.movie.find({rating:{$mod:[7,0]}})

----to find all movies with even rating 
db.movie.find({rating:{$mod:[2,0]}})

----to find all movies with odd rating 
db.movie.find({rating:{$mod:[2,1]}})

----to find all movies with rating value is not a string
db.movie.find({rating:{$not:{$type:'string'}}})

----find all restaurent with longitude > 40

db.restaurent.find({'address.coord.1':{$gt:40}})

---to find first 3 movies with rating > 4
---to display few records use limit function
db.movie.find({rating:{$gt:4}}).limit(3)

---to find first 4 and 5 th  movies with rating > 4
---to display few records use limit function, to skip first few documents use skip function
---sort will sort the data on given key if the value is 1 , then it is 
----in ascending order, -1 will arrange it in descending order

db.movie.find({rating:{$gt:4}}).limit(2).skip(3).sort({rating:-1})

----display all movies in sorted order of rating in 
descending order , and name
db.movie.find({rating:{$gt:4}}).sort({rating:-1,name:1})

--- ----to find all restaurents with grade 'C' 
---------and score=38, anywhere in the grades array
db.restaurent.find({'grades.score':38,'grades.grade':'A'})

----to find all restaurents with grade 'C' 
---------and score=38, in the same element of array
db.restaurent.find({grades:{$elemMatch:{grade:'C',score:38}}})

-----to display all movies in which amitabh acted
db.movie.find({actor:/^[Aa]mitabh/})

db.movie.find({actor:{$regex:'[Aa]mitabh'})

---to display all movies ending with t

db.movie.find({name:/t$/})

---to display all movies starting with a digit

db.movie.find({name:/^[0-9]/})

db.movie.find({name:/^\d/})


\d ---matches with any digit character
\D ---- matches with any non digit character
\w-----matches with one word character [0-9a-zA-Z_]
\W----matches with one non word character [^0-9a-zA-Z_]

\s-----matches with one space
\S----matches with one non space character

---display all movies with name starts with p and ends with t or 
ends with i
db.movie.find({name:/^p.*t$|i$/})

--------------------------------------------------------------------

----------------------------day2-------------------------

------to update data in mongodb

update: this function is used to to update one or more documents
updateOne : this is used to update only one matching document
updateMany:this is used to update all matching documnet

updateMany({query},{update action})
updateOne({query},{update action})
update({query},
      {update action},
	  {multi:true,upsert:true,arrayFilters:[]})

what update operation
1. add new key-value pair--- $set, $min, $max
2. delete existing key------ $unset
3. overwrite the value of the key --- $set,$min, $max
4. increase or decrease the value of key --- $inc, $mul 
5. to assign current date ---$currentDate
6. to rename the existing key ---$rename

If there is a array of values
1. add a new value array  $push---> $each, $position
2. delete a value from array  $pop,$pull
3. overwrrite 



-----to increase the  price  by 200
-----in $inc if the value is +ve then it will add, but
-----if it is -ve then it will subtrcat
db.movie.updateMany({price:{$nin:[null],$exists:true}},{$inc:{price:-200}});

 
----and overwrite ticke_no value by 100
db.movie.updateMany({name:'padmavat'},{$set:{ticket_num:100}})

----to increase the  price  by 200 
----and overwrite ticke_no value by 100
db.movie.updateMany({name:/^p/},{$inc:{price:200},
         $set:{ticket_no:100},
		 $currentDate:{'lastmodified':true}});
		 
-----to remove ticket_num key from all 
------movies with name starts with p
db.movie.updateMany({name:/^p/},{$unset:{ticket_num:''}})

----to increase the  price  by 10%
-----in $inc if the value is +ve then it will add, but
-----if it is -ve then it will subtrcat
db.movie.updateMany({name:/^p/}},
{$mul:{price:1.10}});

600
-----to update price to 450, if the current price is < 450
---if any price < 450, then overwrite, otherwise kep it as it is
db.movie.update({},{$max:{price:450}},{multi:true})

4
-----to update rating to 3, if the current rating >3
$min means, if any rating is >3, then replace it with 3
db.movie.update({name:/^p/},{$min:{rating:3}},{multi:true})

----- to change the lastmodified ky to lastchange
$rename operator will cj\hange key lastmodified to lastchange
db.movie.updateMany({name:/^p/},
{$rename:{'lastmodified':'lastchange'}})



------upsert the following record
upsert means update is exists, otherwise insert

db.movie.update({name:'kashmir files'},
{$set:{price:300},$inc:{rating:3}},
{multi:true,upsert:true})



----- add new actor in 'kashmir files'
db.movie.find({name:'kashmir files'},{$push:{actor:'anupam kher'}})

------add anupam kher at the end in actor array 
-----of kashmir files
db.movie.update({name:'kashmir files'},
 {$push:{actor:'anupam kher'})
 
 
 ------add pallavi joshi and chinamay 
---- at the end in actor array of kashmir files
db.movie.update({name:'kashmir files'},
 {$push:{actor:{$each:['pallavi joshi','chinamay']}})
 
 
 ------add xxxx and zzzzzz at the oth index position in actor array 
 ----of kashmir files
db.movie.update({name:'kashmir files'},
 {$push:{actor:{$each:['xxxx','zzzzzz'],$position:0}})


 ------add ppppp at the 3rd index position in actor array 
 ----of kashmir files
db.movie.update({name:'kashmir files'},
 {$push:{actor:{$each:['ppppp'],$position:3}})
 
----add 'yyyy' at 2 nd index position in actor array 
of file kashmir files
 db.movie.update({name:'kashmir files'},
 {$push:{actor:{$each:['yyyy'],$position:2}}})
 
-----to delete value from actor array from the end
{$pop:{actor:1}  ---$pop will delete last value from actor array
db.movie.update({name:'kashmir files'},
 {$pop:{actor:1}})
 
 
 -----to delete value from actor array from the end
{$pop:{actor:1}  ---$pop will delete last value from actor array
db.movie.update({name:'kashmir files'},
 {$pop:{actor:-1}})

------------------------------------------------------------------------

---------------------------------day3---------------------------

----Aggregate is advance filter function

$group ---> it provides all aggregate functions ($sum,$avg,$min,$max)
$project--->will help you to generate derived columns and display only 
    few kesys
$match----> this filter helps to select few documents
        based on condition, all conditions we used in find can be 
	    used in $match
$sort---> sort the data in ascending or descending order
$limit----> will select few documents
$skip---> will skip few documents
$unwind---> to unwind the arrays

------find 3rd and 4 th and  5th lowest rating arranged on name
db.movie.aggreagate([
{$sort:{rating:1}},
{$skip:2},
{$limit:3},
{$sort:{name:1}}
])


------find name,rating, price of 3rd and 4 th and  5th 
-----lowest rating arranged on name
db.movie.aggreagate([
{$sort:{rating:1}},
{$skip:2},
{$limit:3},
{$sort:{name:1}},
{$project:{name:1,rating:1,price:1,_id:0}}
])

------find name,rating, price, 
and addition of rating and price of 3rd and 4 th and  5th 
-----lowest rating arranged on name
db.movie.aggregate([
{$sort:{rating:1}},
{$skip:2},
{$limit:3},
{$sort:{name:1}},
{$project:{name:1,rating:1,price:1,
addition:{$add:['$rating','$price']},_id:0}}
])

----$project---
 operators on number
$add:[expr1,[expr2,exp3,…….]]]
$subtract : [expr1,expr2]       ---- expr1-expr2
$multiply:[expr1,[expr2,exp3,…….]]
$divide:[ expr1,expr2]
$mod: [expr1,expr2]
$round:[value, 2]

{$ifNull:['$price',0]}
 
 operators on String
$toUpper-----convert to upper case
$toLower ------convert to lower case
$concat:[str,str2,str3]
$substr:[str,start,end]

operators  on date
$year
$month
$day
$hour
$minute

---display name,actor,rating,price,ticket_no, 
also display sum of ticket_no and price; 

db.movie.aggregate([
{$project:{name:1,price:1,ticket_no:1,
rating:1,sump:{$add:[{$ifNull:['$price',0]},
{$ifNull:['$ticket_no',0]}]}}}])

-----display name in capital, price, ticket_no, and 
difference between price and ticketnum
if price and ticket no are not null

price:{$nin:[null],exists:true}
ticket_no:{$nin:[null],exists:true}

db.movie.aggregate([
{$match:{price:{$nin:[null],$exists:true},
ticket_no:{$nin:[null],$exists:true}}},
{$project:{name:{$toUpper:'$name'},price:1,
ticket_no:1,
differ:{$subtract:['$price','$ticket_no']}}}
])


-----find discountprice for all movies with rating >=3, 
-----if the discount is 10% 
price=1*price-0.10*price
$subtract:['$price',{$multiply:['$price',0.10]}]

price(1-0.10)
price*0.90

$multiply:['$price',0.90]
$subtract:['$price',{$multiply:['$price',0.10]}]

db.movie.aggregate([
{$match:{rating:{$gte:3}}},
{$project:{name:1,price:1,rating:1,
discount1:{$multiply:['$price',0.90]},
discount2:{$subtract:['$price',
                     {$multiply:['$price',0.10]}]}
}}
])

-----display name in upper case and display 
code for movie, code is first 3 aplphabets of movie
db.movie.aggregate([
{$project:{name:{$toUpper:'$name'},price:1,
mcode:{$substr:['$name',0,3]}}}
])

------display all movies and display how many 
years ago they are releases
db.movie.aggregate([
{$project:{name:1,rating:1,
release_date:1,ryear:{$year:'$rdate'}}},
{$project:{name:1,rating:1,rdate:1,ryear:1,
numy:{$subtract:[{$year:new Date()},'$ryear']}}}
])

----display sum of price, max price, min price
db.movie.aggregate([
  {$group:{_id:null,sump:{$sum:'$price'},
  minp:{$min:'$price'},maxp:{$max:'$price'},
  count:{$sum:1}}}
])

----display sum of price, max price, min price and count 
---ratingwise
db.movie.aggregate([
  {$group:{_id:'$rating',sump:{$sum:'$price'},
  minp:{$min:'$price'},maxp:{$max:'$price'},
  count:{$sum:1},avgp:{$avg:'$price'}}}
])

db.movie.aggregate([
{ $group: { _id: '$rating', 
sump: { $sum: '$price' }, 
minp: { $min: '$price' }, maxp: { $max: '$price' },
 count: { $sum: 1 } } },{$sort:{_id:-1}},{$limit:2}]);
 
------display all rating in which more than 3 movies 
------are there
db.movie.aggregate([
{ $group: { _id: '$rating', 
sump: { $sum: '$price' }, 
minp: { $min: '$price' }, maxp: { $max: '$price' },
 count: { $sum: 1 } } },
 {$sort:{_id:-1}},{$match:{count:{$gte:3}}}]);



-------find sum of all prices rating wise but display
 only if the sum is >600
 
 
db.movie.aggregate([
{$group:{_id:'$rating',sump:{$sum:'$price'}}},
{$match:{sump:{$gt:600}}}
])



---display name, address,email for all student 
----as name followed  by ., followed by 
first 3 letters of name,followed by @mycompany.com
ashish.ash@mycompany.com

db.student.aggregate([
{$project:{name:1,address:1,
email:{$concat:['$name','.',
      {$substr:['$name',0,3]},'@mycompany.com']}}}
])

----find experience of employee


db.employee.aggregate([
{$project:{name:1,hiredate:1,yearj:{$year:'$hiredate'}}},
{$project:{name:1,hiredate:1,yearj:1,
experience:{$subtract:[{$year:new Date()},'$yearj']}}}])

---find 3 movies which ticket prices are hisghest 
arrange it on name
db.movie.aggregate([
 {$sort:{price:-1}},
 {$limit:3},
 {$sort:{name:1}}
 
])






---find 3 rd 4th and 5 th highest rating's, 
sum and average of prices for each rating


 db.movie.aggregate([
 { $group:{_id:'$rating',sump:{$sum:'$price'},
 avgp:{$avg:'$price'}}},
 {$sort:{_id:-1}},
 {$skip:2},
 {$limit:3}]);
 

 
