using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using session_05.Models;

namespace session_05.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }


    [HttpGet]
    public IActionResult Login(){
        return View();

    }


    [HttpPost]
    public IActionResult Login(LoginModel lModel){

        if (ModelState.IsValid)
            {
                // Placeholder logic for authentication (you can implement real logic with DB or Identity)
                if (lModel.username == "karthickag04" && lModel.password == "k@123p1")
                {
                    // Authentication successful, redirect to some page
                    return RedirectToAction("Index", "Login");
                }

                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
            }


        return View(lModel);

    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
