from pymongo import MongoClient
from bson.objectid import ObjectId
client = MongoClient()

if __name__ == '__main__':

    #Define the database
    db = client.csci2963.definitions

    #Fetch all records
    i = 0
    for post in db.find(): 
        i = i + 1
    print "Num records = " + str(i) + " = " + str(db.count())
    print ""

    #Fetch one record
    print "Fetch one:"
    print db.find_one()
    print ""

    #Find a record
    print "Find a record:"
    print db.find_one({"word": "virus"})
    print ""

    #Find by id
    print "Find by id"
    print db.find_one({"_id":ObjectId("56fe9e22bad6b23cde07b8b8")})
    print ""
    
    #Insert a post
    print "Insert a post:"
    post = {"word": "Applesauce", "Definition": "Opps, I dropped the forbidden fruit"}
    post_id = db.insert_one(post).inserted_id
    
    #Verification
    print "\nVerification"
    print db.find_one({"word": "Applesauce"})
    print ""
