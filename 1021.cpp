// BEE 1021 - Banknotes and coins
#include <iostream>
#include <cmath>
using namespace std;

bool isCoinBigger(int coin){
    int notes[6]={100, 50, 20, 10, 5, 2};

    for(int i : notes){
        if (coin > i){
            return false;
        }
    }
    return true;
}
int main(){

    float input;
    cin >> input;
    int notes[6]={100, 50, 20, 10, 5, 2};
    float coins[6]= {1, 0.50, 0.25, 0.10, 0.05, 0.01};
    cout << "NOTAS:" << endl;
    for (int i = 0; i < 6; i++){

        int multiplier = input/notes[i];
        // cout << multiplier << endl;
        float remaining =  input-(multiplier*notes[i]);
        remaining = round(remaining * 100.0)/100.0;
        cout << multiplier << " nota(s) de R$: "<<  (float) notes[i]  <<endl;
        input = remaining;
    }
    cout << input <<endl;
    cout << "MOEDAS" << endl;

    for (int i = 0; i < 6; i++){

        int multiplier = input/coins[i];
        // cout << multiplier << endl;
        float remaining =  input-(multiplier*coins[i]);
        remaining = round(remaining * 100.0)/100.0;
        cout << multiplier << " nota(s) de R$: "<<  (float) coins[i]  <<endl;
        input = remaining;
    }


}