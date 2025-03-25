import pymongo
conn=pymongo.MongoClient("mongodb://localhost:27017/")
db=conn["mydatabase"]
col=db["student"]
value=[{"Name":"def","Age":"18","Ph":"1234567891","_id":1},
       {"Name":"ghi","Ph":"1234567892"},
       {"Name":"jkl","Age":"18"}]
col.insert_many(value)
a=col.find({},{"Name":1,"_id":1})
for i in a:
    print(i)
