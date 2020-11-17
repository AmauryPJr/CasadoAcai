using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class Carrinho : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    DataTable listaDescripto = new DataTable();

    private bool AumentarQtd = false;
    private bool DiminuirQtd = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            Response.Redirect("Menu.aspx");

        else
        {
            lCarrinho.Text = GerarNavCarrinho();
            lSair.Text = GerarNavSair();
            CarregarCarrinho();
        }
    }

    public string GerarNavCarrinho()
    {
        StringBuilder sbCarrinho = new StringBuilder();

        sbCarrinho.AppendLine("<a class='nav-link' id='btn5' href='Carrinho.aspx' onclick='mudarCor('btn4')'>CARRINHO</a>");
        return sbCarrinho.ToString();
    }

    public string GerarNavSair()
    {
        StringBuilder sbSair = new StringBuilder();

        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
        {
            sbSair.AppendLine("<a class='nav-link' id='btn5' href='Login.aspx' onclick='mudarCor('btn4')'>LOGIN</a>");
            return sbSair.ToString();
        }

        else
        {
            sbSair.AppendLine("<a class='nav-link' id='btn5' href='Sair.aspx' onclick='mudarCor('btn4')'>SAIR</a>");
            return sbSair.ToString();
        }
    }

    private void CarregarCarrinho()
    {
        DataTable carrinho = new DataTable();

        carrinho.Columns.Add("nome_prod", typeof(String));
        carrinho.Columns.Add("adicional", typeof(String));
        carrinho.Columns.Add("qtd_it", typeof(int));
        carrinho.Columns.Add("preco_prod", typeof(double));
        carrinho.Columns.Add("total_ped", (typeof(double)));
        carrinho.Columns.Add("nome_tipo", (typeof(String)));

        DataView listaCarrinho;
        listaCarrinho = (DataView)DSCarrinho.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < listaCarrinho.Table.Rows.Count; i++)
        {
            DataRow rLinha = carrinho.NewRow();

            string tipo = cripto.Decrypt(listaCarrinho.Table.Rows[i]["adicional"].ToString());

            string add = cripto.Decrypt(listaCarrinho.Table.Rows[i]["adicional"].ToString());
            
            rLinha["nome_prod"]  = cripto.Decrypt(listaCarrinho.Table.Rows[i]["nome_prod"].ToString());

            if (add == "")
                rLinha["adicional"] = "Nenhum";

            else
                rLinha["adicional"] = add;
            
            rLinha["qtd_it"]     = cripto.Decrypt(listaCarrinho.Table.Rows[i]["qtd_it"].ToString());
            rLinha["preco_prod"] = cripto.Decrypt(listaCarrinho.Table.Rows[i]["preco_prod"].ToString()).Replace('.', ',');
            rLinha["total_ped"]  = cripto.Decrypt(listaCarrinho.Table.Rows[i]["total_ped"].ToString());

            carrinho.Rows.Add(rLinha);
        }

        gvCarrinho.DataSource = carrinho;
        gvCarrinho.DataBind();
    }
}