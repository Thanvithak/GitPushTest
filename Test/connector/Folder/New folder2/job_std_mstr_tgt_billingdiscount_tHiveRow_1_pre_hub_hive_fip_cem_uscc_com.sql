
insert into pre_hub.bill_disc_int  
select
bd_id
,applied_date
,sscr_id
,cust_id
,type_cd
,promo_cd
,sched_typ_cd
,amount
,current_timestamp as sys_insr_dt
,'context.job_id' as insr_run_id
,'context.import_date' as partition_key from

(
select
bd_id
,applied_date
,sscr_id
,cust_id
,type_cd
,promo_cd
,sched_typ_cd
,amount
from pre_stage.bill_disc_int_bd_promo_stg

union all

select
bd_id
,applied_date
,sscr_id
,cust_id
,type_cd
,promo_cd
,sched_typ_cd
,amount
from pre_stage.bill_disc_int_bd_trail_stg ) a
