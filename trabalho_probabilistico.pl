0.6::str(dry);
0.3::str(wet); 
0.1::str(snow_covered).

0.2::flw(t); 
0.8::flw(f).

0.98::b(t); 
0.02::b(f).

0.6::k(t); 
0.4::k(f).

0.7::r(t); 0.3::r(f) :- str(dry), flw(t).
0.2::r(t); 0.8::r(f) :- str(dry), flw(f).
0.6::r(t); 0.4::r(f) :- str(wet), flw(t).
0.2::r(t); 0.8::r(f) :- str(wet), flw(f).
0.97::r(t); 0.03::r(f) :- str(snow_covered), flw(t).
0.6::r(t); 0.4::r(f) :- str(snow_covered), flw(f).

0.98::v(t); 
0.02::v(f) :- r(t).
0.3::v(t); 
0.7::v(f) :- r(f).

%Tabela fornecida no enunciado da questao
0.99::li(t); 0.01::li(f) :- v(t), b(t), k(t).
0.01::li(t); 0.99::li(f) :- v(t), b(t), k(f).
0.01::li(t); 0.99::li(f) :- v(t), b(f), k(t).
0.001::li(t); 0.999::li(f) :- v(t), b(f), k(f).
0.3::li(t); 0.7::li(f) :- v(f), b(t), k(t).
0.005::li(t); 0.995::li(f) :- v(f), b(t), k(f).
0.005::li(t); 0.995::li(f) :- v(f), b(f), k(t).
0.0::li(t); 1.0::li(f) :- v(f), b(f), k(f).

%Query: P(V = t | Str = snow_covered)
evidence(str(snow_covered)).
query(v(t)).
