using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    DataTable listaDescripto = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adm"] == null || Session["adm"].Equals("Saiu"))
            Response.Redirect("Menu.aspx");

        else
            CarregarVenda();
    }

    public void CarregarVenda()
    {
        listaDescripto.Columns.Add("imagem", typeof(String));
        listaDescripto.Columns.Add("nome_prod", typeof(String));
        listaDescripto.Columns.Add("adicional", typeof(String));
        listaDescripto.Columns.Add("qtd_it", typeof(int));
        listaDescripto.Columns.Add("preco_prod", typeof(double));
        listaDescripto.Columns.Add("total_ped", typeof(double));

        DataView venda = (DataView)DSDetalhes.Select(DataSourceSelectArguments.Empty);

        for (int i = 0; i < venda.Table.Rows.Count; i++)
        {
            string tipoProd = cripto.Decrypt(venda.Table.Rows[i]["nome_tipo"].ToString());
            string add = cripto.Decrypt(venda.Table.Rows[i]["adicional"].ToString());
            double totalVenda = Convert.ToDouble(cripto.Decrypt(venda.Table.Rows[i]["valor_vda"].ToString()).Replace('.', ','));
            string forma = cripto.Decrypt(venda.Table.Rows[i]["tipo_forma"].ToString());

            DataRow linha = listaDescripto.NewRow();

            if (tipoProd == "Açaí")
                linha["imagem"] = "~/Imagens/Acai.png";

            if (tipoProd == "Sacolé")
                linha["imagem"] = "~/Imagens/Sacole.png";

            if (tipoProd == "Geladinho")
                linha["imagem"] = "~/Imagens/Geladinho.png";

            if (tipoProd == "Sorvete")
                linha["imagem"] = "~/Imagens/Sorvete.png";

            if (tipoProd == "Picolé")
                linha["imagem"] = "~/Imagens/Picole.png";

            if (tipoProd == "Cremosinho")
                linha["imagem"] = "~/Imagens/Cremosinho.png";


            if (add == "")
                linha["adicional"] = "Nenhum";

            else
                linha["adicional"] = add;


            if (forma == "Dinheiro")
                lblForma.Text = "Dinheiro";

            if (forma == "Cartão de Crédito")
                lblForma.Text = "Cartão de Crédito";

            if (forma == "Cartão de Débito")
                lblForma.Text = "Cartão de Débito";

            linha["nome_prod"] = cripto.Decrypt(venda.Table.Rows[i]["nome_prod"].ToString());
            linha["qtd_it"] = cripto.Decrypt(venda.Table.Rows[i]["qtd_it"].ToString());
            linha["preco_prod"] = cripto.Decrypt(venda.Table.Rows[i]["preco_prod"].ToString()).Replace('.', ',');
            linha["total_ped"] = cripto.Decrypt(venda.Table.Rows[i]["total_ped"].ToString()).Replace('.', ',');

            txtTotalVenda.Text = totalVenda.ToString("C");

            listaDescripto.Rows.Add(linha);
        }

        gvDetalhes.DataSource = listaDescripto;
        gvDetalhes.DataBind();
    }
}