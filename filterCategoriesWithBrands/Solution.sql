/*
	now we need to get cat3_id with given anonymous cat_id which may be level 1 or 2 or 3.
	ex: level 1 = 10200010
	level 2 = 10200018
	level 3 = 10200416

*/

--case the given id is already level 3
select   it3.type as it3_name, it3.type_id as it3_id
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
where it1.type_id = 10200416 OR  it2.type_id = 10200416 OR it3.type_id = 10200416

--case the given id is level 2
select   it3.type as it3_name, it3.type_id as it3_id
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
where it1.type_id = 10200018 OR  it2.type_id = 10200018 OR it3.type_id = 10200018

--case the given id is level 1
select   it3.type as it3_name, it3.type_id as it3_id
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
where it1.type_id = 10200010 OR  it2.type_id = 10200010 OR it3.type_id = 10200010

/*
	Now get the brand associated with category level 3
*/

select   it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where it1.type_id = 10200416 OR  it2.type_id = 10200416 OR it3.type_id = 10200416


--test why duplicate results duplicates come from pl3 because it pl2 has many pl3
--this query take category Id and return all brands associated with this category

--case the given category is already level 3
select  distinct it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name

from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where it1.type_id = 10200416 OR  it2.type_id = 10200416 OR it3.type_id = 10200416

--test why duplicate results duplicates come from pl3 because it pl2 has many pl3
--this query take category Id and return all brands associated with this category

--case the category is level 2
select  distinct it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name

from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where it1.type_id = 10200018 OR  it2.type_id = 10200018 OR it3.type_id = 10200018

--test why duplicate results duplicates come from pl3 because it pl2 has many pl3
--this query take category Id and return all brands associated with this category

--case the category is level 1
select  distinct it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where it1.type_id = 10200010 OR  it2.type_id = 10200010 OR it3.type_id = 10200010


--filter categories with brands in the IN()

--case level 1 category

select  distinct it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where (it1.type_id = 10200010 OR  it2.type_id = 10200010 OR it3.type_id = 10200010) AND brand.pl_id IN (1400462)


--case level 2 category

select  distinct it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where (it1.type_id = 10200018 OR  it2.type_id = 10200018 OR it3.type_id = 10200018) AND brand.pl_id IN (1404289)


--case level 3 category

select  distinct it3.type as it3_name, it3.type_id as it3_id, brand.pl_id as brand_id, brand.pl_name as brand_name
from Item_Type it1
inner join Item_Type it2 on it1.type_id = it2.Type_Parent
inner join Item_Type it3 on it2.type_id = it3.Type_Parent
inner join productLines pl3 on it3.type_id = pl3.pl_prim_type
inner join productLines brand on pl3.pl_parent = brand.pl_id
where (it1.type_id = 10200416 OR  it2.type_id = 10200416 OR it3.type_id = 10200416) AND brand.pl_id IN (1404343, 1406371)
