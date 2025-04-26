using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using mvc_with_reg_login.Models;
using mvc_with_reg_login.Data;

namespace mvc_with_reg_login.Controllers;

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

    public IActionResult Register()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Register(RegisterEntityModel model)
    {
        if (ModelState.IsValid)
        {
            // Save the user to the database or perform any other action
            // Redirect to a success page or another action
            _context.RegisterEntityModels.Add(model);  // Save the RegisterViewModel (without ConfirmPassword)
            _context.SaveChanges();
            _logger.LogInformation("Registeration Completed successfully....");
            return RedirectToAction("Index");
        }
        return View(model);
    }
    
   

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
