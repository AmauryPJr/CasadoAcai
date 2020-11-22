using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contato : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            lSair.Text = GerarNavSair();

        else
        {
            lCarrinho.Text = GerarNavCarrinho();
            lSair.Text = GerarNavSair();
            lPerfil.Text = GerarNavPerfil();
        }
    }

    public string GerarNavCarrinho()
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendLine("<a class='nav-link' id='btn5' href='Carrinho.aspx' onclick='mudarCor('btn4')'>CARRINHO</a>");

        return sb.ToString();
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

    public string GerarNavPerfil()
    {
        StringBuilder sbPefil = new StringBuilder();

        sbPefil.AppendLine("<a class='nav-link' id='btn5' href='Perfil.aspx' onclick='mudarCor('btn4')>PERFIL</a>'");
        return sbPefil.ToString();
    }
}