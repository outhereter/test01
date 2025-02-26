CREATE OR REPLACE PROCEDURE on_qs_mx_update IS
    CURSOR cur_record
    is
    select idx,owner,tbl_phy_name from on_qs_mx order by idx;
BEGIN
    -- Use DBMS_OUTPUT.PUT_LINE to print "Hello World"
    -- DBMS_OUTPUT.PUT_LINE('Hello World');
    update on_qs_mx set
    XXX_YYMM=null,
    XXX_KBN=null
    ;
    
    for rec in cur_record
    loop
        FOR upt_rec IN (
        select
            o.OWNER
            , o.COL_PHY_NAME 
        from
            on_qs_or o 
        where
            o.OWNER = rec.OWNER 
            and o.TBL_PHY_NAME = rec.TBL_PHY_NAME 
        order by
            o.TBL_PHY_NAME
            , o.COL_ID
        ) loop
            if (upt_rec.COL_PHY_NAME = 'XXX_YYMM') then update on_qs_mx mx set mx.XXX_YYMM='●' where mx.OWNER=rec.OWNER and mx.TBL_PHY_NAME=rec.TBL_PHY_NAME; end if;
            if (upt_rec.COL_PHY_NAME = 'XXX_KBN') then update on_qs_mx mx set mx.XXX_KBN='●' where mx.OWNER=rec.OWNER and mx.TBL_PHY_NAME=rec.TBL_PHY_NAME; end if;
        end loop;
    end loop;

    RETURN;
END on_qs_mx_update;
/

/*
begin
    on_qs_mx_update;
end;
*/
