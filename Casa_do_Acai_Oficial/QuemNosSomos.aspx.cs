using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuemNosSomos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            lSair.Text = GerarNavSair();

        else
        {
            lCarrinho.Text = GerarNavCarrinho();
            lSair.Text     = GerarNavSair();
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
}