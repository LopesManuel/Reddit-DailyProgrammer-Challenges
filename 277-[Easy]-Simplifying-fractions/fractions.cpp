#include <iostream>
#include <string>
#include <sstream>

using namespace std;

/* Standard C Function: Greatest Common Divisor */
int gcd(int a, int b)
{
	int tmp = 0;
	while( a != 0)
	{
		tmp=a;
		a = b%a;
		b = tmp;
	}
	return b;
}

int main()
{
	string mystr;
	while( getline (cin,mystr) )
	{
		int a,b,cd;	
		stringstream(mystr) >> a >> b;
		a < b ? cd = gcd(a,b) : cd = gcd(b,a);
		cout << a/cd << " " << b/cd << endl;
	}
	return 0;
}