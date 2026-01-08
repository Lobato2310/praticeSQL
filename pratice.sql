SELECT *
FROM ecommerce.products
WHERE price BETWEEN 59 AND 157;

SELECT *
FROM ecommerce.customers
WHERE first_name LIKE 'J%';

SELECT
  *
FROM ecommerce.customers
WHERE first_name LIKE '%r';

SELECT
  *
FROM ecommerce.customers
WHERE first_name LIKE 'J%r';

SELECT
  *
FROM ecommerce.products
WHERE price IN (10,11,15);

SELECT
  *
FROM ecommerce.customers
WHERE state IN ("Acre", "Ceará");

SELECT 
  *
FROM ecommerce.customers
WHERE street IS NULL;

#apelidos

SELECT
  id,
  first_name AS primeiro_nome
FROM ecommerce.customers;

SELECT *
FROM `decisive-lambda-483611-c3.ecommerce.customers`
WHERE state = ("Bahia, Rio Grande do Sul") AND email IS NOT NULL;


SELECT 
  id,
  name,
CASE 
WHEN name = "Cosméticos e Perfumaria" THEN "Sim, a categoria é Cosméticos e Perfumaria"
END AS case1
FROM ecommerce.categories;

SELECT 
  id,
  name,
CASE 
WHEN name = "Cosméticos e Perfumaria" THEN "Sim, a categoria é Cosméticos e Perfumaria"
WHEN name = "Esporte e Lazer" THEN "Sim, a categoria é Esporte e Lazer"
ELSE "Não encontrou as categorias acima"
END AS case2
FROM ecommerce.categories;

SELECT
  id,
  name,
CASE 
WHEN id BETWEEN 0 AND 5 THEN 'Primeiro verdadeiro'
WHEN id BETWEEN 3 AND 5 THEN 'Segundo verdadeiro'
WHEN id BETWEEN 3 AND 7 THEN 'Terceiro verdadeiro'
END AS case2
FROM `bigquery-public-data.thelook_ecommerce.distribution_centers` ;

#if

SELECT
  id,
  name,
IF(name = "Cosméticos e Perfumaria", "Sim, a categoria é Cosméticos e Perfumaria", if(name = "Esporte e Lazer", "Sim, a categoria é Esporte e Lazer", "Não encontrou nenhuma das categorias acima")) AS if1
FROM ecommerce.categories;


# coalesce

SELECT
  id,
  first_name,
  additionals,
COALESCE(additionals, "O complemento é nulo") AS complemento
FROM ecommerce.customers
LIMIT 10;






