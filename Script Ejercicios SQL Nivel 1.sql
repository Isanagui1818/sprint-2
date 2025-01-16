# Ejercicio 2:
#2.1 Llistat dels països que estan fent compres.

select distinct company.country
from transactions.transaction
	LEFT JOIN transactions.company on (transaction.company_id = company.id);

-- Listado de paises que realizan las compras.    

# 2.2 Des de quants països es realitzen les compres.

select count(distinct company.country) as N_paises
from transactions.transaction
	LEFT JOIN transactions.company on (transaction.company_id = company.id);
    
-- 15 paises son los que hacen las compras

#2.3 Identifica la companyia amb la mitjana més gran de vendes.

 select company_name, round(avg(amount),2) as media
 from transactions.transaction
	LEFT JOIN transactions.company on (transaction.company_id = company.id)
where declined = 0
group by company_name
order by media desc
limit 1;

-- La compañía con mayor media de compras es Eget Ipsum LTd con 481.86 he usado el filtro declined = 0 para escoger transciones efectuadas

# Ejercicio 3
#3.1 Mostra totes les transaccions realitzades per empreses d'Alemanya.
 select *
 from transactions.transaction
 where company_id IN (
					select id
                    from transactions.company
                    where country= 'Germany');
                    
#3.2 Llista les empreses que han realitzat transaccions per un amount superior a la mitjana de totes les transaccions.

select company_name 
from transactions.company
where id in (
			select company_id
            from transactions.transaction
            where amount > (
							select avg(amount)
							from transactions.transaction))
order by company_name;
# para este ejercicio no he usado el filtro where declined=0 ya que piden todas las transacciones más allà de que haya cobrado o no cobrado la empresa

#3.3 Eliminaran del sistema les empreses que no tenen transaccions registrades, entrega el llistat d'aquestes empreses.

select id, company_id
from transactions.transaction
where company_id not in (
						select id
                        from transactions.company);
                        
