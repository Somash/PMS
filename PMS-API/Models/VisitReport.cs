//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PMS_API.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class VisitReport
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VisitReport()
        {
            this.Checklists = new HashSet<Checklist>();
            this.ProjectPictures1 = new HashSet<ProjectPicture>();
        }
    
        public int Id { get; set; }
        public string VisitedBy { get; set; }
        public string VisitedOn { get; set; }
        public string ActionPlanReportUrl { get; set; }
        public int NewProjectId { get; set; }
        public int ProjectStatusId { get; set; }
        public int ProjectHealthId { get; set; }
        public string comments { get; set; }
        public string notes { get; set; }
        public string ProjectPictures { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Checklist> Checklists { get; set; }
        public virtual NewProject NewProject { get; set; }
        public virtual ProjectHealth ProjectHealth { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProjectPicture> ProjectPictures1 { get; set; }
        public virtual ProjectStatu ProjectStatu { get; set; }
    }
}
