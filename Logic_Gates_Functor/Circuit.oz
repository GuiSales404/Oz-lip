functor
import
    Gates at 'Gates.ozf'
export
    circuit1: PrimeiroCircuito
    circuit2: SegundoCircuito
    circuit3: TerceiroCircuito
define 

    proc {PrimeiroCircuito A B ?S}
        E F G H 
    in
        E= {Gates.notg A}
        F= {Gates.notg B}
        G= {Gates.and A B}
        H= {Gates.and E F}
        S= {Gates.org G H}
    end

    proc {SegundoCircuito B C D ?S}
        E F G H I 
    in
        E= {Gates.notg B}
        F= {Gates.nor B C}
        G= {Gates.xor E F}
        H= {Gates.notg D}
        I= {Gates.nand H F}
        S= {Gates.nand G I}
    end
 
    proc {TerceiroCircuito A B C D ?S}
        E F G H I J 
    in
        E= {Gates.and D C}
        F= {Gates.nand E C}
        G= {Gates.notg B}
        H= {Gates.nor A G}
        I= {Gates.nor A H}
        J= {Gates.org B F}
        S= {Gates.org J I}
    end   
end
