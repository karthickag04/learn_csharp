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

        public IActionResult Register()
        {
            _logger.LogInformation("Registeration page requsted....");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                // You can still use the same RegisterViewModel as your entity model
                _context.reg_table.Add(model);  // Save the RegisterViewModel (without ConfirmPassword)
                _context.SaveChanges();
                _logger.LogInformation("Registeration Completed successfully....");
                // After successful registration, redirect to the login page
                return RedirectToAction("Login");
            }

            // If the model state is not valid, return the form with validation errors
            return View(model);
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


                // Check the second table (another_table_name)
                var userInOtherTable = _context.reg_table
                    .FirstOrDefault(u => u.Username == lModel.Username && u.Password == lModel.Password);

                if (user != null || userInOtherTable != null)
                {

                    if (userInOtherTable != null && userInOtherTable.Password == lModel.Password)
                    // Placeholder logic for authentication (you can implement real logic with DB or Identity)
                    //if (lModel.Username == "karthickag04" && lModel.Password == "k@123p1")
                    {
                        // Authentication successful, redirect to some page
                        return RedirectToAction("Index", "Admin");
                    }
                    else if (user != null && user.Password == lModel.Password)
                    // Placeholder logic for authentication (you can implement real logic with DB or Identity)
                    //if (lModel.Username == "karthickag04" && lModel.Password == "k@123p1")
                    {
                        // Authentication successful, redirect to some page
                        return RedirectToAction("Index", "Admin");
                    }
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
