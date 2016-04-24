using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class customer_being : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            string[] roleUser = Roles.GetRolesForUser(Session["UserName"].ToString());
            for (int i = 0; i < roleUser.Length; i++)
            {
                if (roleUser[i] == "admin")
                {
                    Response.Redirect("ad/bilingual/");
                }
                else
                {
                    Response.Redirect("~/vn/technicaleducation.aspx");
                }
            }
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string UserName = txtUserName.Text;
        MembershipUser mu = Membership.GetUser(UserName);
        var oUserProfile = new AddressBook();
        var dv = oUserProfile.UserProfileSelectAll_AddressBook(UserName, "", "user", "", "", "", "", "", "", "", "", "", "", "",
            "", "", "").DefaultView;

        if (dv != null && dv.Count <= 0) return;
        var row = dv[0];
        //Session["PWD"] = Login1.Password;
        if (UserName != null && DateTime.Parse(row["DateActiveUser"].ToString()) > DateTime.Now)
        {
            Session["UserName"] = UserName;
            //Session["IsLogin"] = "True";
            if (Request.QueryString["ReturnURL"] != null)
            {
                Response.Redirect(Request.QueryString["ReturnURL"]);
            }
            else
            {
                string[] roleUser = Roles.GetRolesForUser(UserName.ToString());
                for (int i = 0; i < roleUser.Length; i++)
                {
                    if (roleUser[i] == "admin")
                    {
                        Response.Redirect("ad/bilingual/");
                    }
                    else
                    {
                        Response.Redirect("~/vn/technicaleducation.aspx");
                    }
                }
            }
        }
        //if (chkRemember.Checked)
        //{
        //    Response.Cookies.Clear();

        //    // Set the new expiry date - to thirty days from now
        //    DateTime expiryDate = DateTime.Now.AddDays(30);

        //    // Create a new forms auth ticket
        //    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(2, UserName, DateTime.Now, expiryDate, true, String.Empty);

        //    // Encrypt the ticket
        //    string encryptedTicket = FormsAuthentication.Encrypt(ticket);

        //    // Create a new authentication cookie - and set its expiration date
        //    HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
        //    authenticationCookie.Expires = ticket.Expiration;

        //    // Add the cookie to the response.
        //    Response.Cookies.Add(authenticationCookie);
        //}
    }
}