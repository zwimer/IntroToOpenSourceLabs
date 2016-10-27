#include <iostream>
#include <stdlib.h>
#include <stdio.h>
#include <sstream>
#include <fstream>
#include <vector>
#include <list>
#include <map>
#include <set>


//For clarity
using namespace::std;
typedef unsigned int uint;

//A node
class Node {
public :
    
    //Constructor
    Node(string v) : val(v) {}
    
    //Representation
    string val;
    vector<Node*> edges;
};

//Find the shortest path
int shortestPath(Node* start, Node* end, vector<Node*>& path) {
    
    //Make the 'found' map
    map<Node*, vector<Node*> > found;
    found[start] = vector<Node*>();
    found[start].push_back(start);
    
    //A queue of Nodes to be searched
    list<Node*> toSearch;
    
    //For each Node in toSearch
    for(toSearch.push_back(start);
        toSearch.size() && found.find(end) == found.end();
        toSearch.pop_front()){
        
        //For each edge, if it has yet to be visited
        //add it to the queue, and note the path took
        for(auto i : toSearch.front()->edges)
            if (found.find(i) == found.end()) {
                auto tmp = found[toSearch.front()];
                tmp.push_back(i); found[i] = tmp;
                toSearch.push_back(i);
            }
    }
    
	//No path found
	if (found.find(end) == found.end()) return -1;

    //Return the found answer
    path = found[end];
    return (uint)found[end].size();
}

//Print the path
void printPath(const vector<Node*> p) {
    for(uint i = 0; i < (uint)p.size(); i++)
        cout << '\t' << p[i]->val << '\n';
    cout << endl;
}

void Err(string& s, const char * m) {
	cout << s << m << endl;
	exit(EXIT_FAILURE);
}

//Main function
int main(int argc, const char * argv[]) {

	//Local variables
	map<string, Node*> Words;
    vector<Node*> p;
	string s,e;

	//Read file in
	ifstream file("OutFile.plist");
	stringstream inFile;
	inFile << file.rdbuf();
	file.close();

	//Build graph
	while (inFile >> s >> e) {

		//If the node has yet to be made
		if (Words.find(s) == Words.end()) Words[s] = new Node(s);
		if (Words.find(e) == Words.end()) Words[e] = new Node(e);

		//Add the edge
		Words[s]->edges.push_back(Words[e]);
	}

	//Get user input and search
	cout << "Enter words: ";
	while (cin >> s >> e) {

		//Check for bad input
		if (Words.find(s) == Words.end()) Err(s, " doesn't exist");
		if (Words.find(e) == Words.end()) Err(e, " doesn't exist");

		//Search
		int L = shortestPath(Words[s], Words[e], p);

		//If there was an error, note so
		if (L < 0) cout << "There is no path between " 
			<< s << " and " << e << '\n' << endl;

		//Otherwise, print solution
		cout << "Length: " << L << '\n';
		printPath(p);

		//Prompt once more
		cout << "Enter words: ";
	}

    return 0;
}
