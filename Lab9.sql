CREATE DATABASE Lab9;

CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    salary INT
);

CREATE TABLE products(
    id  SERIAL PRIMARY KEY ,
    name VARCHAR(100),
    price INT,
    category VARCHAR(100)
);

-- 1
CREATE OR REPLACE FUNCTION increase_value(input_value INT)
RETURNS INT AS
$$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;


-- 2
CREATE OR REPLACE FUNCTION compare_numbers(num1 INT, num2 INT)
RETURNS TEXT AS
$$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;


-- 3
CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TABLE(value INT) AS
$$
BEGIN
    RETURN QUERY
    SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;


-- 4
CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
RETURNS TABLE(id INT, name VARCHAR, position VARCHAR, salary NUMERIC) AS
$$
BEGIN
    RETURN QUERY
    SELECT id, name, position, salary
    FROM employees
    WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;


-- 5
CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
RETURNS TABLE(id INT, name VARCHAR, price NUMERIC, category VARCHAR) AS
$$
BEGIN
    RETURN QUERY
    SELECT id, name, price, category
    FROM products
    WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;


-- 6
-- 6.1
CREATE OR REPLACE FUNCTION calculate_bonus(salary INT)
RETURNS NUMERIC AS
$$
BEGIN
    RETURN salary * 0.10;
END;
$$ LANGUAGE plpgsql;


-- 6.2
CREATE OR REPLACE FUNCTION update_salary(emp_id INT)
RETURNS VOID AS
$$
DECLARE
    current_salary NUMERIC;
    bonus NUMERIC;
BEGIN
    SELECT salary INTO current_salary FROM employees WHERE id = emp_id;

    bonus := calculate_bonus(current_salary);

    UPDATE employees SET salary = salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;


-- 7
CREATE OR REPLACE FUNCTION complex_calculation(num_param INT, str_param VARCHAR)
RETURNS TEXT AS
$$
DECLARE
    numeric_result INT;
    string_result VARCHAR;
BEGIN

    numeric_result := num_param * 2;

    string_result := 'Hello, ' || str_param;

    RETURN string_result || '. Your number doubled is: ' || numeric_result;
END;
$$ LANGUAGE plpgsql;
