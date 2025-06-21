R<q,t>:=FieldOfFractions(PolynomialRing(Rationals(),2));
RR<tt>:=FieldOfFractions(PolynomialRing(Rationals()));

// Read in phi_18
load "phi_18.txt";

// Sanity check; there's a cyclic 18-isogeny between curves with these j-invariants
assert Evaluate(phi,[-15625/28,2251439055699625/25088]) eq 0;

// j-invariants of E and H
jE:=(4096*q^3 - 110592*q^2 + 995328*q - 2985984)/(-3888*q^3*t^2 - 192*q^3*t + 2592*q^2*t + 144*q - 1728);
jH:=(1156831381426176*q^9*t^6 + 171382426877952*q^9*t^5 + 8992287830016*q^9*t^4 - 2313662762852352*q^8*t^5 + 191556845568*q^9*t^3 - 242791771410432*q^8*t^4 + 1370566656*q^9*t^2 - 7758052245504*q^8*t^3 + 1542441841901568*q^7*t^4 + 3981312*q^9*t - 74010599424*q^8*t^2 + 95212459376640*q^7*t^3 + 1156831381426176*q^6*t^4 + 4096*q^9 - 268738560*q^8*t + 1234235584512*q^7*t^2 - 228509902503936*q^6*t^3 - 331776*q^8 + 5804752896*q^7*t - 3173748645888*q^6*t^2 - 1542441841901568*q^5*t^3 + 8957952*q^7 - 21767823360*q^6*t - 85691213438976*q^5*t^2 - 53747712*q^6 - 705277476864*q^5*t + 514147280633856*q^4*t^2 - 1451188224*q^5 + 6347497291776*q^4*t + 385610460475392*q^3*t^2 + 19591041024*q^4 + 19042491875328*q^3*t + 58773123072*q^3 - 257073640316928*q^2*t - 1586874322944*q^2 + 42845606719488)/(104976*q^9*t^2 + 5184*q^9*t - 5668704*q^8*t^2 - 349920*q^8*t + 127545840*q^7*t^2 + 10077696*q^7*t - 1530550080*q^6*t^2 - 3888*q^7 - 160613280*q^6*t + 10331213040*q^5*t^2 + 256608*q^6 + 1530550080*q^5*t - 37192366944*q^4*t^2 - 7243344*q^5 - 8724135456*q^4*t + 55788550416*q^3*t^2 + 113374080*q^4 + 27549901440*q^3*t - 1062882000*q^3 - 37192366944*q^2*t + 5969145312*q^2 - 18596183472*q + 24794911296);

isog_pairs:={};

// This loop should take about a minute
for qq in {-15,1,5,13,17,21,3,7,11,8,10,12} do
	jEq:=Evaluate(jE,[qq,tt]);
	jHq:=Evaluate(jH,[qq,tt]);
	for ii in [1..8] do
		isog_pairs join:={[qq,root[1]] : root in Roots(Numerator(Evaluate(ClassicalModularPolynomial(2*ii),[jEq,jHq])))| root[1] in Integers() };
	end for;
	isog_pairs join:={[qq,root[1]] : root in Roots(Numerator(Evaluate(phi_18,[jEq,jHq])))| root[1] in Integers() };
	"done: ", qq;
end for;

printf "The pairs (q,t) for which E and H are isogenous are: %o", isog_pairs;

