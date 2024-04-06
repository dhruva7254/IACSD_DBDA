--car--
db.movie.aggregate([{$sort:{rating:-1}}])

iacsd0324> db.movie.aggregate([{$sort:{rating:-1}},{$skip:2},{$limit:3}])

db.movie.aggregate([{$sort:{rating:-1}},{$skip:2},{$limit:3},{$sort:{name:1}}])

db.movie.aggregate([{$sort:{rating:-1}},{$skip:2},{$limit:3},{$project:{name:1}}])

db.movie.aggregate([{$sort:{rating:1}},{$limit:5},{$project:{rating:1}}])

db.movie.aggregate([{$project:{name:1,rating:1,price:1}},{$sort:{rating:1}},{$skip:2},{$limit:3},{$sort:{name:1}}])

db.movie.updateMany({rating:{$in:['','null']}},{$set:{rating:0}})

db.createCollection("employee")

{emono:111,ename:”Deepali 
Vaidya”,sal:40000.00,dept:{deptno:12,dname:,”Hr”,dloc:”Mumbai},
Desg:”Analyst”,mgr:{name:”Satish”,num:111},project:[{name:”Project1”,Hrs:4},{name:”project- 2”,Hrs:4}]}

db.employee.insert([
    {
        emono:111,
        ename:"Deepali Vaidya",
        sal:40000.00,
        dept:{deptno:12,dname:,"Hr",dloc:"Mumbai"},
        Desg:"Analyst",
        mgr:{name:"Satish",num:111},
        project:[{name:"Project-1",Hrs:4},{name:"project-2",Hrs:4}]
    }
]);

db.book.updateMany({pageCount:{$gt:200,$lt:500}},{$push:{categories:{$each:['kindle']}}})

db.book.updateMany({pageCount:{$gt:500}},{$push:{categories:{$each:['hard bind']}}})

db.book.find({categories:'kindle'}).count()

db.book.find({thumbnailUrl:null}).count()

delimiter //
create procedure one()
begin
declare vname varchar(10);
declare vdname varchar(14);
declare vsal int;
declare vavgsal int;
declare vdeptno int;
declare vstatus varchar(14);
declare vset int default 0;
declare empcur cursor for select e.ename,d.dname,e.deptno,e.sal from emp e inner join dept d on e.deptno=d.deptno;
declare continue  handler for not found set vset=1;
open empcur;
label:loop
fetch empcur into vname,vdname,vdeptno,vsal;
if vset=1 then
leave label;
end if;
select avg(sal) into vavgsal from emp where deptno=vdeptno;
if vsal>vavgsal then
set vstatus='Greater';
elseif vsal<vavgsal then
set vstatus='Lesser';
elseif vsal=vavgsal then
set vstatus='Equal';
else
set vstatus='Error';
end if;
select vname,vdname,vdeptno,vsal,vdeptno,vstatus;
end loop;
close empcur;
end//
delimiter ;

declare exit handler for SQLEXCEPTION select 'error occured';

call one();

db.book.updateMany({},{$set:{comments:{comment:'like the book',date:new Date()}}})

db.book.updateMany({title:/^Fl.*a.*/},{$set:{type:["fiction","moral stories","adventurous"]}})

db.book.find({type:["fiction","moral stories","adventurous"]})

db.book.find({comments:{comment:'like the book',date:new Date()}})

db.book.find({comment:'like the book',date:new Date()})

db.book.update({title:/^h|m.*s.$/},{$push:{authors:{$each:["myauthor"],$position:1}}})

db.book.updateMany({'authors.0':'Gal Shachor'},{$set:{pageCount:'$pageCount'+100}})

db.book.find({authors})

{price:{$nin:[null],$exists:true}}

db.book.updateMany({'authors.0':'Gal Shachor',pageCount:{$nin:[null],$exists:true}},{$inc:{pageCount:100}})

db.book.updateMany({authors:'Magnus Rydin'},{$set:{authors:'Fr'}})

db.book.find({title:1,status:1,pageCount:1,comments:1,})

db.book.find({$or:[{pageCount:{$gt:300,$lt:500}},{title:/^a/},{isbn:/^193/}]},{title:1,status:1,pageCount:1,comments:1,isbn:1})

db.book.updateMany({'authors.2':'Magnus Rydin'},{$set:{authors:'Fr'}})
