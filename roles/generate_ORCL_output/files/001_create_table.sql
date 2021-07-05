BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE TEST_AN_2';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

--type of number, date, character (size 100 bytes)
CREATE TABLE ansible.TEST_AN_2 (
    column_1 NUMBER,
    column_2 DATE,
    column_3 VARCHAR2(100)
 );
quit
