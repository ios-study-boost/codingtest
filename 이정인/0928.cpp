#include <iostream>
#include <list>
using namespace std;

int main() {
    int n,k,p=2,cnt=1;
    list<int> l;
    list<int>::iterator it;
    
    cin>>n;
    cin>>k;
    
    for(int i=3;i<=n;i++){
        l.push_back(i);
    }
    
    it = l.begin();
    while(l.size()>0){
        if(*it % p == 0){
            cnt++;
            if(cnt == k){
                p = *it;
                break;
            }
            it = l.erase(it);
        }else{
            it++;
        }
            
        if(it == l.end() && l.size()>0){
            it = l.begin();
            p = *it;
        }
        
        
        
    }
    
    cout << p << endl;
    return 0;
}
