using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    private void sendEmail()
    {
        string msg = "<h3>PANINDOCHINA: CONTACT</h3><br/>";
        msg += "<b>Subject: </b>" + txtSubject.Text.Trim().ToString() + "<br />";
        msg += "<b>Specific Requirements: </b>" + txtRequirements.Text.Trim().ToString() + "<br />";
        msg += "<b>Company Name: </b>" + txtCompany.Text.Trim().ToString() + "<br />";
        msg += "<b>Address: </b>" + txtAddress.Text.Trim().ToString() + "<br />";
        msg += "<b>Province: </b>" + dropProvince.SelectedItem.Text + "<br />";
        msg += "<b>Business Type: </b>" + dropBusiness.SelectedItem.Text + "<br />";
        msg += "<b>First Name: </b>" + txtFirstName.Text.Trim().ToString() + "<br />";
        msg += "<b>Last Name: </b>" + txtLastName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Tel: </b>" + txtTel.Text.Trim().ToString() + "<br />";
        msg += "<b>Cellphone: </b>" + txtCellPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Fax: </b>" + txtFax.Text.Trim().ToString() + "<br />";
        Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "CONTACT PANINDOCHINA", msg, true);
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //if (MyCaptcha1.IsValid)
            //{

                //send email         
                sendEmail();
                lblMessage.Text = "Cám ơn bạn đã liên lạc với chúng tôi. Thông báo của bạn đã được gửi đi. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                lblMessage.Visible = true;
                //lblCheckResult.Text = "";
                //
                //Clear text
                //
                txtSubject.Text = "";
                txtRequirements.Text = "";
                txtCompany.Text = "";
                txtAddress.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtEmail.Text = "";
                txtTel.Text = "";
                txtCellPhone.Text = "";
                txtFax.Text = "";
            //}
            //else
            //{
            //    //lblCheckResult.Text = "Chuỗi xác nhận chưa đúng !";
            //}
        }
    }
}