/*Exercici 1
Identifica els cinc dies que es va generar la quantitat més gran d'ingressos a l'empresa per vendes. 
Mostra la data de cada transacció juntament amb el total de les vendes. */

select date(timestamp) as fecha, sum(amount) as ventas
from transactions.transaction
where declined = 0
group by date(timestamp)
order by 2 desc
limit 5;

-- he utlizado el filtro declined=0 para quitar las transacciones que no se han efectuado

/*Exercici 2
Quina és la mitjana de vendes per país? Presenta els resultats ordenats de major a menor mitjà.*/

select country, round(avg(amount),2) as media_compra
from transactions.company
	left join transactions.transaction on (company.id=transaction.company_id)
where declined= 0
group by country
order by media_compra desc;

-- he utlizado el filtro declined=0 para quitar las transacciones que no se han efectuado, pongo round 2 para que solo aparezcan 2 decimales

/*
Exercici 3
En la teva empresa, es planteja un nou projecte per a llançar algunes campanyes publicitàries per a fer competència a la companyia "Non Institute". 
Per a això, et demanen la llista de totes les transaccions realitzades per empreses que estan situades en el mateix país que aquesta companyia.
    Mostra el llistat aplicant JOIN i subconsultes.
    Mostra el llistat aplicant solament subconsultes.
*/
-- Mostra el llistat aplicant JOIN i subconsultes.
select t.*
from transactions.transaction as t
	left join transactions.company on (t.company_id=company.id)
where company_name != 'Non Institute'and country in (
						select country
						from transactions.company
						where company_name='Non Institute');

-- Mostra el llistat aplicant solament subconsultes.
select *
from transactions.transaction 
where company_id in (
		select id
                from transactions.company
                where company_name!= 'Non Institute' and country =(
								select country
        					                from transactions.company
                                    				where company_name='Non Institute'));
