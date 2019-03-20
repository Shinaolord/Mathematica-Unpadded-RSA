(* ::Package:: *)

rsa200[minimumdiff_?IntegerQ,printQ_:True]/;If[minimumdiff> 0,True,Message[rsa200::mdiff,minimumdiff]; False]:=Module[{p=Prime[5],q=Prime[6],pubkey,phi,t,e,d,j=1,md=minimumdiff},

While[j<=md  || IntegerLength[p*q]!= 400,
p=NextPrime[RandomInteger[{10^199,10^200}]]; (* Could also use RandomPrime[] *)
q=NextPrime[RandomInteger[{10^199,10^200}]];
j=Abs[p-q];];
pubkey=p*q;
phi=(p-1)(q-1);
t=False;
While[t==False, e=RandomInteger[{10^100,10^400}]; If[GCD[e,phi]==1,t=True]];
d=PowerMod[e,-1,phi];

If[printQ==True,{Print["p=",p] ,Print["q=",q],Print["pubkey=",pubkey],Print["e=",e],Print["d=",d],Print["\!\(\*SubscriptBox[\(mod\), \(\[Phi]\)]\)(e*d)=",Mod[e*d,phi]],Print["diff=",j]},Nothing];
{p,q,pubkey,e,d,Mod[e*d,phi],j}
];
rsa200::mdiff="The minimum difference cannot be negative";
