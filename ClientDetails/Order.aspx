<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ClientDetails.Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section id="main-content">
     <section id="wrapper"></section>
        <div class="row">
            <div class="col-lg-12"></div>
            <section class="panel">
                <header class="panel-heading">
                    <div class="col-md-4 col-md-offset-4">
                        <h1>Order Form</h1>
                    </div>
                </header>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Order Code" runat="server"/>
                              <asp:TextBox runat="server"  Enabled="true" ID="txtordrcd" CssClass="form-control input-sm" placeholder="Enter Order Code" Width="347px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Client Id" runat="server"/>
                              <asp:TextBox runat="server" TextMode="Number" Enabled="true"  ID="txtclientid" CssClass="form-control input-sm" placeholder="Enter ClientId" Width="347px" />
                          </div>
                        </div>
                 
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Date" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" TextMode="Date" ID="txtdated" CssClass="form-control input-sm" placeholder="Enter Date" Width="332px" Height="28px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Notes" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" ID="txtnotes" CssClass="form-control input-sm" placeholder="Enter Your Note" Width="330px" />
                          </div>
                        </div>
                         <br />
                        <div class="col-md-8 col-md-offset-2">
                             <div class="form-group">
                                
                            <asp:Button Text="Save" ID="btnsave" CssClass="btn btn-success" Width="100" runat="server" OnClick="btnsave_Click" />
                            <asp:Button Text="Reset" ID="btn_reset" CssClass="btn btn-warning" Width="100" runat="server" OnClick="btn_reset_Click" />

                            </div>
                        </div>
    <asp:Repeater ID="OrderRep" runat="server" onitemcommand="order_ItemCommand">
             <HeaderTemplate >
                <table class="table" style="background-color:orange">  
                     <tr>
                         <th>Order Id</th>
                         <th>Order Code</th>
                         <th>Client Id</th>
                         <th>Dated</th>
                         <th>Notes</th>
                         <th>Operations</th>
                     </tr>
                 </table>
             </HeaderTemplate>
       
             <ItemTemplate>
               <table class="table table-hover" style="background-color:cornsilk">  
                 <tr>
                 <td>
                     <asp:Label ID="Label1" runat="server" Text='<%#Bind("OrderId") %>'></asp:Label>

                 </td>
                 <td>
                     <asp:Label ID="Label2" runat="server" Text='<%#Bind("OrderCode") %>'></asp:Label>

                 </td>
                       <td>
                     <asp:Label ID="Label4" runat="server" Text='<%#Bind("Clientid") %>'></asp:Label>

                 </td>
                 <td>
                     <asp:Label ID="Label3" runat="server" Text='<%#Bind("Dated") %>'></asp:Label>

                 </td>
                
                 <td>
                     <asp:Label ID="Label5" runat="server" Text='<%#Bind("Notes") %>'></asp:Label>

                 </td>
                
                     
                     <td>
                         <asp:LinkButton  CssClass="btn btn-success" ID="modal" CommandName="Edit" ToolTip="Edit a record." CommandArgument='<%#Eval("OrderId")%>'  runat="server"  OnClick="modal_Click">Edit</asp:LinkButton>
                         <asp:LinkButton ID="Delete" CssClass="btn btn-danger" CommandName="Delete" onclientclick="return confirm('Are you sure you want to delete?')" CommandArgument='<%#Eval("OrderId")%>' runat="server">Delete</asp:LinkButton>

                     </td>
                     </tr>
                 </table>
             </ItemTemplate>

            
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
                              <asp:Label Text="Order Code" runat="server"/>
                              <asp:TextBox runat="server" TextMode="Number" Enabled="true" CssClass="form-control input-sm"  ID="upocod"/>
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                               <br />
                              <asp:Label Text="Client id" runat="server"/>
                              <asp:TextBox runat="server" TextMode="Number" Enabled="true" CssClass="form-control input-sm"  ID="upcid"/>
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                               <br />
                              <asp:Label Text="Dated" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm"  ID="updat"/>
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                               <br />
                              <asp:Label Text="Notes" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Your Date of Birth" ID="upnot"/>
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
