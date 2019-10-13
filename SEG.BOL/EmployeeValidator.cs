using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEG.BOL
{   
    public class EmployeeValidator
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        public string Contact { get; set; }
        public string Address { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }        
        public string Password { get; set; }        
        public string Gender { get; set; }
        
    }

    [MetadataType(typeof(EmployeeValidator))]
    public partial class Employee {
        [NotMapped]
        [Compare("Password")]
        public string ConfirmPassword { get; set; }
    }
}
