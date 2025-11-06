// BEE 1021 - Banknotes and coins
#include <iostream>
using namespace std;

bool isCoinBigger(int coin){
    int coins[6]={100, 50, 20, 10, 5, 2};

    for(int i : coins){
        if (coin > i){
            return false;
        }
    }
    return true;
}
int main(){

    float input;
    cin >> input;
    int remaining;
    int coins[6]={100, 50, 20, 10, 5, 2};
    
    cout << "Notas:" << endl;
    for (int i = 0; i < 6; i++){
        int multiplier = input/coins[i];
        cout << multiplier << endl;
        float remaining =  input-(multiplier*coins[i]);
        input = remaining;
    }
    cout << input <<endl;



}