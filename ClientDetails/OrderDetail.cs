//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class OrderDetail
    {
        public int OrderDetailId { get; set; }
        public Nullable<int> OrderId { get; set; }
        public string Product { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<double> Amount { get; set; }
        public string Notes { get; set; }
    }
}
