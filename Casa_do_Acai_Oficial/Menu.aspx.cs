using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"].ToString() == "")
        {
            Response.Redirect("Menu_Logado.aspx");
        }
        else { return; }
    }

    protected void btnTelaCadastro_Click(object sender, EventArgs e)
    {
        Response.Redirect("CadastroUsuario.aspx");
    }

    protected void btnTelaLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnProdutos_Click(object sender, EventArgs e)
    {
        Response.Redirect("Produtos.aspx");
    }
}