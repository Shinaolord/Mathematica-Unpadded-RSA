# Mathematica Unpadded RSA
# Mathematica Unpadded 

RSA
--Unpadded

Creates a 200 digit RSA PUBLIC key and PRIVATE key using two 100 digit prime numbers, with a minimum difference between the two primes (p,q).
Outputs a list {PRIME P, PRIME Q, P*Q, PUBLIC KEY, PRIVATE KEY, PUBLIC*PRIVATE % phi(n), P-Q}
We output e*d % (p-1)(q-1) to verify that e and d satisfy the requirement that msg^(e*d) is congruent to msg mod phi(n)=(p-1)(q-1) to double check we have a valid (e,d) pair.
Takes a miminum difference between the two primes(minimumdiff), and whether or not we want to print the results, or just save them to the set of variables.
ARGUMENTS: minimum diff( integer, >0), PrintQ (True,False). 
