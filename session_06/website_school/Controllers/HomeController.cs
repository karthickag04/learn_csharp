using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using website_school.Models;
using website_school.Data;

namespace website_school.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly AppDbContext _context;

        public HomeController(ILogger<HomeController> logger, AppDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Login()
        {
            return View();
        }


        [HttpPost]
        public IActionResult Login(LoginViewModel lModel)
        {

            if (ModelState.IsValid)
            {

                var user = _context.emp_login
               .FirstOrDefault(u => u.Username == lModel.Username);

                if (user != null && user.Password == lModel.Password)
                    // Placeholder logic for authentication (you can implement real logic with DB or Identity)
                    //if (lModel.Username == "karthickag04" && lModel.Password == "k@123p1")
                {
                    // Authentication successful, redirect to some page
                    return RedirectToAction("Index", "Admin");
                }

                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
            }


            return View(lModel);

        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
