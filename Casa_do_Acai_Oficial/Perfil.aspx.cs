using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ServicoCorreios;

public partial class Perfil : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("ETEP");

    DataTable listaDescripto = new DataTable();

    AtendeClienteClient sc = new AtendeClienteClient("AtendeClientePort");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] == null || Session["logado"].Equals("Saiu"))
            Response.Redirect("Menu.aspx");

        else
            CarregarCliente();

        if (IsPostBack)
            txtSenha.Attributes["value"] = txtSenha.Text;
    }

    protected void btnValidarSenha_Click(object sender, EventArgs e)
    {
        int qtd_Letras = 0;
        int cont = 0;
        int cont_Maius = 0, cont_Minus = 0, cont_Num = 0, cont_Simb = 0;

        qtd_Letras = txtSenha.Text.Length;


        //Para o evento se a qtd de carácteres
        //for maior que 16 

        if (qtd_Letras > 16)
        {
            Response.Write("<script>alert('O limite máximo é de 16 caracteres.');</script>");
            return;
        }

        if (qtd_Letras < 8)
        {
            Response.Write("<script>alert('A senha deve ter no mínimo 8 caracteres.');</script>");
            return;
        }

        //Contadores de carácteres maiúsculos, minúsculos
        //Números e simbolos

        while (cont < qtd_Letras)
        {
            if (char.IsUpper(txtSenha.Text[cont]))
                cont_Maius++;

            else
            {
                if (char.IsLower(txtSenha.Text[cont]))
                    cont_Minus++;

                else
                {
                    if (char.IsNumber(txtSenha.Text[cont]))
                        cont_Num++;

                    else
                    {
                        if (char.IsSymbol(txtSenha.Text[cont]) || char.IsPunctuation(txtSenha.Text[cont]))
                            cont_Simb++;
                    }
                }

            }

            cont++;
        }

        //Senha Forte

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaForte();
        }

        //Senha Média

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaMedia();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaMedia();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaMedia();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaMedia();
        }

        //Senha Fraca com mais de 8 carácteres

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont >= 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont >= 8)
        {
            SenhaFraca();
        }

        //Senha Fraca com menos de 8 carácteres

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius > 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus > 0 &&
            cont_Num == 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num > 0 && cont_Simb == 0 && cont < 8)
        {
            SenhaFraca();
        }

        if (cont_Maius == 0 && cont_Minus == 0 &&
            cont_Num == 0 && cont_Simb > 0 && cont < 8)
        {
            SenhaFraca();
        }
    }

    protected void btnValidarCEP_Click(object sender, EventArgs e)
    {
        var dados = sc.consultaCEP(txtCEP.Text);

        if (dados != null)
        {
            string endereco = "" + dados.end + ", " + dados.bairro + " " + dados.cidade + " - " + dados.uf + "";
            Response.Write("<script>confirm('Confirma o seu Endereço: " + endereco + "')</script>");
        }
        else
        {
            Response.Write("<script>alert('CEP Incorreto. Coloque um CEP válido !');</script>");
        }

        string script = "$('.step-1').attr('hidden', 'hidden'); " +
                    "$('.step-2').removeAttr('hidden'); " +
                    "$('.step-3').attr('hidden', 'hidden');";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", script, true);
    }

    protected void btnValidarCPF_Click(object sender, EventArgs e)
    {
        if (Validacao.ValidarCPF(txtCPF.Text) == true)
        {
            Response.Write("<script>alert('CPF é Válido !');</script>");
            txtCPF.Text = Validacao.FormatarCPF(txtCPF.Text);
        }

        else
        {
            Response.Write("<script>alert('CPF Inválido. Coloque um CPF válido !');</script>");
        }
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        Session["nomeCli"] = txtNome.Text;

        DSPerfil.UpdateParameters["NOME"].DefaultValue = cripto.Encrypt(txtNome.Text);
        DSPerfil.UpdateParameters["TELEFONE"].DefaultValue = cripto.Encrypt(txtTelefone.Text);
        DSPerfil.UpdateParameters["CEP"].DefaultValue = cripto.Encrypt(txtCEP.Text);
        DSPerfil.UpdateParameters["NUMERO"].DefaultValue = cripto.Encrypt(txtNumero.Text);

        if (txtComplemento.Text != "")
        {
            DSPerfil.UpdateParameters["COMPLEMENTO"].DefaultValue = cripto.Encrypt(txtComplemento.Text);
        }
        else
        {
            DSPerfil.UpdateParameters["COMPLEMENTO"].DefaultValue = cripto.Encrypt("");
        }

        string genero = "";

        if (ddlGenero.SelectedIndex == 0)
        {
            genero = "F";
        }

        if (ddlGenero.SelectedIndex == 1)
        {
            genero = "M";
        }

        if (ddlGenero.SelectedIndex == 2)
        {
            genero = "PND";
        }

        DSPerfil.UpdateParameters["GENERO"].DefaultValue = cripto.Encrypt(genero);
        DSPerfil.UpdateParameters["DATANASC"].DefaultValue = cripto.Encrypt(txtDataNasc.Text);
        DSPerfil.UpdateParameters["EMAIL"].DefaultValue = cripto.Encrypt(txtEmail.Text);
        DSPerfil.UpdateParameters["CPF"].DefaultValue = cripto.Encrypt(txtCPF.Text);
        DSPerfil.UpdateParameters["SENHA"].DefaultValue = cripto.Encrypt(txtSenha.Text);

        DSPerfil.Update();

        Response.Write("<script>alert('Seu perfil foi Alterado com Sucesso !')</script>");

        string script = "$('.step-1').removeAttr('hidden'); " +
                    "$('.step-2').attr('hidden', 'hidden'); " +
                    "$('.step-3').attr('hidden', 'hidden');";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "", script, true);
    }

    public void CarregarCliente()
    {
        DataView perfil;

        DSPerfil.SelectParameters["IDCLI"].DefaultValue = Session["idCli"].ToString();

        perfil = (DataView)DSPerfil.Select(DataSourceSelectArguments.Empty);

        if (perfil.Table.Rows.Count > 0)
        {
            string genero = cripto.Decrypt(perfil.Table.Rows[0]["gen_cli"].ToString());

            string data = cripto.Decrypt(perfil.Table.Rows[0]["dtnasc_cli"].ToString());
            DateTime dataFormat = Convert.ToDateTime(data);

            if (genero == "F")
                ddlGenero.SelectedValue = "F";

            if (genero == "M")
                ddlGenero.SelectedValue = "M";

            if (genero == "PND")
                ddlGenero.SelectedValue = "PND";

            txtNome.Text    = cripto.Decrypt(perfil.Table.Rows[0]["nome_cli"].ToString());
            txtCPF.Text     = cripto.Decrypt(perfil.Table.Rows[0]["cpf_cli"].ToString());
            txtEmail.Text   = cripto.Decrypt(perfil.Table.Rows[0]["email_cli"].ToString());
            txtSenha.Text   = cripto.Decrypt(perfil.Table.Rows[0]["senha_cli"].ToString());
            txtCEP.Text     = cripto.Decrypt(perfil.Table.Rows[0]["cep_cli"].ToString());
            txtNumero.Text  = cripto.Decrypt(perfil.Table.Rows[0]["num_cli"].ToString());

            if (perfil.Table.Rows[0]["comp_cli"].ToString() == "")
                txtComplemento.Text = "";

            else
                txtComplemento.Text = (perfil.Table.Rows[0]["comp_cli"].ToString());

            txtTelefone.Text = cripto.Decrypt(perfil.Table.Rows[0]["tel_cli"].ToString());
            txtDataNasc.Text = dataFormat.ToShortDateString();
        }
    }

    public void SenhaForte()
    {
        Response.Write("<script>alert('A sua senha é Forte. Clique em Próximo para prossegir com o Cadastro !');</script>");

        btnAlterar.Enabled = true;
    }

    public void SenhaMedia()
    {
        Response.Write("<script>alert('A sua senha é Média. Tente uma Senha um pouco mais Forte !');</script>");

        txtSenha.Attributes["value"] = "";
    }

    public void SenhaFraca()
    {
        Response.Write("<script>alert('A sua senha é Fraca. Tente uma Senha mais Forte !')</script>");

        txtSenha.Attributes["value"] = "";
    }    
}