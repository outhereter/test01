/*
drop table on_qs_bs;

create table on_qs_bs as select * from (
select to_number('1') idx, 'VMS' owner, 'トランザクション' dev1, 'XXX' dev2, 'XXXX' tbl_logic_name, 'XXX' tbl_phy_name from dual union all
select to_number('2') idx, 'VMS' owner, 'トランザクション' dev1, 'XXX' dev2, 'XXXX' tbl_logic_name, 'XXX' tbl_phy_name from dual union all
select to_number('3') idx, 'VMS' owner, 'トランザクション' dev1, 'XXX' dev2, 'XXXX' tbl_logic_name, 'XXX' tbl_phy_name from dual union all
select to_number('4') idx, 'VMS' owner, 'トランザクション' dev1, 'XXX' dev2, 'XXXX' tbl_logic_name, 'XXX' tbl_phy_name from dual union all
)
;
*/

/*
drop table on_qs_or;

create table on_qs_or as
select
    x.owner
    ,x.TBL_PHY_NAME
    ,t3.column_id col_id
    ,t3.COLUMN_NAME col_phy_name
    ,t3.DATA_TYPE
from
    on_qs_bs x
    left join
    all_objects t1
    on t1.OWNER = x.OWNER
    and t1.OBJECT_NAME = x.tbl_phy_name
    and t1.OBJECT_TYPE = 'TABLE'
    left join
    all_tab_columns t3
    on t3.owner = t1.owner
    and t3.table_name = t1.object_name
order by
    x.OWNER
    ,x.TBL_PHY_NAME
    ,t3.column_id
;
*/

/*
drop table on_qs_hr;

create table on_qs_hr as
select
    s1.*
    ,s2.*
from
(
    select
        *
    from
        on_qs_bs b
    where
        b.dev2 in ('XXX','XXX')
) s1
natural join 
(
    select
        min(o.COL_ID) col_id
        ,o.col_phy_name
    from
        on_qs_bs b
        inner join
        on_qs_or o
        on o.OWNER = b.OWNER
        and o.TBL_PHY_NAME = b.TBL_PHY_NAME
    where
        b.dev2 in ('XXX','XXX')
        and o.col_phy_name is not null
    group by
        o.col_phy_name
) s2
order by
s1.IDX
,s2.col_id
,s2.col_phy_name
;
*/

/*
drop table ON_QS_MX;

CREATE TABLE ON_QS_MX
   (
	IDX NUMBER, 
	OWNER CHAR(3), 
	DEV1 VARCHAR2(16), 
	DEV2 VARCHAR2(30), 
	TBL_LOGIC_NAME VARCHAR2(75), 
	TBL_PHY_NAME VARCHAR2(9),
	XXX_YYMM VARCHAR2(10),
	XXX_KBN VARCHAR2(10)
   )
;
*/

select * from on_qs_bs;
select * from on_qs_or order by TBL_PHY_NAME, COL_ID;
select * from on_qs_hr;

select * from on_qs_mx;

/*
insert 
into on_qs_mx( 
    IDX
    , OWNER
    , DEV1
    , DEV2
    , TBL_LOGIC_NAME
    , TBL_PHY_NAME
) 
select
    IDX
    , OWNER
    , DEV1
    , DEV2
    , TBL_LOGIC_NAME
    , TBL_PHY_NAME 
from
    on_qs_bs
where
    dev2 in ('XXX','XXX')
order by
    IDX;
*/
