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

        carrinho.Columns.Add("nome_prod");
        carrinho.Columns.Add("adicional");
        carrinho.Columns.Add("qtd_it");
        carrinho.Columns.Add("preco_prod");
        carrinho.Columns.Add("total_ped");

        DataView listaCarrinho;
        listaCarrinho = (DataView)DSCarrinho.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < listaCarrinho.Table.Rows.Count; i++)
        {
            foreach (GridView gLinha in gvCarrinho.Rows)
            {
                Image imgProduto = new Image();

                string tipoProd = cripto.Decrypt(listaCarrinho.Table.Rows[0]["nome_tipo"].ToString());

                switch (tipoProd)
                {
                    case "Açaí":
                        imgProduto.ImageUrl = "~/Imagens/Acai.png";
                        break;

                    case "Sacolé":
                        imgProduto.ImageUrl = "~/Imagens/Sacole.png";
                        break;

                    case "Geladinho":
                        imgProduto.ImageUrl = "~/Imagens/Geladinho.png";
                        break;

                    case "Sorvete":
                        imgProduto.ImageUrl = "~/Imagens/Sorvete.png";
                        break;

                    case "Picolé":
                        imgProduto.ImageUrl = "~/Imagens/Picole.png";
                        break;

                    case "Cremosinho":
                        imgProduto.ImageUrl = "~/Imagens/Cremosinho.png";
                        break;
                }

                Session["imagem"] = imgProduto.ImageUrl;
            }

            DataRow rLinha = listaDescripto.NewRow();

            rLinha["qtd_it"]     = cripto.Decrypt(listaCarrinho.Table.Rows[i]["qtd_it"].ToString());
            rLinha["nome_prod"]  = cripto.Decrypt(listaCarrinho.Table.Rows[i]["nome_prod"].ToString());
            rLinha["adicional"]  = cripto.Decrypt(listaCarrinho.Table.Rows[i]["adicional"].ToString());
            rLinha["preco_prod"] = cripto.Decrypt(listaCarrinho.Table.Rows[i]["preco_prod"].ToString());
            rLinha["total_ped"]  = cripto.Decrypt(listaCarrinho.Table.Rows[i]["total_ped"].ToString());

            carrinho.Rows.Add(rLinha);
        }

        gvCarrinho.DataSource = carrinho;
        gvCarrinho.DataBind();
    }
}