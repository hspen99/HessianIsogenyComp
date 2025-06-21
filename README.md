# HessianIsogenyComp
This is the Magma code for the computation which completes the proof of Proposition 4.5 in "Constructing families of Selmer companions" (https://arxiv.org/abs/2502.01351). 

phi_18.txt: This contains the 18th classical modular polynomial, which was originally taken from https://math.mit.edu/~drew/ClassicalModPolys.html.

IsogenyComp.m: This computes all the integer pairs (q,t) for which there's a rational cyclic isogeny between curves with the relevant j-invariants. It should take about a minute to run, and will output all the pairs excluded from the statement of Proposition 4.5.
