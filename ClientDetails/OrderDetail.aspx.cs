using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientDetails
{
    public partial class OrderDetail : System.Web.UI.Page
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
            if (ordrcd.Text == "" ||
            txtordrid.Text == "" ||
            txtprdct.Text == "" ||
            txtqunty.Text == "" ||
            txtamnt.Text == "" ||
            txtnotes.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please fill all the fields');", true);
            }
            else
            {
                using (var ce = new CustomerEntities4())
                {
                    _ = ce.SetOrderdetl(null, Convert.ToInt32(txtordrid.Text), txtprdct.Text, Convert.ToInt32(txtqunty.Text), Convert.ToDouble(txtamnt.Text), txtnotes.Text);

                    ce.SaveChanges();
                }
                BindRepeaterData();
            }
        }

        protected void reporderDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            switch (e.CommandName)
            {


                case ("Delete"):

                    int id = Convert.ToInt32(e.CommandArgument);


                    ce.delorderdt(id);

                    BindRepeaterData();

                    break;
                case ("Edit"):
                    int Id = Convert.ToInt32(e.CommandArgument);
                    using (CustomerEntities4 entities = new CustomerEntities4())
                    {
                        var record = entities.Getordrdtid(Id).FirstOrDefault();
                        if (record != null)
                        {
                            upId.Text = Convert.ToString(record.OrderDetailId);
                            upoid.Text = Convert.ToString(record.OrderId);
                            uprod.Text = record.Product;
                            upqnty.Text = Convert.ToString(record.Quantity);
                            upamnt.Text = Convert.ToString(record.Amount);
                            upnot.Text = record.Notes;
                        }
                    }
                    BindRepeaterData();
                    break;

            }
        }
        protected void btn_reset_Click(object sender, EventArgs e)
        {

            ordrcd.Text = string.Empty;
            txtordrid.Text = string.Empty;
            txtprdct.Text = string.Empty;
            txtqunty.Text = string.Empty;
            txtamnt.Text = string.Empty;
            txtnotes.Text = string.Empty;

        }

        public void BindRepeaterData()
        {
            Repeater2.DataSource = ce.Getordrdt().ToList();
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
                _ = ce2.SetOrderdetl(Convert.ToInt32(upId.Text), Convert.ToInt32(upoid.Text), uprod.Text, Convert.ToInt32(upqnty.Text), Convert.ToDouble(upamnt.Text), upnot.Text);
                ce2.SaveChanges();
            }
            BindRepeaterData();

        }

    }
}