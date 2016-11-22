from pymongo import MongoClient
from bson.objectid import ObjectId
import random
import datetime
client = MongoClient()

def random_word_requester():
    '''
    This function should return a random word and its definition and also
    log in the MongoDB database the timestamp that it was accessed.
    '''
    #Fetch all records
    list_posts = []
    db = client.csci2963.definitions
    for post in db.find():
        list_posts.append(post)

    #Select one randomly
    rand_choice = random.choice(list_posts)
    ret = rand_choice['word']

    #Add date
    if(not ("dates" in rand_choice.keys())):
	rand_choice["dates"] = [ datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") ]
    else:
	rand_choice["dates"].append( datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") )

    print rand_choice["dates"]

    #Update
    db.update ( {"_id" : ObjectId(rand_choice['_id']) } , { "dates" : rand_choice["dates"] } )

    #Return
    return ret

if __name__ == '__main__':
    print random_word_requester()
