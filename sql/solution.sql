with
    -- I assume that map table should not have any duplicates !
    fixed_table_map as (select distinct * from table_map),
    fixed_table_a as (
        select
            table_a.dimension_1,
            fixed_table_map.correct_dimension_2 as dimension_2,
            table_a.dimension_3,
            table_a.measure_1
        from table_a
        left join fixed_table_map on table_a.dimension_1 = fixed_table_map.dimension_1
    ),
    fixed_table_b as (
        select
            table_b.dimension_1,
            fixed_table_map.correct_dimension_2 as dimension_2,
            table_b.measure_2
        from table_b
        left join fixed_table_map on table_b.dimension_1 = fixed_table_map.dimension_1
    ),
    joined_tables as (
        select
            nvl(fixed_table_a.dimension_1, fixed_table_b.dimension_1) as dimension_1,
            nvl(fixed_table_a.dimension_2, fixed_table_b.dimension_2) as dimension_2,
            nvl(fixed_table_a.measure_1, 0) as measure_1,
            nvl(fixed_table_b.measure_2, 0) as measure_2
        from fixed_table_a
        full outer join
            fixed_table_b on fixed_table_a.dimension_1 = fixed_table_b.dimension_1
    )
select
    dimension_1,
    dimension_2,
    sum(measure_1) as sum_measure_1,
    sum(measure_2) as sum_measure_2
from joined_tables
group by dimension_1, dimension_2
order by dimension_1, dimension_2, sum_measure_1, sum_measure_2
