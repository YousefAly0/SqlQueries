select * from lookup_titles

select * from lookup_values where luv_title_id in(4,7)

select * from productAttributeValues  -- product line attributes
where pav_pl_id=1400396

select * from excelproducts prd
inner join productLines pl3 on prd.ep_productLine=pl3.pl_id
inner join excelProductValues epv on 


select * from excelProductValues where epv_ep_id=7624324 -- one/linked product attribute

select * from excelproducts where ep_productLine=1400396

--Select attributes of a product

SELECT * FROM excelProductValues WHERE epv_ep_id = 7624325




