=begin
49. Playing with digits
(​https://www.codewars.com/kata/5552101f47fc5178b1000050/train/ruby​) 
6 kyu

Some numbers have funny properties. For example:
89 --> 81 + 92 = 89 * 1
695 --> 62 + 93 + 54 = 1390 = 695 * 2
46288 --> 43 + 64+ 25+ 86+ 87 = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.

In other words:  Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

# EXAMPLES
dig_pow(89, 1) should return 1 since 81 + 92 = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 91 + 22 equals 92 * k dig_pow(695, 2) should return 2 since 62 + 93 + 54= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 43 + 64+ 25 + 86 + 87 = 2360688 = 46288 * 51

p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2
=end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51
p dig_pow(695, 2) == 2