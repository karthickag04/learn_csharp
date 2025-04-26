using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using mvc_with_reg_login.Models;

namespace mvc_with_reg_login.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
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
