# Primitive definitions

| Symbol | Type | Forward semantics | Effect | Synthesis schema | Witness |
|---|---|---|---|---|---|
| lambda | `(a -> b) -> Fn a b` | typed lexical closure | [] | [Slot {slotName = "body", slotType = "a -> b"}] | - |
| application | `Fn a b -> a -> b` | apply typed closure | [] | [Slot {slotName = "function", slotType = "Fn a b"},Slot {slotName = "argument", slotType = "a"}] | - |
| composition | `Fn b c -> Fn a b -> Fn a c` | Kleisli composition, propagating failure | [] | [Slot {slotName = "after", slotType = "Fn b c"},Slot {slotName = "before", slotType = "Fn a b"}] | - |
| map | `Fn a b -> List a -> List b` | independent list transformation | [] | [Slot {slotName = "function", slotType = "Fn a b"},Slot {slotName = "list", slotType = "List a"}] | - |
| filter | `Fn a Bool -> List a -> List a` | stable predicate subset | [] | [Slot {slotName = "predicate", slotType = "Fn a Bool"},Slot {slotName = "list", slotType = "List a"}] | - |
| sortBy | `Fn a Int -> List a -> List a` | stable ascending sort | [] | [Slot {slotName = "key", slotType = "Fn a Int"},Slot {slotName = "list", slotType = "List a"}] | - |
| scan | `Fn (s,a) s -> s -> List a -> List s` | includes initial accumulator | [] | [Slot {slotName = "step", slotType = "Fn (s,a) s"},Slot {slotName = "initial", slotType = "s"},Slot {slotName = "list", slotType = "List a"}] | - |
| fold | `Fn (s,a) s -> s -> List a -> s` | left fold | [] | [Slot {slotName = "step", slotType = "Fn (s,a) s"},Slot {slotName = "initial", slotType = "s"},Slot {slotName = "list", slotType = "List a"}] | - |
| if | `Bool -> a -> a -> a` | lazy selected branch | [] | [Slot {slotName = "condition", slotType = "Bool"},Slot {slotName = "then", slotType = "a"},Slot {slotName = "else", slotType = "a"}] | - |
| add | `Int -> Int -> Int` | integer addition | [] | [Slot {slotName = "left", slotType = "Int"},Slot {slotName = "right", slotType = "Int"}] | - |
| subtract | `Int -> Int -> Int` | integer subtraction | [] | [Slot {slotName = "left", slotType = "Int"},Slot {slotName = "right", slotType = "Int"}] | - |
| multiply | `Int -> Int -> Int` | integer multiplication | [] | [Slot {slotName = "left", slotType = "Int"},Slot {slotName = "right", slotType = "Int"}] | - |
| less | `Int -> Int -> Bool` | integer ordering | [] | [Slot {slotName = "left", slotType = "Int"},Slot {slotName = "right", slotType = "Int"}] | - |
| equalInt | `Int -> Int -> Bool` | integer equality | [] | [Slot {slotName = "left", slotType = "Int"},Slot {slotName = "right", slotType = "Int"}] | - |
| not | `Bool -> Bool` | Boolean negation | [] | [Slot {slotName = "value", slotType = "Bool"}] | - |
| tuple | `a -> b -> (a,b)` | pair construction | [] | [Slot {slotName = "first", slotType = "a"},Slot {slotName = "second", slotType = "b"}] | - |
| first | `(a,b) -> a` | first projection | [] | [Slot {slotName = "tuple", slotType = "(a,b)"}] | - |
| second | `(a,b) -> b` | second projection | [] | [Slot {slotName = "tuple", slotType = "(a,b)"}] | - |
| list | `List a -> List a` | typed list construction | [] | [Slot {slotName = "elements", slotType = "List a"}] | - |
| head | `List a -> a` | fails on empty list | [] | [Slot {slotName = "list", slotType = "List a"}] | - |
| tail | `List a -> List a` | fails on empty list | [] | [Slot {slotName = "list", slotType = "List a"}] | - |
| index | `List a -> Int -> a` | checked zero-based indexing | [] | [Slot {slotName = "list", slotType = "List a"},Slot {slotName = "index", slotType = "Int"}] | - |
| length | `List a -> Int` | list length | [] | [Slot {slotName = "list", slotType = "List a"}] | - |
| argmin | `Fn a Int -> List a -> a` | first minimal key; empty fails | [] | [Slot {slotName = "key", slotType = "Fn a Int"},Slot {slotName = "list", slotType = "List a"}] | - |
| argmax | `Fn a Int -> List a -> a` | first maximal key; empty fails | [] | [Slot {slotName = "key", slotType = "Fn a Int"},Slot {slotName = "list", slotType = "List a"}] | - |
| iterateWhile | `Nat -> Fn s Bool -> Fn s s -> s -> s` | bounded transition; fuel required | [] | [Slot {slotName = "fuel", slotType = "Nat"},Slot {slotName = "predicate", slotType = "Fn s Bool"},Slot {slotName = "step", slotType = "Fn s s"},Slot {slotName = "state", slotType = "s"}] | - |
| TL | `Object -> Coord` | inclusive top-left | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| TR | `Object -> Coord` | inclusive top-right | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| BL | `Object -> Coord` | inclusive bottom-left | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| BR | `Object -> Coord` | inclusive bottom-right | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| Center | `Object -> Coord` | integer lattice center, round toward TL | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| width | `Object -> Int` | bounding width | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| height | `Object -> Int` | bounding height | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| bbox | `Object -> BBox` | inclusive bounding box | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| color | `Object -> Maybe Color` | uniform color if singleton | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| position | `Object -> Coord` | top-left placement | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| shape | `Object -> Shape` | uncolored local occupied cells | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| size | `Object -> Int` | number of occupied cells | [] | [Slot {slotName = "object", slotType = "Object"}] | - |
| sameShape | `Object -> Object -> Bool` | normalized occupied cells equal | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| sameColor | `Object -> Object -> Bool` | color sets equal | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| leftOf | `Object -> Object -> Bool` | strict disjoint bbox horizontal ordering | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| rightOf | `Object -> Object -> Bool` | reverse leftOf | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| above | `Object -> Object -> Bool` | strict disjoint bbox vertical ordering | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| below | `Object -> Object -> Bool` | reverse above | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| touch4 | `Object -> Object -> Bool` | occupied cells at Manhattan distance 1 | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| touch8 | `Object -> Object -> Bool` | occupied cells at Chebyshev distance 1 | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| displacement | `Object -> Object -> Vec` | TL(right) - TL(left) | [] | [Slot {slotName = "left", slotType = "Object"},Slot {slotName = "right", slotType = "Object"}] | - |
| Translate | `Object -> Vec -> Object` | add vector to placement | [Position] | [Slot {slotName = "object", slotType = "Object"},Slot {slotName = "vec", slotType = "Vec"}] | TL(target)-TL(source) |
| Recolor | `Object -> Color -> Object` | replace all occupied-cell colors | [Appearance] | [Slot {slotName = "object", slotType = "Object"},Slot {slotName = "color", slotType = "Color"}] | uniform target color |
| Rotate90 | `Object -> Object` | clockwise about local bbox, TL fixed | [Geometry,Orientation] | [Slot {slotName = "object", slotType = "Object"}] | finite forward geometry check |
| Rotate180 | `Object -> Object` | two clockwise turns | [Geometry,Orientation] | [Slot {slotName = "object", slotType = "Object"}] | finite forward geometry check |
| Rotate270 | `Object -> Object` | three clockwise turns | [Geometry,Orientation] | [Slot {slotName = "object", slotType = "Object"}] | finite forward geometry check |
| ReflectH | `Object -> Object` | reverse local x axis | [Geometry,Orientation] | [Slot {slotName = "object", slotType = "Object"}] | finite forward geometry check |
| ReflectV | `Object -> Object` | reverse local y axis | [Geometry,Orientation] | [Slot {slotName = "object", slotType = "Object"}] | finite forward geometry check |
| identity | `a -> a` | return argument | [] | [Slot {slotName = "value", slotType = "a"}] | - |
| Objects | `Scene -> List Object` | ordered scene object list | [] | [Slot {slotName = "scene", slotType = "Scene"}] | - |
| GridTL | `Scene -> Coord` | canvas origin (0,0) | [] | [Slot {slotName = "scene", slotType = "Scene"}] | - |
| GridBR | `Scene -> Coord` | inclusive canvas bottom-right | [] | [Slot {slotName = "scene", slotType = "Scene"}] | - |
| subtractCoord | `Coord -> Coord -> Vec` | coordinate difference | [] | [Slot {slotName = "left", slotType = "Coord"},Slot {slotName = "right", slotType = "Coord"}] | - |
| coordX | `Coord -> Int` | column index | [] | [Slot {slotName = "coord", slotType = "Coord"}] | - |
| coordY | `Coord -> Int` | row index | [] | [Slot {slotName = "coord", slotType = "Coord"}] | - |
| negate | `Int -> Int` | integer negation | [] | [Slot {slotName = "value", slotType = "Int"}] | - |
| true | `Bool` | constant true | [] | [] | - |
| bboxUnion | `BBox -> Object -> BBox` | minimal bounding box containing both inputs | [] | [Slot {slotName = "accumulator", slotType = "BBox"},Slot {slotName = "object", slotType = "Object"}] | - |
| solidRectangle | `BBox -> Color -> Object` | fill bbox with uniform color | [Geometry,Population] | [Slot {slotName = "bbox", slotType = "BBox"},Slot {slotName = "color", slotType = "Color"}] | - |
