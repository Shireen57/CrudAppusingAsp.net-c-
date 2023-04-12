using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientDetails
{
    public partial class Order : System.Web.UI.Page
    {
        CustomerEntities4 ce = new CustomerEntities4();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindRepeaterData();



            }

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {

            txtordrcd.Text = string.Empty;
            txtclientid.Text = string.Empty;
            txtdated.Text = string.Empty;
            txtnotes.Text = string.Empty;


        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (
            txtordrcd.Text == "" ||
            txtclientid.Text == "" ||
            txtdated.Text == "" ||
            txtnotes.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please fill all the fields');", true);
            }
            else
            {
                using (var ce = new CustomerEntities4())
                {
                    _ = ce.SetOrder(null, txtordrcd.Text, Convert.ToInt32(txtclientid.Text), Convert.ToDateTime(txtdated.Text), txtnotes.Text);
                    _ = ce.SaveChanges();
                }
                BindRepeaterData();
            }
        }
        protected void order_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            switch (e.CommandName)
            {


                case ("Delete"):

                    int id = Convert.ToInt32(e.CommandArgument);


                    ce.delorder(id);

                    BindRepeaterData();

                    break;
                case ("Edit"):
                    int Id = Convert.ToInt32(e.CommandArgument);
                    using (CustomerEntities4 entities = new CustomerEntities4())
                    {
                        var record = entities.GetOrderid(Id).SingleOrDefault();
                        if (record != null)
                        {
                            upId.Text = Convert.ToString(record.Clientid);
                            upocod.Text = record.OrderCode;
                            upcid.Text = Convert.ToString(record.Clientid);
                            updat.Text = Convert.ToString(record.Dated).Remove(10);
                            upnot.Text = record.Notes;
                        }
                    }
                    BindRepeaterData();

                    break;

            }
        }
        public void BindRepeaterData()
        {

            OrderRep.DataSource = ce.GetOrder().ToList();
            OrderRep.DataBind();

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
                _ = ce2.SetOrder(Convert.ToInt32(upId.Text), upocod.Text, Convert.ToInt32(upcid.Text), Convert.ToDateTime(updat.Text), upnot.Text);
                ce2.SaveChanges();
            }
            BindRepeaterData();

        }
    }
}