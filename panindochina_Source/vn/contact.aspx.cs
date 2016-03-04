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
        msg += "<b>Chủ Đề: </b>" + txtSubject.Text.Trim().ToString() + "<br />";
        msg += "<b>Yêu Cầu: </b>" + txtRequirements.Text.Trim().ToString() + "<br />";
        msg += "<b>Tên Công Ty: </b>" + txtCompany.Text.Trim().ToString() + "<br />";
        msg += "<b>Địa Chỉ: </b>" + txtAddress.Text.Trim().ToString() + "<br />";
        msg += "<b>Tỉnh/Thành Phố: </b>" + dropProvince.SelectedItem.Text + "<br />";
        msg += "<b>Loại Hình Doanh Nghiệp: </b>" + dropBusiness.SelectedItem.Text + "<br />";
        msg += "<b>Người Liên Hệ: </b>" + txtContactName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Điện Thoại: </b>" + txtTel.Text.Trim().ToString() + "<br />";
        msg += "<b>Di Động: </b>" + txtCellPhone.Text.Trim().ToString() + "<br />";
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
            txtContactName.Text = "";
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