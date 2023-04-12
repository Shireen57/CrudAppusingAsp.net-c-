using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientDetails
{
    public partial class ClientsForm : System.Web.UI.Page
    {
        CustomerEntities4 ce = new CustomerEntities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindRepeaterData();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (Clientfnam.Text == "" ||
            Clientlnam.Text == "" ||
            Clientcnic.Text == "" ||
            ClientDOB.Text == "" ||
            ClientAdd.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please fill all the fields');", true);
            }
            else
            {


                using (var ce2 = new CustomerEntities4())
                {

                    _ = ce2.SetClient(null, Clientfnam.Text, Clientlnam.Text, Clientcnic.Text, Convert.ToDateTime(ClientDOB.Text), ClientAdd.Text);

                    ce2.SaveChanges();
                }


                BindRepeaterData();
            }
        }


        protected void repEmployeeDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            switch (e.CommandName)
            {


                case ("Delete"):

                    int id = Convert.ToInt32(e.CommandArgument);


                    ce.clientDel(id);

                    BindRepeaterData();

                    break;
                case ("Edit"):
                    int Id = Convert.ToInt32(e.CommandArgument);
                    using (CustomerEntities4 entities = new CustomerEntities4())
                    {
                        var record = entities.clientGetid(Id).FirstOrDefault();
                        if (record != null)
                        {
                            upId.Text = Convert.ToString(record.Clientid);
                            upfnam.Text = record.FirstName;
                            uplnam.Text = record.LastName;
                            upcnic.Text = record.CNIC;
                            updob.Text = Convert.ToString(record.DOB).Remove(10);
                            upadd.Text = record.Address;
                        }
                    }
                    BindRepeaterData();
                    break;

            }
        }
        public void BindRepeaterData()
        {
            Repeater2.DataSource = ce.clientGet().ToList();
            Repeater2.DataBind();
        }

        protected void modal_Click(object sender, EventArgs e)
        {
            string script = "$('#mymodal').modal('show');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
        }

        protected void update_Click(object sender, EventArgs e)
        {
            using (var ce2 = new CustomerEntities4())
            {
                _ = ce2.SetClient(Convert.ToInt32(upId.Text), upfnam.Text, uplnam.Text, upcnic.Text, Convert.ToDateTime(updob.Text), upadd.Text);
                ce2.SaveChanges();
            }
            BindRepeaterData();

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {

            Clientfnam.Text = string.Empty;
            Clientlnam.Text = string.Empty;
            Clientcnic.Text = string.Empty;
            ClientDOB.Text = string.Empty;
            ClientAdd.Text = string.Empty;

        }
    }
}