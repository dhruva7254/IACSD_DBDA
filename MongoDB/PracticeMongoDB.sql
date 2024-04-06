db.createCollection('employee')
db.employee.insertMany({empno:222, ename:"Rajesh Kumar", sal:45000.00, dept:{deptno:15, dname:"Sales", dloc:"Delhi"}, desg:"Senior Programmer", mgr:{name:"Anita", num:222}, project:[{name:"Project-3", Hrs:6}, {name:"Project-4", Hrs:5}]})

{empno:111,ename:"Deepali Vaidya",sal:40000.00,
dept:{deptno:12,dname:,"Hr",dloc:"Mumbai"},Desg:"Analyst",
mgr:{name:"Satish",num:111},
project:[{name:"Project-1",Hrs:4},{name:"Project-2",Hrs:4}]}


Sure, here are modified entries with varied designations and department names, with some employees having the same department name and designation:

1. `{empno:222, ename:"Rajesh Kumar", sal:45000.00, dept:{deptno:15, dname:"Sales", dloc:"Delhi"}, desg:"Senior Programmer", mgr:{name:"Anita", num:222}, project:[{name:"Project-3", Hrs:6}, {name:"Project-4", Hrs:5}]}`
   
2. `{empno:333, ename:"Sara Patel", sal:38000.00, dept:{deptno:18, dname:"Marketing", dloc:"Bangalore"}, desg:"Clerk", mgr:{name:"Rahul", num:333}, project:[{name:"Project-5", Hrs:3}, {name:"Project-6", Hrs:7}]}`
   
3. `{empno:444, ename:"Amit Singh", sal:50000.00, dept:{deptno:22, dname:"Operations", dloc:"Pune"}, desg:"Senior Analyst", mgr:{name:"Neha", num:444}, project:[{name:"Project-7", Hrs:8}, {name:"Project-8", Hrs:4}]}`
   
4. `{empno:555, ename:"Priya Sharma", sal:42000.00, dept:{deptno:25, dname:"Sales", dloc:"Hyderabad"}, desg:"Clerk", mgr:{name:"Vinay", num:555}, project:[{name:"Project-9", Hrs:5}, {name:"Project-10", Hrs:6}]}`
   
5. `{empno:666, ename:"Gaurav Verma", sal:47000.00, dept:{deptno:28, dname:"Research", dloc:"Chennai"}, desg:"Senior Programmer", mgr:{name:"Shreya", num:666}, project:[{name:"Project-11", Hrs:7}, {name:"Project-12", Hrs:5}]}`
   
6. `{empno:777, ename:"Anjali Gupta", sal:39000.00, dept:{deptno:32, dname:"Sales", dloc:"Kolkata"}, desg:"Clerk", mgr:{name:"Sanjay", num:777}, project:[{name:"Project-13", Hrs:4}, {name:"Project-14", Hrs:6}]}`
   
7. `{empno:888, ename:"Manish Tiwari", sal:48000.00, dept:{deptno:35, dname:"Quality Assurance", dloc:"Jaipur"}, desg:"Senior Analyst", mgr:{name:"Rita", num:888}, project:[{name:"Project-15", Hrs:6}, {name:"Project-16", Hrs:5}]}`
   
8. `{empno:999, ename:"Neha Reddy", sal:43000.00, dept:{deptno:38, dname:"Purchase", dloc:"Ahmedabad"}, desg:"Clerk", mgr:{name:"Ravi", num:999}, project:[{name:"Project-17", Hrs:5}, {name:"Project-18", Hrs:7}]}`
   
9. `{empno:1010, ename:"Rahul Sharma", sal:46000.00, dept:{deptno:42, dname:"Sales", dloc:"Lucknow"}, desg:"Clerk", mgr:{name:"Sonia", num:1010}, project:[{name:"Project-19", Hrs:7}, {name:"Project-20", Hrs:4}]}`
   
10. `{empno:1111, ename:"Pooja Mehta", sal:40000.00, dept:{deptno:45, dname:"Marketing", dloc:"Nagpur"}, desg:"Senior Programmer", mgr:{name:"Kunal", num:1111}, project:[{name:"Project-21", Hrs:4}, {name:"Project-22", Hrs:6}]}`
   
These entries reflect a mix of different designations such as Senior Programmer, Clerk, and Senior Analyst, and various department names such as Sales, Purchase, and Marketing. Additionally, some employees have the same department name and designation to add diversity to the dataset.


