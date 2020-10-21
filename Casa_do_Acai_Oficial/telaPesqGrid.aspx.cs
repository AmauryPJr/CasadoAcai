using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class telaPesqGrid : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    // criar uma tabela de info´s descriptografadas
    DataTable listaDescripto = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnOK_Click(object sender, EventArgs e)
    {
        carregarGrid();
        carregarGrid2();
    }

    private void carregarGrid()
    {
       
        //criando as colunas - SEMPRE USAR O TIPO CORRETO NAS COLUNAS
        listaDescripto.Columns.Add("id_produto", typeof(int));
        listaDescripto.Columns.Add("descricao", typeof(String));
        listaDescripto.Columns.Add("preco", typeof(double));
        listaDescripto.Columns.Add("qtd_estoque", typeof(int));
        listaDescripto.Columns.Add("data_validade", typeof(DateTime));
        listaDescripto.Columns.Add("foto", typeof(String));

        // carregar os dados criptografados - da tabela
        DataView listaProdutos;
        listaProdutos = (DataView)sqlProduto.Select(DataSourceSelectArguments.Empty);

        // LINHA PARA O FILTRO DE DADOS
        listaDescripto.DefaultView.RowFilter = "descricao like '" + txtPesq.Text + "%'";

        for (int i = 0; i < listaProdutos.Table.Rows.Count; i++)
        {
            DataRow linha = listaDescripto.NewRow();

            linha["id_produto"] = listaProdutos.Table.Rows[i]["id_produto"].ToString();
            linha["descricao"] = cripto.Decrypt(listaProdutos.Table.Rows[i]["descricao"].ToString());
            linha["preco"] = cripto.Decrypt(listaProdutos.Table.Rows[i]["preco"].ToString());
            linha["qtd_estoque"] = cripto.Decrypt(listaProdutos.Table.Rows[i]["qtd_estoque"].ToString());
            linha["data_validade"] = cripto.Decrypt(listaProdutos.Table.Rows[i]["data_validade"].ToString());
            linha["foto"] = cripto.Decrypt(listaProdutos.Table.Rows[i]["foto"].ToString());

            listaDescripto.Rows.Add(linha);
        }

        gvExibir1.DataSource = listaDescripto;
        gvExibir1.DataBind();

        // armazenando a lista de dados descriptografados em uma SESSION
        Session["listaDescripto"] = listaDescripto;
    }

    protected void gvExibir1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // carregando a lista da SESSION
        DataTable listaDescriptoSession = (DataTable)Session["listaDescripto"];

        // armazenando a linha selecionada
        int linha = gvExibir1.SelectedIndex;

        // exibindo o ID do produto
        lblCodigo.Text = listaDescriptoSession.Rows[linha]["id_produto"].ToString();
            
        // NAO FUNCIONA POIS O CONTEÚDO DO GRID ESTÁ NA VARIÁVEL LISTADESCRIPTO
        //gvExibir1.Rows[gvExibir1.SelectedIndex].Cells[1].Text;
    }

    public void carregarGrid2()
    {
        // criando uma tabela para os dados descripto
        DataTable listaDescripto2 = new DataTable();

        // criando uma UNICA coluna
        listaDescripto2.Columns.Add("Produto", typeof(String));

        // carregar os dados criptografados - da tabela
        DataView listaProdutos;
        listaProdutos = (DataView)sqlProduto.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i<listaProdutos.Table.Rows.Count; i++)
        {
            DataRow linha = listaDescripto2.NewRow();

            double preco = Convert.ToDouble(cripto.Decrypt(listaProdutos.Table.Rows[i]["preco"].ToString()));

            linha["Produto"] = "Nome: " + cripto.Decrypt(listaProdutos.Table.Rows[i]["descricao"].ToString()) 
                + " - R$ " + preco.ToString("#0.00");

            listaDescripto2.Rows.Add(linha);
        }

        gvExibir2.DataSource = listaDescripto2;
        gvExibir2.DataBind();

        //armazenar em uma SESSION
        Session["listaDescriptoSession2"] = listaDescripto2;
    }

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        // carregar os dados criptografados - da tabela
        DataView listaProdutos;
        listaProdutos = (DataView)sqlProduto.Select(DataSourceSelectArguments.Empty);

        foreach (GridViewRow linha in gvExibir2.Rows)
        {
            CheckBox chkOP;

            chkOP = (CheckBox) linha.FindControl("chkOP");

            if (chkOP.Checked == true)
            {
                //linha selecionado pelo usuário
                int linhaSelecionada = linha.DataItemIndex;

                // id do item que o usuário selecionou
                Session["idProduto"] = listaProdutos.Table.Rows[linhaSelecionada]["id_produto"].ToString();

                // executar o DELETE
                sqlProduto2.Delete();
            }
        }

        carregarGrid2();
    }
}