/*
Exercici 1
Presenta el nom, telèfon, país, data i amount, d'aquelles empreses que van realitzar transaccions amb un valor comprès entre 100 i 200 euros 
i en alguna d'aquestes dates: 29 d'abril del 2021, 20 de juliol del 2021 i 13 de març del 2022. Ordena els resultats de major a menor quantitat.*/

select company_name, phone, country, timestamp,amount
from transactions.company
	left join transactions.transaction on company.id=transaction.company_id
    where amount between 100 and 200 and date(timestamp) in ('2021-04-29','2021-07-20','2022-03-13')
    order by amount desc;

/* 
Exercici 2
Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, per la qual cosa et demanen la informació 
sobre la quantitat de transaccions que realitzen les empreses, però el departament de recursos humans és exigent i vol un llistat de les empreses 
on especifiquis si tenen més de 4 transaccions o menys. */

select company_id, count(transaction.id) as n_compras,
case 
	when count(transaction.id) > 4 THEN 'Más de 4'
    when count(transaction.id) < 4 THEN 'Menos de 4'
end as Cantidad
from transactions.transaction
group by company_id
order by n_compras desc;
/*
Exercici 1
Presenta el nom, telèfon, país, data i amount, d'aquelles empreses que van realitzar transaccions amb un valor comprès entre 100 i 200 euros 
i en alguna d'aquestes dates: 29 d'abril del 2021, 20 de juliol del 2021 i 13 de març del 2022. Ordena els resultats de major a menor quantitat.*/

select company_name, phone, country, timestamp,amount
from transactions.company
	left join transactions.transaction on company.id=transaction.company_id
    where amount between 100 and 200 and date(timestamp) in ('2021-04-29','2021-07-20','2022-03-13')
    order by amount desc;

/* 
Exercici 2
Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, per la qual cosa et demanen la informació 
sobre la quantitat de transaccions que realitzen les empreses, però el departament de recursos humans és exigent i vol un llistat de les empreses 
on especifiquis si tenen més de 4 transaccions o menys. */

select company_id, count(transaction.id) as n_compras,
case 
	when count(transaction.id) > 4 THEN 'Más de 4'
    when count(transaction.id) < 4 THEN 'Menos de 4'
end as Cantidad
from transactions.transaction
group by company_id
order by n_compras desc;
