//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CarsThisYear.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class ModelSeries
    {
        public ModelSeries()
        {
            this.ModelStyles = new HashSet<ModelStyle>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public int ModelId { get; set; }
        public int EngineId { get; set; }
    
        public virtual Model Model { get; set; }
        public virtual ICollection<ModelStyle> ModelStyles { get; set; }
    }
}
