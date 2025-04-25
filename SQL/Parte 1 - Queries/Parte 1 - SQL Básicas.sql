/*1.1 – Consumo por produto e mês
Monte uma consulta que traga o total de consumo de cada produto no mês de fevereiro de 2025*/

select produto_id as "Produto", sum(qtde_vendida) as "Total de Consumo" from venda where data_emissao BETWEEN '2025-02-01' AND '2025-02-28' group by produto_id;

/*1.2 – Produtos com requisição pendente
Crie uma consulta para listar os produtos que foram requisitados, mas não recebidos*/

select p.descricao_produto as "Produtos Requisitados", coalesce(e.descricao_produto, 'Não recebido') as "Foram recebidos?" 
from public.entradas_mercadoria e right join public.pedido_compra p
on e.ordem_compra = p.ordem_compra;

/*1.3 – Produtos não consumidos e não recebidos
Monte uma consulta para listar produtos que foram requisitados, mas não consumidos e não recebidos, no mês de fevereiro de 2025*/

select p.produto_id as "Identificação do Produto", p.descricao_produto as "Produtos", p.data_pedido as "Data do Pedido"
from pedido_compra p left join entradas_mercadoria e on p.ordem_compra = e.ordem_compra and p.produto_id = e.produto_id
left join venda v on p.produto_id = v.produto_id and v.data_emissao between '2025-02-01' and '2025-02-28'
where p.data_pedido between '2025-02-01' and '2025-02-28'
and e.produto_id is null and v.produto_id is null;

