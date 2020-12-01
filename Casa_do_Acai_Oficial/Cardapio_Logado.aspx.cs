using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class Cardapio_Logado : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    DataTable listaDescripto = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            Response.Redirect("Cardapio_NaoLogado.aspx");

        else
            return;
    }

    protected void imbAcai_Click(object sender, ImageClickEventArgs e)
    {
        CarregarProduto(1);
        gvProduto.Visible = true;        
    }

    protected void imbSacole_Click(object sender, ImageClickEventArgs e)
    {
        CarregarProduto(2);
        gvProduto.Visible = true;
    }

    protected void imbGeladinho_Click(object sender, ImageClickEventArgs e)
    {
        CarregarProduto(3);
        gvProduto.Visible = true;
    }

    protected void ImbSorvete_Click(object sender, ImageClickEventArgs e)
    {
        CarregarProduto(4);
        gvProduto.Visible = true;
    }

    protected void imbPicole_Click(object sender, ImageClickEventArgs e)
    {
        CarregarProduto(5);
        gvProduto.Visible = true;
    }

    protected void ImbCremosinho_Click(object sender, ImageClickEventArgs e)
    {
        CarregarProduto(6);
        gvProduto.Visible = true;
    }

    protected void gvProduto_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvProduto.PageIndex = e.NewPageIndex;
        CarregarProduto((int)Session["tipoProd"]);
    }

    protected void gvProduto_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id;
        string dataKey;

        foreach (GridViewRow linha in gvProduto.Rows)
        {
            if (linha.RowState == (DataControlRowState.Alternate|DataControlRowState.Selected))
                linha.RowState = DataControlRowState.Selected;

            if (linha.RowState == DataControlRowState.Selected)
            {
                dataKey = gvProduto.DataKeys[linha.RowIndex].Values["id_prod"].ToString();
                id = Convert.ToInt32(dataKey);

                Session["idProd"] = id;
                linha.RowState = DataControlRowState.Normal;
                break;
            }
        }        

        Response.Redirect("Detalhes_Pedido.aspx");
    }

    private void CarregarProduto(int tipoProd)
    {
        if (Session["tipoProd"] != null)
        {
             if (tipoProd != (int)Session["tipoProd"])
                gvProduto.PageIndex = 0;
        }

        listaDescripto.Columns.Add("id_prod", typeof(int));
        listaDescripto.Columns.Add("nome_prod", typeof(string));
        listaDescripto.Columns.Add("id_tipoProd", typeof(int));
        listaDescripto.Columns.Add("tam_prod", typeof(string));
        listaDescripto.Columns.Add("preco_prod", typeof(double));

        DataView listaProd;

        listaProd = (DataView)DSProduto.Select(DataSourceSelectArguments.Empty);

        listaDescripto.DefaultView.RowFilter = "id_tipoProd = '" + tipoProd + "'";

        for (int i = 0; i < listaProd.Table.Rows.Count; i++)
        {
            DataRow linha = listaDescripto.NewRow();

            linha["id_prod"] = listaProd.Table.Rows[i]["id_prod"].ToString();
            linha["nome_prod"] = cripto.Decrypt(listaProd.Table.Rows[i]["nome_prod"].ToString());
            linha["id_tipoProd"] = listaProd.Table.Rows[i]["id_tipoProd"].ToString();
            linha["tam_prod"] = cripto.Decrypt(listaProd.Table.Rows[i]["tam_prod"].ToString());
            linha["preco_prod"] = cripto.Decrypt(listaProd.Table.Rows[i]["preco_prod"].ToString()).Replace('.', ',');

            listaDescripto.Rows.Add(linha);
        }

        gvProduto.DataSource = listaDescripto;
        gvProduto.DataBind();

        Session["tipoProd"] = tipoProd;
    }
}