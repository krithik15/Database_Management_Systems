# only if
```sql

DECLARE
	x NUMBER(3);
	y NUMBER(3);
BEGIN
  x := 5;
  y := 5;
  IF x = y THEN
    dbms_output.put_line('x equal to y');
  END IF;
END;
```

# if - else
```sql
DECLARE
	x NUMBER(3);
	y NUMBER(3);
BEGIN
  x := 5;
  y := 8;
  IF x = y THEN
    dbms_output.put_line('x equal to y');
  ELSE
    dbms_output.put_line('x is not equal to y');
  END IF;
END;
```
# else - if
```sql

```
