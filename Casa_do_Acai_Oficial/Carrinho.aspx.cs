using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Carrinho : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    DataTable listaDescripto = new DataTable();

    private bool AumentarQtd = false;
    private bool DiminuirQtd = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        CarregarCarrinho();
    }
    
    protected void btnMenos_Click(object sender, EventArgs e)
    {
        DiminuirQtd = true;
        AumentarQtd = false;
        Quantidade();
    }

    protected void btnMais_Click(object sender, EventArgs e)
    {
        AumentarQtd = true;
        DiminuirQtd = false;
        Quantidade();
    }

    private void CarregarCarrinho()
    {
        DataTable carrinho = new DataTable();

        carrinho.Columns.Add("Imagem");
        carrinho.Columns.Add("Produto");
        carrinho.Columns.Add("Adicional");
        carrinho.Columns.Add("Total Unitário");
        carrinho.Columns.Add("Total do Produto");
    }

    private void Quantidade()
    {
        int qtd = 0;

        foreach (GridViewRow linha in gvCarrinho.Rows)
        {
            Button btnMais, btnMenos;
            Label lblQtd;

            btnMais = (Button)linha.FindControl("btnMais");
            btnMenos = (Button)linha.FindControl("btnMenos");
            lblQtd = (Label)linha.FindControl("lblQtd");

            if (AumentarQtd == true)
            {
                qtd++;

                lblQtd.Text = qtd.ToString();
            }

            if (DiminuirQtd == true)
            {
                qtd--;

                lblQtd.Text = qtd.ToString();
            }
        }        
    }
}