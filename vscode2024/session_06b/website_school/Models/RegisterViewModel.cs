using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace website_school.Models
{
    public class RegisterViewModel
    {
        [Key]
        public int Id { get; set; } // Assuming you have an ID as the primary key

        [Required(ErrorMessage = "Username is required.")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Invalid email address.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm password is required.")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Passwords do not match.")]
        [NotMapped]  // This will exclude ConfirmPassword from being mapped to the database
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "Please select a job role.")]
        public string JobRole { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;  // Optional timestamp
    }
}