--productLines relations
/*
 16089 pl3

*/

select pl1.pl_name AS pl1, pl1.pl_prim_type AS pl1_primType, pl1.pl_id AS pl1_id, pl2.pl_name AS pl2, pl2.pl_id AS pl2_id, pl2.pl_prim_type AS pl2_primType,
pl3.pl_name AS pl3, pl3.pl_id AS pl3_id, pl3.pl_prim_type AS pl3_primType
from productLines pl1
inner join productLines pl2 on pl1.pl_id = pl2.pl_parent
inner join productLines pl3 on pl2.pl_id = pl3.pl_parent




--item_types relations
/*
	any category must have 3 levels
	ex: „‰ Ã«  €–«∆Ì… : „Ã„œ«  : Œ÷—«Ê« 
	we have 361 category
*/

select  it1.type as it1_name, it1.type_id as it1_id, it2.type as it2_name, it2.type_id as it2_id, it3.type as it3_name, it3.type_id as it3_id
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
where it1.type_id = 10200131 OR it2.type_id = 10200131 OR it3.type_id = 10200131



--where it1.Type_Parent is null