db.employee.insertMany([{empno:222, 
                        ename:"Rajesh Kumar", 
                        sal:45000.00, 
                        dept:{deptno:15, dname:"Sales", dloc:"Delhi"}, 
                        desg:"Senior Programmer", 
                        mgr:{name:"Anita", num:222}, 
                        project:[{name:"Project-3", Hrs:6}, {name:"Project-4", Hrs:5}]},
                       {empno:333, 
                        ename:"Sara Patel", 
                        sal:38000.00, 
                        dept:{deptno:18, dname:"Marketing", dloc:"Bangalore"}, 
                        desg:"Clerk", 
                        mgr:{name:"Rahul", num:333}, 
                        project:[{name:"Project-5", Hrs:3}, {name:"Project-6", Hrs:7}]},
                       {empno:444, 
                        ename:"Amit Singh", 
                        sal:50000.00, 
                        dept:{deptno:22, dname:"Operations", dloc:"Pune"}, 
                        desg:"Senior Analyst", 
                        mgr:{name:"Neha", num:444}, 
                        project:[{name:"Project-7", Hrs:8}, {name:"Project-8", Hrs:4}]},
                       {empno:555, 
                        ename:"Priya Sharma", 
                        sal:42000.00, 
                        dept:{deptno:25, dname:"Sales", dloc:"Hyderabad"}, 
                        desg:"Clerk", 
                        mgr:{name:"Vinay", num:555}, 
                        project:[{name:"Project-9", Hrs:5}, {name:"Project-10", Hrs:6}]},
                       {empno:666, 
                        ename:"Gaurav Verma", 
                        sal:47000.00, 
                        dept:{deptno:28, dname:"Research", dloc:"Chennai"}, 
                        desg:"Senior Programmer", 
                        mgr:{name:"Shreya", num:666}, 
                        project:[{name:"Project-11", Hrs:7}, {name:"Project-12", Hrs:5}]}      
                        ])

{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66114c1eaa8b13855b9f990a'),
    '1': ObjectId('66114c1eaa8b13855b9f990b'),
    '2': ObjectId('66114c1eaa8b13855b9f990c'),
    '3': ObjectId('66114c1eaa8b13855b9f990d'),
    '4': ObjectId('66114c1eaa8b13855b9f990e')
  }
}


emp_data> db.employee.find()
[
  {
    _id: ObjectId('66114c1eaa8b13855b9f990a'),
    empno: 222,
    ename: 'Rajesh Kumar',
    sal: 45000,
    dept: { deptno: 15, dname: 'Sales', dloc: 'Delhi' },
    desg: 'Senior Programmer',
    mgr: { name: 'Anita', num: 222 },
    project: [ { name: 'Project-3', Hrs: 6 }, { name: 'Project-4', Hrs: 5 } ]
  },
  {
    _id: ObjectId('66114c1eaa8b13855b9f990b'),
    empno: 333,
    ename: 'Sara Patel',
    sal: 38000,
    dept: { deptno: 18, dname: 'Marketing', dloc: 'Bangalore' },
    desg: 'Clerk',
    mgr: { name: 'Rahul', num: 333 },
    project: [ { name: 'Project-5', Hrs: 3 }, { name: 'Project-6', Hrs: 7 } ]
  },
  {
    _id: ObjectId('66114c1eaa8b13855b9f990c'),
    empno: 444,
    ename: 'Amit Singh',
    sal: 50000,
    dept: { deptno: 22, dname: 'Operations', dloc: 'Pune' },
    desg: 'Senior Analyst',
    mgr: { name: 'Neha', num: 444 },
    project: [ { name: 'Project-7', Hrs: 8 }, { name: 'Project-8', Hrs: 4 } ]
  },
  {
    _id: ObjectId('66114c1eaa8b13855b9f990d'),
    empno: 555,
    ename: 'Priya Sharma',
    sal: 42000,
    dept: { deptno: 25, dname: 'Sales', dloc: 'Hyderabad' },
    desg: 'Clerk',
    mgr: { name: 'Vinay', num: 555 },
    project: [ { name: 'Project-9', Hrs: 5 }, { name: 'Project-10', Hrs: 6 } ]
  },
  {
    _id: ObjectId('66114c1eaa8b13855b9f990e'),
    empno: 666,
    ename: 'Gaurav Verma',
    sal: 47000,
    dept: { deptno: 28, dname: 'Research', dloc: 'Chennai' },
    desg: 'Senior Programmer',
    mgr: { name: 'Shreya', num: 666 },
    project: [ { name: 'Project-11', Hrs: 7 }, { name: 'Project-12', Hrs: 5 } ]
  }
]
emp_data>


db.employee.updateMany({desg:'Clerk'},{$set:{desg:'AO'}})

db.employee.updateMany({desg:'Senior Analyst'},{$set:{}})

db.employee.updateMany({"project":{$elemMatch:{"name":"Project-1"}},Desg:"Analyst"},{$set:{project:{name:"Project_1"Hrs:5}}})

db.employee.updateOne({project:{$elemMatch:{'name':'Project-7'}},desg:'Senior Analyst'},{$set:{name:'Project-1', Hrs:5}})

db.employee.update({desg:'Senior Analyst'},{$push:{project:{$each:[{name:"project-3",Hrs:2},{name:'project-4',Hrs:2}]}}},{multi:true})

db.employee.update({desg:'Senior Analyst'},{$push:{project:{$each:[{name:'Project-1',Hrs:5}]}}})



















































