select * from on_qs_bs b where b.TBL_PHY_NAME <> 'XXXXX';
select * from on_qs_or o where o.TBL_PHY_NAME <>  'XXXXX';
select * from on_qs_hr h order by col_id, COL_PHY_NAME;

select
    h.*
    ,decode(o.col_phy_name, null, ' ', '●') col_is_exist
from
    on_qs_hr h
    left join
    on_qs_or o
    on  o.OWNER = h.OWNER
    and o.TBL_PHY_NAME = h.TBL_PHY_NAME
    and o.COL_PHY_NAME = h.COL_PHY_NAME
where
    h.TBL_PHY_NAME = 'XXXXX'
order by
     h.IDX
    ,h.COL_ID
    ,h.COL_PHY_NAME
;

