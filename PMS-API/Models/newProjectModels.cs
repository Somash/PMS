using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace PMS_API.Models
{
    public class newProjectModels
    {
        public string ProjectName { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public DateTime CommencedOn { get; set; }
        public DateTime ConcludedOn { get; set; }
        public int ArchitectId { get; set; }
        public int BusinessPartnerId { get; set; }
        public string PlanUrl { get; set; }
        public string SectionsUrl { get; set; }
        public string ElevationsUrl { get; set; }
        public string TDImageUrl { get; set; }
        public string AreaPanelCalculationUrl { get; set; }
        public string ConceptsDrawingUrl { get; set; }
        public string OptimizationUrl { get; set; }
        public string ShopDrawingUrl { get; set; }
        public string AnalysisUrl { get; set; }
        public string BOQUrl { get; set; }
        public string InteriorUrl { get; set; }
        public int OwnerId { get; set; }
        public int ProjectTypeId { get; set; }
        public int FixingTypeId { get; set; }
        public int ApplicationsId { get; set; }
        public HttpPostedFileBase TDRenderImageUrl { get; set; }

        public string saveFile(HttpPostedFileBase file, string Directory)
        {
            string path = String.Empty;
            if (file != null && file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                string Root = System.Web.HttpContext.Current.Server.MapPath(@"~/App_Data/" + Directory);
                if (!System.IO.Directory.Exists(Root))
                {
                    System.IO.Directory.CreateDirectory(Root);
                }
                path = Path.Combine(Root, fileName);
                file.SaveAs(path);
            }
            return path;
        }

    }
}