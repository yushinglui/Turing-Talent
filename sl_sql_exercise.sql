/*
    INFO: This exercise is not timed, and you may use any available resources.
        https://extendsclass.com/postgresql-online.html# is a PostgreSQL 11.x sandbox if you need it.

    TODO: Please resolve the comments in the code below.
    TODO: Please refactor the code to make it more maintainable.
        - Add any new comments that you think would help.
*/


create or replace function median_value(numeric[])  
   returns numeric as
$$
   select avg(val) -- finding the average value from the dataset
       from (
         select val
            from unnest($1) val
            where val.val is not null
            order by 1
            limit  2 - mod(array_upper($1, 1), 2)
            offset ceil(array_upper($1, 1) / 2) - 1
       ) sub;
$$
language sql immutable;

drop aggregate if exists median_value(numeric);
create aggregate median_value(numeric) (
  sfunc=array_append,
  stype=numeric[],
  finalfunc=median_value,
  initcond='{}'
);


create or replace function median_value(text[]) 
    returns text as
$$
    with ordinal_input as -- ordinal and finding median of text arrey
        (select val, index 
         from unnest($1) with ordinality input(val, index) 
         where val is not null)
 

    select
        array_agg(val)::text as val
    from ordinal_input, 
        (select max(index) as max_idx 
         from ordinal_input) as idx
    where index between floor((max_idx+1)/2) 
        and ceil((max_idx+1)/2)
$$ 
language sql immutable;


drop aggregate if exists median_value(text);
create aggregate median_value(text) (
  sfunc=array_append,
  stype=text[],
  finalfunc=median_value,
  initcond='{}'
);


-- TODO: Document these two functions - PEP257 may help.
-- comment on function median_value(numeric[]) is looking for the median of number arrey;
-- comment on function median_value(text[]) is looking for the median of text arrey;