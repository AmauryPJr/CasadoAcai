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
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            return;

        else if (Session["logado"].Equals("Entrou"))
            Response.Redirect("Menu_Logado.aspx");

        else
            return;
    }
}