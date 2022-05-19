-module(matherl).
-export([area/1]).


area({square,Side})->
    Side *Side ;

area({Rectangle,X,Y})->
    X *Y ;


area ({Circle,Radius})->
    3.14159 * Radius *Radius ;

area({Triangle,A,B,C})->
    S = (A+B+C) /2 ,
    math:sqrt(S *(S-A) * (S-B) * (S-C)).







