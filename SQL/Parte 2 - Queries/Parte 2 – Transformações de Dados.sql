/*Crie uma consulta SQL com os seguintes requisitos para as pedidos de compra e vendas:
1. Concatenar os campos produto_id e descricao_produto (onde houver) no formato;
2. Transformar o campo de datas para o formato `DD/MM/YYYY`;
3. Retornar os dados filtrando apenas os produtos requisitados mais de 10 vezes no período.*/

--Query para pedido_compra

select concat(p.produto_id, ' - ', p.descricao_produto) as "Produto", to_char(p.data_pedido, 'DD/MM/YYYY') as "Data do Pedido",
sum(p.qtde_pedida) as "Quantidade Requisitada"
from pedido_compra p
where p.data_pedido between '2025-01-01' and '2025-03-31'
group by p.produto_id, p.descricao_produto, p.data_pedido
having sum(p.qtde_pedida) > 10;

--Query para venda

select v.produto_id as "Produto", TO_CHAR(v.data_emissao, 'DD/MM/YYYY') as "Data da venda",
SUM(v.qtde_vendida) as "Quantidade Vendida"
from venda v
where v.data_emissao between '2025-01-01' and '2025-03-31'
group by v.produto_id, v.data_emissao
having SUM(v.qtde_vendida) > 10;
