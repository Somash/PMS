using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PMS_API.Models;
using System.Data.Entity.Validation;
using System.Diagnostics;
using PMS_API.Helpers;
namespace PMS_API.Controllers
{
    public class NewProjectsController : Controller
    {
        private PMSEntities db = new PMSEntities();

        // GET: NewProjects
        public async Task<ActionResult> Index()
        {
            var newProjects = db.NewProjects.Include(n => n.Application)
                                .Include(n => n.Architect)
                                .Include(n => n.BusinessPartner)
                                .Include(n => n.FixingType)
                                .Include(n => n.Owner)
                                .Include(n => n.ProjectType).OrderByDescending(r => r.Id);
            return View(await newProjects.ToListAsync());
        }

        // GET: NewProjects/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewProject newProject = await db.NewProjects.FindAsync(id);
            if (newProject == null)
            {
                return HttpNotFound();
            }
            return View(newProject);
        }

        // GET: NewProjects/Create
        public ActionResult Create()
        {
            ViewBag.ApplicationsId = new SelectList(db.Applications.AsEnumerable(), "Id", "Name");
            ViewBag.ArchitectId = new SelectList(db.Architects.ToList(), "Id", "FullName");
            ViewBag.BusinessPartnerId = new SelectList(db.BusinessPartners.ToList(), "Id", "FullName");
            ViewBag.FixingTypeId = new SelectList(db.FixingTypes.ToList(), "Id", "Name");
            ViewBag.OwnerId = new SelectList(db.Owners.ToList(), "Id", "FullName");
            ViewBag.ProjectTypeId = new SelectList(db.ProjectTypes.ToList(), "Id", "Name");
            return View();
        }

        // POST: NewProjects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(newProjectModels model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    NewProject newProject = new NewProject()
                    {
                        AnalysisUrl = Utilities.saveFile(Request.Files["AnalysisUrl"], model.ProjectName + "\\Analysis"),
                        ApplicationsId = model.ApplicationsId,
                        ArchitectId = model.ArchitectId,
                        AreaPanelCalculationUrl = Utilities.saveFile(Request.Files["AreaPanelCalculationUrl"], model.ProjectName + "\\AreaPanelCalculation"),
                        BOQUrl = Utilities.saveFile(Request.Files["BOQUrl"], model.ProjectName + "\\BOQ"),
                        BusinessPartnerId = model.BusinessPartnerId,
                        City = model.City,
                        CommencedOn = model.CommencedOn.ToShortDateString(),
                        ConceptsDrawingUrl = Utilities.saveFile(Request.Files["ConceptsDrawingUrl"], model.ProjectName + "\\ConceptsDrawing"),
                        ConcludedOn = model.ConcludedOn.ToShortDateString(),
                        ElevationsUrl = Utilities.saveFile(Request.Files["ElevationsUrl"], model.ProjectName + "\\Elevations"),
                        FixingTypeId = model.FixingTypeId,
                        InteriorUrl = Utilities.saveFile(Request.Files["InteriorUrl"], model.ProjectName + "\\Interior"),
                        OptimizationUrl = Utilities.saveFile(Request.Files["OptimizationUrl"], model.ProjectName + "\\Optimization"),
                        OwnerId = model.OwnerId,
                        PlanUrl = Utilities.saveFile(Request.Files["PlanUrl"], model.ProjectName + "\\Plan"),
                        ProjectName = model.ProjectName,
                        ProjectTypeId = model.ProjectTypeId,
                        SectionsUrl = Utilities.saveFile(Request.Files["SectionsUrl"], model.ProjectName + "\\Sections"),
                        ShopDrawingUrl = Utilities.saveFile(Request.Files["ShopDrawingUrl"], model.ProjectName + "\\ShopDrawing"),
                        Street = model.Street,
                        TDImageUrl = Utilities.saveFile(Request.Files["TDImageUrl"], model.ProjectName + "\\TDImage"),
                        TDRenderImageUrl = Utilities.saveFile(Request.Files["TDRenderImageUrl"], model.ProjectName + "\\TDRenderImage")
                    };
                    db.NewProjects.Add(newProject);
                    await db.SaveChangesAsync();
                    ViewBag.ApplicationsId = new SelectList(db.Applications, "Id", "Name", newProject.ApplicationsId);
                    ViewBag.ArchitectId = new SelectList(db.Architects, "Id", "FullName", newProject.ArchitectId);
                    ViewBag.BusinessPartnerId = new SelectList(db.BusinessPartners, "Id", "FullName", newProject.BusinessPartnerId);
                    ViewBag.FixingTypeId = new SelectList(db.FixingTypes, "Id", "Name", newProject.FixingTypeId);
                    ViewBag.OwnerId = new SelectList(db.Owners, "Id", "FullName", newProject.OwnerId);
                    ViewBag.ProjectTypeId = new SelectList(db.ProjectTypes, "Id", "Name", newProject.ProjectTypeId);

