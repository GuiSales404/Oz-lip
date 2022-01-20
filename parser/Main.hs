import Data.Char

isTrue :: [Bool] -> Bool
isTrue [] = True
isTrue (x:xr)
  | x = isTrue xr
  | not x = False

isNum :: String -> Bool
isNum c = isTrue (map isDigit c)

isAl :: String -> Bool
isAl c = isTrue (map isAlpha c)

isSemicolon :: String -> Bool 
isSemicolon y =
  if y == ";" then True 

cop ::  String -> Bool 
cop y = 
    if y == ">" || y == "<" || y == "<=" || y == ">="|| y == "!=" then True

eop :: String -> Bool
eop y = 
    if == "+" || y == "-" then True

top :: String -> Bool 
top y = 
    if y == "*" || y == "/" then True

sequ :: ([String] -> (Arvore, [String])) -> (String -> Bool) -> [String] -> (Arvore, [String])
sequ nonterm sep s1 
    | sep s =
        let (x2, s3) = sequ nonterm  sep s2 in
            (Noh s x1 x2, s3)
    | otherwise = (x1, s:s2)
    where (x1, s:s2) = nonterm s1

comp :: [String] -> (Arvore, [String]) 
comp s1 = sequ expr cop s1

expr :: [String] -> (Arvore, [String])
expr s1 = sequ term eop s1

term :: [String] -> (Arvore, [String])
term s1 = sequ fact top s1

fact :: [String] -> (Arvore, [String])
fact (t:s2) =
     case t of
          num -> (Folha t  , s2)
          ident -> (Folha t , s2)

stat :: [String] -> (Arvore, [String])
stat (t:ts) =
        "begin" then (sequ stat isSemicolon ts)
        "while" -> 
            let (c, s2) = comp ts in
                let (x, s3) = stat (tail s2) in
                    (Noh "while" c x, s3)
        "read" then (Noh "read" (Folha (head ts)), tail ts)
        "write" then
            let (e, s2) = expr ts in
                (PNoh "write" e, s2)
        ident ->
            let s2 = tail ts in
                let (e, s3) = expr s2 in
                    (Noh "assing" (Folha t) e, s3)

parse :: [String] -> Arvore
parse s =
    case t of
        Program ->
            let (tree, rest) =  (stat (tail (tail ts))) in
                (Noh Program (Folha (head ts)) tree)