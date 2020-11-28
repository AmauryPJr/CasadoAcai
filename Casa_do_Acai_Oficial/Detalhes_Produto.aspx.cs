using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Detalhes_Produto : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    DataTable listaDescripto = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adm"] == null || Session["adm"].Equals("Saiu"))
            Response.Redirect("Menu.aspx");

        else
        {
            if (!IsPostBack)
                CarregarDetalhes();
        }            
    }

    public void CarregarDetalhes()
    {
        DataView detalhes = (DataView)DSDetalhes.Select(DataSourceSelectArguments.Empty);

        string tipoProd = cripto.Decrypt(detalhes.Table.Rows[0]["nome_tipo"].ToString());
        double preco = Convert.ToDouble(cripto.Decrypt(detalhes.Table.Rows[0]["preco_prod"].ToString()).Replace('.',','));
        string tamanho = cripto.Decrypt(detalhes.Table.Rows[0]["tam_prod"].ToString());

        switch (tipoProd)
        {
            case "Açaí":
                imgProd.ImageUrl = "~/Imagens/Acai.png";
                break;

            case "Sacolé":
                imgProd.ImageUrl = "~/Imagens/Sacole.png";
                break;

            case "Geladinho":
                imgProd.ImageUrl = "~/Imagens/Geladinho.png";
                break;

            case "Sorvete":
                imgProd.ImageUrl = "~/Imagens/Sorvete.png";
                break;

            case "Picolé":
                imgProd.ImageUrl = "~/Imagens/Picole.png";
                break;

            case "Cremosinho":
                imgProd.ImageUrl = "~/Imagens/Cremosinho.png";
                break;
        }

        txtNome.Text = cripto.Decrypt(detalhes.Table.Rows[0]["nome_prod"].ToString());
        txtPreco.Text = preco.ToString("C");
        
        if (tamanho == "")
            txtTamanho.Text = "Não Unitário";

        else
            txtTamanho.Text = tamanho;
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        char[] rs = { 'R', '$' };

        string preco = txtPreco.Text.TrimStart(rs).Replace(',','.');
        string tamanho = txtTamanho.Text;

        DSAlterar.UpdateParameters["NOME"].DefaultValue = cripto.Encrypt(txtNome.Text);
        DSAlterar.UpdateParameters["PRECO"].DefaultValue = cripto.Encrypt(preco);
        //DSAlterar.UpdateParameters["TAMANHO"].DefaultValue = 
    }
}