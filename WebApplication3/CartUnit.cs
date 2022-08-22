using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Collections;  // CollectionBase
using System.IO;

namespace WebApplication1
{
    [Serializable]
    public class CartUnit
    {
        public CartUnit() { }        
        ~CartUnit() { }
        public string id_product  { get; set; }
        public string title    { get; set; }
        public string amount     { get; set; }
        public string price     { get; set; }
        public string cost      { get; set; } 
    }
}