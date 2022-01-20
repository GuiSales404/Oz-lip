declare [Circuitos] = {Module.link['C:/Users/Guilherme/Downloads/Lip_Implementacao2_499756/Circuit.ozf']} 
% Professor, por favor antes de executar atualize o path para o que ficara valido no computador do senhor, grato.

declare A B 
A=1|1|_
B=0|1|_ S in
{Circuitos.circuit1 A B S} 
{Browse S}

declare X Y Z
X=0|1|_
Y=1|1|_
Z=0|0|_ W in
{Circuitos.circuit2 X Y Z W}
{Browse W}


declare E F G H
E=1|1|_
F=0|0|_
G=0|0|_
H=1|0|_ I in
{Circuitos.circuit3 E F G H I}
{Browse I}