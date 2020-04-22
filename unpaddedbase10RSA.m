(* ::Package:: *)

rsa200[minimumdiff_?IntegerQ,printQ_:True]/;If[minimumdiff>= 0,True,Message[rsa200::mdiff,minimumdiff]; False]:=Module[{p=Prime[5],q=Prime[6],pubkey,phi,t,e,d,j=1,md=minimumdiff},

While[j<=md  || IntegerLength[p*q]!= 400,
p=NextPrime[RandomInteger[{10^199,10^200}]]; (* Could also use RandomPrime[] *)
q=NextPrime[RandomInteger[{10^199,10^200}]];
j=Abs[1.0(p-q)];];
pubkey=p*q;
phi=(p-1)(q-1);
t=False;
While[t==False, e=RandomInteger[{1,10^400}]; If[GCD[e,phi]==1,t=True]];
d=PowerMod[e,-1,phi];

If[printQ==True,{Print["p=",p] ,Print["q=",q],Print["pubkey=",pubkey],Print["e=",e],Print["d=",d],Print["\!\(\*SubscriptBox[\(mod\), \(\[Phi]\)]\)(e*d)=",Mod[e*d,phi]],Print["diff=",j]},Nothing];
{p,q,pubkey,e,d,Mod[e*d,phi],j}
];
rsa200::mdiff="The minimum difference cannot be negative";


rsa1024[minimumdiff_?IntegerQ,printQ_:True]/;If[minimumdiff>= 0,True,Message[rsa1024::mdiff,minimumdiff]; False]:=Module[{p=Prime[5],q=Prime[6],pubkey,phi,t,e,d,j=1,md=minimumdiff},

While[j<=md  || IntegerLength[p*q]!= 1024,
p=RandomPrime[{10^511,10^512}]; 
q=RandomPrime[{10^511,10^512}];
j=Abs[1.0*(p-q)];];
pubkey=p*q;
phi=(p-1)(q-1);
t=False;
While[t==False, e=RandomInteger[{1,10^1012}]; If[GCD[e,phi]==1,t=True]];
d=PowerMod[e,-1,phi];

If[printQ==True,{Print["p=",p] ,Print["q=",q],Print["pubkey=",pubkey],Print["e=",e],Print["d=",d],Print["\!\(\*SubscriptBox[\(mod\), \(\[Phi]\)]\)(e*d)=",Mod[e*d,phi]],Print["diff=",j]},Nothing];
{p,q,pubkey,e,d,Mod[e*d,phi],j}
];
rsa1024::mdiff="The minimum difference cannot be negative";


(* ::Input::Initialization:: *)
rsa2048[minimumdiff_?IntegerQ,printQ_:True]/;If[minimumdiff>= 0,True,Message[rsa2048::mdiff,minimumdiff]; False]:=Module[{p=Prime[5],q=Prime[6],pubkey,phi,t,e,d,j=1,md=minimumdiff},

While[j<=md  || Log[2,p*q] > 2048|| Log[2,p*q] < 2047,
p=RandomPrime[{2^1023,2^1024}]; 
q=RandomPrime[{2^1023,2^1024}];
j=Abs[1.0*(p-q)];];
pubkey=p*q;
phi=(p-1)(q-1);
t=False;
While[t==False, e=RandomInteger[{1,2^2048}]; If[GCD[e,phi]==1,t=True]];
d=PowerMod[e,-1,phi];

If[printQ==True,{Print["p=",p] ,Print["q=",q],Print["pubkey=",pubkey],Print["e=",e],Print["d=",d],Print["\!\(\*SubscriptBox[\(mod\), \(\[Phi]\)]\)(e*d)=",Mod[e*d,phi]],Print["diff=",j]},Nothing];
{p,q,pubkey,e,d,Mod[e*d,phi],j}
];
rsa2048::mdiff="The minimum difference cannot be negative";


(* ::Input:: *)
(*CloseKernels[];*)
(*LaunchKernels[15];*)
(*$KernelCount*)
(*$ProcessorCount*)
(*$ProcessorType*)
(*Kernels[]*)
(*Needs["HypothesisTesting`"]*)
(*exp=Table[10^x,{x,59,50+15*10,10}];*)
(*%//Length*)
(*e=Log[10,%%]*)


(* ::Input:: *)
(**)
(*iterations=5*10^3* {2,1/4,2};*)
(*f[list_]:=NormalCI[Mean[list],StandardDeviation[list],ConfidenceLevel->0.5];*)
(*Pause[15];*)
(*Print["------------------------------------------------------"]*)
(*ti=TimeObject[Now];*)
(*Print["Testing 10**200...\n","Total Iterations to Perform:",15*iterations[[1]]];*)
(*table200=ParallelTable[Table[AbsoluteTiming[rsa200[x,False]][[1]],iterations[[1]]],{x,exp}];*)
(*results200=Table[{"10**x; x= ",e[[k]],Total[table200[[k]]],Mean[table200[[k]]],StandardDeviation[table200[[k]]],f[table200[[k]]]},{k,1,Length[table200]}];*)
(*TableForm[%]*)
(*tf=TimeObject[Now];*)
(*diff=tf-ti*)
(*Print["Total Iterations Per Exponent= ", iterations[[1]]];*)
(**)
(*Pause[30];*)
(**)
(*Print["------------------------------------------------------"]*)
(*ti=TimeObject[Now];*)
(*Print["Testing 10**1024...\n","Total Iterations to Perform:",15*iterations[[2]]]*)
(*table1024=ParallelTable[Table[AbsoluteTiming[rsa1024[x,False]][[1]],iterations[[2]]],{x,exp}];*)
(*results1024=Table[{"10**x; x= ",e[[k]],Total[table1024[[k]]],Mean[table1024[[k]]],StandardDeviation[table1024[[k]]],f[table1024[[k]]]},{k,1,Length[table1024]}];*)
(*TableForm[%]*)
(*tf=TimeObject[Now];*)
(*diff=tf-ti;*)
(*Print["Total Iterations Per Exponent= ", iterations[[2]]];*)
(**)
(*Pause[30];*)
(**)
(*Print["------------------------------------------------------"]*)
(*ti=TimeObject[Now];*)
(*Print["Testing 2**2048...\n","Total Iterations to Perform:",15*iterations[[3]]]*)
(*table2048=ParallelTable[Table[AbsoluteTiming[rsa2048[x,False]][[1]],iterations[[3]]],{x,exp}];*)
(*results2048=Table[{"10**x; x= ",e[[k]],Total[table2048[[k]]],Mean[table2048[[k]]],StandardDeviation[table2048[[k]]],f[table2048[[k]]]},{k,1,Length[table2048]}];*)
(*TableForm[%]*)
(*tf=TimeObject[Now];*)
(*diff=tf-ti*)
(*Print["Total Iterations Per Exponent= ", iterations[[3]]];*)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(**)


(* ::Input:: *)
(*$MachinePrecision*)
(*$MaxNumber*)
(*$MinNumber*)
(*$MaxMachineNumber*)
(*$MinMachineNumber*)
(**)


(* ::Input:: *)
(*ti=Now*)
(*Pause[5];*)
(*tf=TimeObject[Now]*)
(*tf-ti*)
(*AbsoluteTime[tf-ti]*)


(* ::Input:: *)
(*$TimeUnit*)


(* ::Input:: *)
(*2^62-1/2//N*)


(* ::Input:: *)
(*Log[2,1355718576299610]//N*)


(* ::Input:: *)
(*Log[2,{10^200,10^1024,10^2048}]//N*)


(* ::Input:: *)
(*rsa2048[1,False]*)


(* ::Input:: *)
(*Confid*)