                    return RedirectToAction("Index");

                }
            }
            catch (Exception ex)
            {
                if (ex is DbEntityValidationException)
                {
                    foreach (var validationErrors in ((DbEntityValidationException)ex).EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                        }
                    }
                    //return InternalServerError();
                }

            }
            return RedirectToAction("Index");

            //return View(newProject);
        }

        // GET: NewProjects/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewProject newProject = await db.NewProjects.FindAsync(id);
            if (newProject == null)
            {
                return HttpNotFound();
            }
            ViewBag.ApplicationsId = new SelectList(db.Applications, "Id", "Name", newProject.ApplicationsId);
            ViewBag.ArchitectId = new SelectList(db.Architects, "Id", "FullName", newProject.ArchitectId);
            ViewBag.BusinessPartnerId = new SelectList(db.BusinessPartners, "Id", "FullName", newProject.BusinessPartnerId);
            ViewBag.FixingTypeId = new SelectList(db.FixingTypes, "Id", "Name", newProject.FixingTypeId);
            ViewBag.OwnerId = new SelectList(db.Owners, "Id", "FullName", newProject.OwnerId);
            ViewBag.ProjectTypeId = new SelectList(db.ProjectTypes, "Id", "Name", newProject.ProjectTypeId);
            return View(newProject);
        }

        // POST: NewProjects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,ProjectName,City,Street,CommencedOn,ConcludedOn,ArchitectId,BusinessPartnerId,PlanUrl,SectionsUrl,ElevationsUrl,TDImageUrl,AreaPanelCalculationUrl,ConceptsDrawingUrl,OptimizationUrl,ShopDrawingUrl,AnalysisUrl,BOQUrl,InteriorUrl,OwnerId,ProjectTypeId,FixingTypeId,ApplicationsId,TDRenderImageUrl")] NewProject newProject)
        {
            if (ModelState.IsValid)
            {
                db.Entry(newProject).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.ApplicationsId = new SelectList(db.Applications, "Id", "Name", newProject.ApplicationsId);
            ViewBag.ArchitectId = new SelectList(db.Architects, "Id", "FullName", newProject.ArchitectId);
            ViewBag.BusinessPartnerId = new SelectList(db.BusinessPartners, "Id", "FullName", newProject.BusinessPartnerId);
            ViewBag.FixingTypeId = new SelectList(db.FixingTypes, "Id", "Name", newProject.FixingTypeId);
            ViewBag.OwnerId = new SelectList(db.Owners, "Id", "FullName", newProject.OwnerId);
            ViewBag.ProjectTypeId = new SelectList(db.ProjectTypes, "Id", "Name", newProject.ProjectTypeId);
            return View(newProject);
        }

        // GET: NewProjects/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewProject newProject = await db.NewProjects.FindAsync(id);
            if (newProject == null)
            {
                return HttpNotFound();
            }
            return View(newProject);
        }

        // POST: NewProjects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            NewProject newProject = await db.NewProjects.FindAsync(id);
            db.NewProjects.Remove(newProject);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
