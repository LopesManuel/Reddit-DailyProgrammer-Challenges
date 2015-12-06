####Description

In number theory, a deficient or deficient number is a number n for which the sum of divisors sigma(n)<2n, or, equivalently, the sum of proper divisors (or aliquot sum) s(n)<n. The value 2n - sigma(n) (or n - s(n)) is called the number's deficiency. In contrast, an abundant number or excessive number is a number for which the sum of its proper divisors is greater than the number itself<br/>

As an example, consider the number 21. Its divisors are 1, 3, 7 and 21, and their sum is 32. Because 32 is less than 2 x 21, the number 21 is deficient. Its deficiency is 2 x 21 - 32 = 10.<br/>

The integer 12 is the first abundant number. Its divisors are 1, 2, 3, 4, 6, and 12, and their sum is 28. Because 28 is greater than 2 x 12, the number 12 is abundant. It's abundant by is 28 - 24 = 4. <br/>
####Input Description

You'll be given an integer, one per line. Example:<br/>

18<br/>
21<br/>
9<br/>

####Output Description

Your program should emit if the number if deficient, abundant (and its abundance), or neither. Example:<br/>
18 abundant by 3<br/>
21 deficient<br/>
9 deficient<br/>

####Challenge Input
111  <br/>
112 <br/>
220 <br/>
69 <br/>
134 <br/>
85 <br/>

####Challenge Output
111 deficient <br/>
112 abundant by 24 <br/>
220 abundant by 64 <br/>
69 deficient<br/>
134 deficient<br/>
85 deficient<br/>


See http://sites.my.xs.edu.ph/connor-teh-14/aste/mathematics-asteroids/perfect-abundant-and-deficient-numbers-1-100.
