﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClientDetails
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class CustomerEntities4 : DbContext
    {
        public CustomerEntities4()
            : base("name=CustomerEntities4")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<orderTb> orderTbs { get; set; }
    
        public virtual int clientDel(Nullable<int> cid)
        {
            var cidParameter = cid.HasValue ?
                new ObjectParameter("Cid", cid) :
                new ObjectParameter("Cid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("clientDel", cidParameter);
        }
    
        public virtual ObjectResult<clientGet_Result> clientGet()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<clientGet_Result>("clientGet");
        }
    
        public virtual int delorder(Nullable<int> orderid)
        {
            var orderidParameter = orderid.HasValue ?
                new ObjectParameter("orderid", orderid) :
                new ObjectParameter("orderid", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("delorder", orderidParameter);
        }
    
        public virtual int delorderdt(Nullable<int> orderdt)
        {
            var orderdtParameter = orderdt.HasValue ?
                new ObjectParameter("orderdt", orderdt) :
                new ObjectParameter("orderdt", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("delorderdt", orderdtParameter);
        }
    
        public virtual ObjectResult<GetOrder_Result> GetOrder()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetOrder_Result>("GetOrder");
        }
    
        public virtual ObjectResult<Getordrdt_Result> Getordrdt()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Getordrdt_Result>("Getordrdt");
        }
    
        public virtual int SetClient(Nullable<int> clientid, string firstName, string lastName, string cnic, Nullable<System.DateTime> dOB, string add)
        {
            var clientidParameter = clientid.HasValue ?
                new ObjectParameter("Clientid", clientid) :
                new ObjectParameter("Clientid", typeof(int));
    
            var firstNameParameter = firstName != null ?
                new ObjectParameter("FirstName", firstName) :
                new ObjectParameter("FirstName", typeof(string));
    
            var lastNameParameter = lastName != null ?
                new ObjectParameter("LastName", lastName) :
                new ObjectParameter("LastName", typeof(string));
    
            var cnicParameter = cnic != null ?
                new ObjectParameter("Cnic", cnic) :
                new ObjectParameter("Cnic", typeof(string));
    
            var dOBParameter = dOB.HasValue ?
                new ObjectParameter("DOB", dOB) :
                new ObjectParameter("DOB", typeof(System.DateTime));
    
            var addParameter = add != null ?
                new ObjectParameter("add", add) :
                new ObjectParameter("add", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SetClient", clientidParameter, firstNameParameter, lastNameParameter, cnicParameter, dOBParameter, addParameter);
        }
    
        public virtual int SetOrder(Nullable<int> oid, string code, Nullable<int> cid, Nullable<System.DateTime> dat, string not)
        {
            var oidParameter = oid.HasValue ?
                new ObjectParameter("Oid", oid) :
                new ObjectParameter("Oid", typeof(int));
    
            var codeParameter = code != null ?
                new ObjectParameter("code", code) :
                new ObjectParameter("code", typeof(string));
    
            var cidParameter = cid.HasValue ?
                new ObjectParameter("cid", cid) :
                new ObjectParameter("cid", typeof(int));
    
            var datParameter = dat.HasValue ?
                new ObjectParameter("dat", dat) :
                new ObjectParameter("dat", typeof(System.DateTime));
    
            var notParameter = not != null ?
                new ObjectParameter("not", not) :
                new ObjectParameter("not", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SetOrder", oidParameter, codeParameter, cidParameter, datParameter, notParameter);
        }
    
        public virtual int SetOrderdetl(Nullable<int> odtid, Nullable<int> ordrid, string prod, Nullable<int> quantity, Nullable<double> amount, string notes)
        {
            var odtidParameter = odtid.HasValue ?
                new ObjectParameter("Odtid", odtid) :
                new ObjectParameter("Odtid", typeof(int));
    
            var ordridParameter = ordrid.HasValue ?
                new ObjectParameter("ordrid", ordrid) :
                new ObjectParameter("ordrid", typeof(int));
    
            var prodParameter = prod != null ?
                new ObjectParameter("Prod", prod) :
                new ObjectParameter("Prod", typeof(string));
    
            var quantityParameter = quantity.HasValue ?
                new ObjectParameter("quantity", quantity) :
                new ObjectParameter("quantity", typeof(int));
    
            var amountParameter = amount.HasValue ?
                new ObjectParameter("amount", amount) :
                new ObjectParameter("amount", typeof(double));
    
            var notesParameter = notes != null ?
                new ObjectParameter("notes", notes) :
                new ObjectParameter("notes", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("SetOrderdetl", odtidParameter, ordridParameter, prodParameter, quantityParameter, amountParameter, notesParameter);
        }
    
        public virtual ObjectResult<clientGetid_Result> clientGetid(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<clientGetid_Result>("clientGetid", idParameter);
        }
    
        public virtual ObjectResult<GetOrderid_Result> GetOrderid(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetOrderid_Result>("GetOrderid", idParameter);
        }
    
        public virtual ObjectResult<Getordrdtid_Result> Getordrdtid(Nullable<int> id)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("id", id) :
                new ObjectParameter("id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Getordrdtid_Result>("Getordrdtid", idParameter);
        }
    }
}
