--SELECT TO_CHAR(TO_DATE('01-JAN-1950','dd-MON-yyyy'),'J') from dual; --2433283
--SELECT TO_CHAR(sysdate,'J') from dual; --2459397

--Create temporary unique constraint.
--alter table TEST_AN_1 add constraint column_1_uq unique (column_1);

--Insert random data until it worked 1 million times.
set timin on
Declare
    rows_inserted number := 0;
Begin
    Loop
        Begin
            INSERT INTO test_an_2(column_1,column_2,column_3)
				VALUES(
						round(dbms_random.value(1, 100000)),
						to_date(trunc(dbms_random.value(2433283,2459397+364))||trunc(dbms_random.value(28800,72000)), 'jSSSSS'),
						dbms_random.string('A', round(dbms_random.value(1, 100)))
				);
            
            rows_inserted := rows_inserted + 1;
        --Exception When DUP_VAL_ON_INDEX Then Null;
        End;
        exit when rows_inserted = 1000000;
    End loop;
    commit;
End;
/
set timin off

--Drop the temporary constraint
--alter table test_an_1 drop constraint column_1_uq;

--Double-check the count of distinct rows
select count(1) as number_of_rows from
(
    select distinct column_1, column_2, column_3 from test_an_2
);
quit
