#include <iostream>
#include "fact.h"

using std::cout;
using std::endl;

int main() {
  cout << "BLA" << endl;
  for (int i=0; i < 10; i++) {
    cout << i << " : " << fact(i) << endl;
  }
  return 0;
}
