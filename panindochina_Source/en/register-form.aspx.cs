using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI.AutoCompleteBox;
using TLLib;

public partial class register_form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (DropDownList)sender;
        cbo.Items.Insert(0, new ListItem(""));
    }
    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        var strEmail = txtEmail.Text;
        
        if (!string.IsNullOrEmpty(strEmail))
        {
            if (Membership.FindUsersByEmail(strEmail).Count > 0)
            {
                CustomValidator1.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> đã tồn tại!";
                CustomValidator1.IsValid = false;
                lblCheckEmail.Text = "";
            }
            else
            {
                CustomValidator1.IsValid = true;
                lblCheckEmail.Text = "Email <b>\"" + strEmail + "\"</b> có thể sử dụng.";
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {
                Membership.CreateUser(txtEmail.Text.Trim(), "123456", txtEmail.Text.Trim());
                Roles.AddUserToRole(txtEmail.Text.Trim(), "user");
                var oUserProfile = new AddressBook();
                oUserProfile.AddressBookInsert2(
                    txtFullName.Text.Trim(),
                    "",
                    txtEmail.Text.Trim(),
                    txtEmail2.Text.Trim(),
                    txtCompanyPhone.Text.Trim(),
                    txtCellPhone.Text.Trim(),
                    "",
                    txtEmail.Text.Trim(),
                    txtCompanyName.Text.Trim(),
                    txtCompanyAddress.Text.Trim(),
                    "",
                    "",
                    "",
                    "",
                    listProvince.SelectedValue.ToString(),
                    listDistrict.SelectedValue.ToString(),
                    "",
                    "",
                    "",
                    "user",
                    radioGender.SelectedValue,
                    "",
                    listEndUser.SelectedItem.Text.Trim(),
                    listTrading.SelectedItem.Text.Trim(),
                    listService.SelectedItem.Text.Trim(),
                    listTrainer.SelectedItem.Text.Trim(),
                    listSafetyOrg.SelectedItem.Text.Trim(),
                    txtOther.Text.Trim(),
                    listCompanyIndustry.SelectedItem.Text.Trim(),
                    txtTermsConditions.Text.Trim(),
                    DateTime.Now.AddDays(7).ToShortDateString(),
                    ""
                    );

                txtFullName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtEmail2.Text = string.Empty;
                txtConfirmEmail.Text = string.Empty;
                txtCompanyPhone.Text = string.Empty;
                txtCellPhone.Text = string.Empty;
                txtCompanyName.Text = string.Empty;
                txtCompanyAddress.Text = string.Empty;
                lblCheckEmail.Text = string.Empty;
                txtOther.Text = string.Empty;
                txtTermsConditions.Text = string.Empty;
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "alert('Bạn đã đăng ký thành công!')", true);
                //lblMessage.Text = "Đăng ký thành công !";
            }
            
        }
        //else
        //{
        //    lblMessage.Text = "Chuỗi xác nhận chưa đúng !";
        //}
    }
}