def Neighbor(aOld, bOld):
    a = sorted(aOld)
    b = sorted(bOld)
    i = 0
    for k in range(len(a)):
        if a[i] in b:
            b.remove(a[i])
            a.remove(a[i])
        else:
            i += 1
    i = 0
    for k in range(len(b)):
        if b[i] in a:
            a.remove(b[i])
            b.remove(b[i])
        else:
            i += 1

    #If they are neighbors, return true
    return (len(a) < 2) and (len(b) < 2)

#Return a list of neighbors
def getNeighbors(start, lst):
    ret = []
    for node_ in lst:
        if Neighbor(start, node_):
            ret.append(node_)
    return ret

#Construct the graph
def makeGraph(lst, f):
    for start_ in lst:
        print "Node = |" + start_ +"|"
        tmp = getNeighbors(start_, lst)
        for end_ in tmp :
            f.write(start_ + " " + end_ + "\n")

#If main, start
if __name__ == "__main__":
    
    #Read in the file
    with open("words.dat") as f:
        content = (''.join(f.readlines())).split('\n')[:-1]

    #Make the graph
    fil = open("OutFile.plist", 'w')
    makeGraph(content, fil)
    fil.close()
