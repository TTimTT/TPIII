figuresdir = './figures/'
datadir = './data/'

set terminal context standalone

set output figuresdir.'Co57.tex'
plot[*:100][0:100000] datadir."Co57.TKA"

set output figuresdir.'Co60.tex'
plot datadir."Co60.TKA"

set output figuresdir.'Cs137.tex'
plot datadir."Cs137.TKA"

set output figuresdir.'Hf181.tex'
plot[*:250][0:300000] datadir."Hf181.TKA"

set output figuresdir.'Na22.tex'
plot datadir."Na22.TKA"

set output figuresdir.'Pb120.tex'
plot[*:40] datadir."Pb120.TKA"


