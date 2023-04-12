<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientsForm.aspx.cs" Inherits="ClientDetails.ClientsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <section id="main-content">
     <section id="wrapper"></section>
        <div class="row">
            <div class="col-lg-12"></div>
            <section class="panel">
                <header class="panel-heading">
                    <div class="col-md-4 col-md-offset-4">
                        <h1>Client Form</h1>
                    </div>
                </header>
                <div class="panel-body">
                    <div class="row">
  
                   <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="First Name" runat="server"/>
                              <asp:TextBox runat="server"  Enabled="true" CssClass="form-control input-sm" placeholder="Enter Your First Name" ID="Clientfnam" Width="302px" />
                              
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Last Name" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Your Last Name" ID="Clientlnam" Width="302px" />
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="CNIC" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder=" Format XXXXX-XXXX-XXX-X"  ID="Clientcnic" Width="302px" />
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <asp:Label Text="Date of Birth" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" TextMode="Date" CssClass="form-control input-sm" placeholder="Enter Your Date of Birth" ID="ClientDOB" Width="294px" Height="29px"/>
                          </div>
                        </div>
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                             <asp:Label Text="Address" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Your Address" ID="ClientAdd" Width="302px"/>
                          </div>
                        </div>
                   <div class="col-md-8 col-md-offset-2">
                        <div class="form-group">
                       <asp:Button Text="Save" ID="btnsave" CssClass="btn btn-success" Width="100" runat="server" OnClick="btnsave_Click" />
                       <asp:Button Text="Reset" ID="btn_reset" CssClass="btn btn-warning" Width="100" runat="server" OnClick="btn_reset_Click" />
                   </div>
  </div>                 
  
      <asp:Repeater ID="Repeater2" runat="server" onitemcommand="repEmployeeDetails_ItemCommand">
             <HeaderTemplate>
                <table class="table row" style="background-color:orange">  
                     <tr class="row">
                         <th class="col-md-2">Id</th>
                         
                         <th class="col-md-2">First Name</th>
                         <th class="col-md-2">Last Name</th>
                         <th class="col-md-2">CNIC</th>
                         <th class="col-md-2">DOB</th>
                         <th class="col-md-2">Address</th>
                         <th class="col-md-2">Operations</th>
                     </tr>
                 </table>
             </HeaderTemplate>
       
             <ItemTemplate>
               <table class="table table-hover row" style="background-color:bisque">  
                 <tr>
                 <td CssClass="col-md-2">
                     <asp:Label ID="Label1" runat="server"  Text='<%#Bind("Clientid") %>'></asp:Label>

                 </td>
                 <td CssClass="col-md-1">
                     <asp:Label ID="Label2" runat="server" Text='<%#Bind("FirstName") %>'></asp:Label>

                 </td>
                 <td CssClass="col-md-2">
                     <asp:Label ID="Label3" runat="server" Text='<%#Bind("LastName") %>'></asp:Label>

                 </td>
                 <td CssClass="col-md-2">
                     <asp:Label ID="Label4" runat="server"  Text='<%#Bind("CNIC") %>'></asp:Label>

                 </td>
                 <td CssClass="col-md-2">
                     <asp:Label ID="Label5" runat="server"  Text='<%#Bind("DOB") %>'></asp:Label>

                 </td>
                 <td CssClass="col-md-2">
                     <asp:Label ID="Label6" runat="server"  Text='<%#Bind("Address") %>'></asp:Label>

                 </td>
                     
                     <td class="col-md-2">
                         <asp:LinkButton CssClass="btn btn-success" ID="modal" CommandName="Edit" ToolTip="Edit a record." CommandArgument='<%#Eval("Clientid")%>' runat="server" OnClick="modal_Click">Edit</asp:LinkButton>
                         <asp:LinkButton CssClass="btn btn-danger" ID="Delete" CommandName="Delete" onclientclick="return confirm('Are you sure you want to delete?')" CommandArgument='<%#Eval("Clientid")%>' runat="server">Delete</asp:LinkButton>
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
                              <asp:Label Text="First Name" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm"  ID="upfnam"/>
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                              <br />
                              <asp:Label Text="Last Name" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Your Last Name" ID="uplnam"/>
                          </div>
                        </div>
                    <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                               <br />
                              <asp:Label Text="CNIC" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder=" Format XXXXX-XXXX-XXX-X"  ID="upcnic"/>
                          </div>
                        </div>
                     <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                               <br />
                              <asp:Label Text="Dob" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" ID="updob"/>
                          </div>
                        </div>                       
                        <div class="col-md-4 col-md-offset-1">
                          <div class="form-group">
                               <br />
                              <asp:Label Text="Address" runat="server"/>
                              <asp:TextBox runat="server" Enabled="true" CssClass="form-control input-sm" placeholder="Enter Your Address" ID="upadd"/>
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

