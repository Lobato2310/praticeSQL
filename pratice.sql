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

##group by e order by

SELECT DISTINCT
  status
FROM `bigquery-public-data.thelook_ecommerce.orders`;

SELECT
  status
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status;


SELECT
COUNT(DISTINCT order_id) AS numero_pedidos,
DATE(created_at) AS dia
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY 2;

SELECT
COUNT(DISTINCT order_id) AS numero_pedidos,
DATE(created_at) AS dia
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY dia
ORDER BY dia ASC;

SELECT
COUNT(DISTINCT order_id) AS numero_pedidos,
DATE(created_at) AS dia
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY dia
ORDER BY dia DESC;


"""Exercícios Propostos – Módulo 5

1) Utilize o dataset público “thelook_ecommerce”, que está presente no projeto
“bigquery-public-data” para trazer o identificador único dos usuários, o primeiro
nome, email e idade, ordernados pela data de criação do cadastro."""
SELECT
  id,
  first_name,
  email,
  age,
  created_at
FROM `bigquery-public-data.thelook_ecommerce.users`
ORDER BY created_at;


"""2) No mesmo dataset do exercício anterior, extraia os pedidos que tenham status
“Shipped” ou “Processing”."""
SELECT
  order_id,
  status
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status = "Shipped" or status = "Processing";


""" 3) Considerando o mesmo exercício anterior, traga os pedidos que sejam foram
criados no dia “2022-04-05” e, ao mesmo tempo, tenham status “Cancelled”."""
SELECT 
  order_id,
  created_at,
  status
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE DATE (created_at) = ("2022-04-05") AND  status= "Cancelled";


"""4) O time de marketing deseja fazer uma campanha em um país específico, com o
mesmo dataset dos itens anteriores. Para isso, eles te pedem os e-mails de todos
os clientes que moram no Brasil.
"""
SELECT
  id,
  email,
  country
FROM `bigquery-public-data.thelook_ecommerce.users`
WHERE country = ("Brasil") AND email IS NOT NULL;

"""5) No mesmo dataset anterior, traga o nome dos usuários e o id de seus pedidos"""
SELECT
  order_id,
  first_name
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
JOIN `bigquery-public-data.thelook_ecommerce.orders` o ON u.id = o.user_id; 


"""6) Vá ao dataset público “baseball” e na tabela “schedules” traga os identificadores
únicos, o nome do time da casa e o nome do time de fora de casa dos jogos em
que a duração foi maior ou igual a 250 minutos e menos de 25 mil espectadores. """
SELECT
  gameId,
  homeTeamName,
  awayTeamName,
  duration_minutes,
  attendance,
FROM `bigquery-public-data.baseball.schedules`
WHERE duration_minutes >=250 AND attendance >25000

"""7) No mesmo dataset e tabela, retorne os jogos que começaram entre maio e junho
de 2016."""
SELECT
  gameId,
  startTime,
FROM `bigquery-public-data.baseball.schedules`
WHERE startTime BETWEEN '2016-05-01 00:00:00' AND '2016-06-30 23:59:59';

"""8) DESAFIO: No mesmo dataset anterior, descubra o nome dos times que tenham
somente 6 caracteres, usando o like. Retorne de forma única"""
SELECT DISTINCT
  homeTeamName,
FROM `bigquery-public-data.baseball.schedules`
WHERE homeTeamName LIKE "______";







