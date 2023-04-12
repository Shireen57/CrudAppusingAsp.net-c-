<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="ClientDetails.OrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <section id="main-content">
     <section id="wrapper"></section>
        <div class="row">
            <div class="col-lg-12"></div>
            <section class="panel">
                <header class="panel-heading">
                    <div class="col-md-4 col-md-offset-4">
                        <h1>Order Details</h1>
                    </div>
                </header>
                <div class="panel-body">
                    <div class="row">
                         <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Order id" runat="server"/>
                              <asp:TextBox runat="server" TextMode="Number" Enabled="true" ID="txtordrid" CssClass="form-control input-sm" placeholder="Enter Your id" Width="302px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Order Code" runat="server"/>
                              <asp:TextBox runat="server"  Enabled="true" ID="ordrcd"  CssClass="form-control input-sm" placeholder="Enter Order Code" Width="302px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Product Name" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" ID="txtprdct" CssClass="form-control input-sm" placeholder="Enter Product Name" Width="302px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Quantity" runat="server"/>
                              <asp:TextBox runat="server" TextMode="Number" ID="txtqunty" Enabled="true"  CssClass="form-control input-sm" placeholder="Enter Quantity of Products" Width="302px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Amount" runat="server"/>
                              <asp:TextBox runat="server"  ID="txtamnt"  Enabled="true" CssClass="form-control input-sm" placeholder="Enter Amount" Width="302px" />
                          </div>
                        </div>
                        
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Notes" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" ID="txtnotes" CssClass="form-control input-sm" placeholder="Enter Your Note" Width="302px" />
                          </div>
                        </div>
                        <div class="col-md-8 col-md-offset-2">
                             <div class="form-group">
                            <asp:Button Text="Save" ID="btnsave" CssClass="btn btn-success" Width="100" runat="server" OnClick="btnsave_Click" />
                            <asp:Button Text="Reset" ID="btn_reset" CssClass="btn btn-warning" Width="100" runat="server" OnClick="btn_reset_Click" />
                        </div></div>
    <asp:Repeater ID="Repeater2" runat="server" onitemcommand="reporderDetails_ItemCommand">
            
        <HeaderTemplate>
                 
                <table class="table row" style="background-color:orange">  
                     <tr>
                         <th class="col-md-2">Id</th>
                         <th class="col-md-2">OrderId</th>
                         <th class="col-md-2">Product Name</th>
                         <th class="col-md-2">Quantity</th>
                         <th class="col-md-2">Amount</th>
                         <th class="col-md-2">Notes</th>
                         <th class="col-md-2">Operations</th>
                     </tr>
                 </table>
             </HeaderTemplate>
             <ItemTemplate>
               <table class="table table-hover row" style="background-color:bisque">  
                 <tr>
                 <td>
                     <asp:Label ID="Label1" runat="server" Text='<%#Bind("OrderDetailId") %>'></asp:Label>

                 </td>
                 <td>
                     <asp:Label ID="Label2" runat="server" Text='<%#Bind("OrderId") %>'></asp:Label>

                 </td>
                     <td>
                         <asp:Label ID="Label3" runat="server" Text='<%#Bind("Product") %>'></asp:Label>

                     </td>
                 <td>
                     <asp:Label ID="Label4" runat="server" Text='<%#Bind("Quantity") %>'></asp:Label>

                 </td>
                 <td>
                     <asp:Label ID="Label5" runat="server" Text='<%#Bind("Amount") %>'></asp:Label>

                 </td>
                     <td>
                     <asp:Label ID="Label7" runat="server" Text='<%#Bind("Notes") %>'></asp:Label>

                 </td>
                
                     
                     <td class="col-md-2">
                         <asp:LinkButton CssClass="btn btn-success" ID="modal" CommandName="Edit" ToolTip="Edit a record." CommandArgument='<%#Eval("OrderDetailId")%>' runat="server" OnClick="modal_Click">Edit</asp:LinkButton>
                         <asp:LinkButton ID="Delete"  CssClass="btn btn-danger" CommandName="Delete" CommandArgument='<%#Eval("OrderDetailId")%>' runat="server" onclientclick="return confirm('Are you sure you want to delete?')">Delete</asp:LinkButton>

                     </td>
                     </tr>
                 </table>
             </ItemTemplate>
        <FooterTemplate>
            
        </FooterTemplate>
    </asp:Repeater>
              </div>
                </div>
            </section>
        </div>
</section>
    <div class="container">
        <div class="modal fade" id="mymodal" role="dialog">
            <div class="modal-dialog modal-dailog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="modal-title"><h3>Update Record</h3></div>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                          <div class="row">
                            <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm hidden"  ID="upId" />
                   <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <br />
                              <asp:Label Text="OrderId" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm"  ID="upoid"/>
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Product" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" ID="uprod"/>
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Quantity" runat="server"/>
                              <asp:TextBox runat="server" TextMode="Number" Enabled="true"  CssClass="form-control input-sm"   ID="upqnty"/>
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Amount" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true"   CssClass="form-control input-sm" ID="upamnt"/>
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Notes" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" ID="upnot"/>
                          </div>
                        </div>
                        <div class="col-md-8 col-md-offset-2">
                           <asp:Button Text="Update" ID="update" CssClass="btn btn-danger" Width="100" onClick="update_Click" runat="server"/>
                       
                           
                        </div>
                  
                   <br />
                   <br />
                  
                   </div> </div></div>
                   
                </div>
            </div> </div>
</asp:Content>
