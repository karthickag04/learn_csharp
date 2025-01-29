
using System.ComponentModel.DataAnnotations;

namespace website_school.Models
{
    public class LoginViewModel
    {
        [Key]
        public int? Login_id { get; set; }


        [Required(ErrorMessage = "Username is required.")]
        [StringLength(100, ErrorMessage = "Username cannot be longer than 100 characters.")]
        public string? Username { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [DataType(DataType.Password)]
        public string? Password { get; set; }
    }
}
