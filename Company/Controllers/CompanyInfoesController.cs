using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Company.Models;

namespace Company.Controllers
{
    public class CompanyInfoesController : Controller
    {
        private CompanyDBEntities db = new CompanyDBEntities();

        // GET: CompanyInfoes
        public ActionResult Index()
        {
            return View(db.CompanyInfoes.ToList());
        }

        // GET: CompanyInfoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompanyInfo companyInfo = db.CompanyInfoes.Find(id);
            if (companyInfo == null)
            {
                return HttpNotFound();
            }
            return View(companyInfo);
        }

        // GET: CompanyInfoes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CompanyInfoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Email,Phone,Address,LogoPath")] CompanyInfo companyInfo)
        {
            if (ModelState.IsValid)
            {
                string logoPath = SaveToCloudinary(companyInfo.LogoPath);

                companyInfo.LogoPath = logoPath;
                db.CompanyInfoes.Add(companyInfo);
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            return View(companyInfo);
        }

        [Obsolete]
        private string SaveToCloudinary(string logoPath)
        {
            Account account = new Account(
              "ione",
              "991979792614218",
              "0GmAk1CFTAAEHe_TzWQwhKOiLLQ");

            Cloudinary cloudinary = new Cloudinary(account);

            var uploadParams = new ImageUploadParams()
            {
                File = new FileDescription(@"C:\Users\Iraz\Downloads\Pics\" +logoPath)
            };
            var uploadResult = cloudinary.Upload(uploadParams);

            return uploadResult.SecureUri.AbsoluteUri;
        }

        // GET: CompanyInfoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompanyInfo companyInfo = db.CompanyInfoes.Find(id);
            if (companyInfo == null)
            {
                return HttpNotFound();
            }
            return View(companyInfo);
        }

        // POST: CompanyInfoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Email,Phone,Address,LogoPath")] CompanyInfo companyInfo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(companyInfo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(companyInfo);
        }

        // GET: CompanyInfoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompanyInfo companyInfo = db.CompanyInfoes.Find(id);
            if (companyInfo == null)
            {
                return HttpNotFound();
            }
            return View(companyInfo);
        }

        // POST: CompanyInfoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CompanyInfo companyInfo = db.CompanyInfoes.Find(id);
            db.CompanyInfoes.Remove(companyInfo);
            db.SaveChanges();
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
