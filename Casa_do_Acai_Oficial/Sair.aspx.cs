using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sair : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            Response.Redirect("Menu_Logado.aspx");

        else
            lCarrinho.Text = GerarNavCarrinho();
    }

    public string GerarNavCarrinho()
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendLine("<a class='nav-link' id='btn5' href='Carrinho.aspx' onclick='mudarCor('btn4')'>CARRINHO</a>");

        return sb.ToString();
    }

    protected void btnSim_Click(object sender, EventArgs e)
    {
        Session["logado"] = "Saiu";
        Response.Redirect("Login.aspx");
    }

    protected void btnNao_Click(object sender, EventArgs e)
    {
        Response.Redirect("Menu_Logado.aspx");
    }
}