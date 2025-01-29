using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace session_05.Models
{
    public class LoginModel
    {

        [Key]
        public int login_id {get; set;}
        public  string? username { get; set; }
        
        public string? password {get; set;}

    }


}