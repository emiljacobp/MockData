using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MockData.Models
{
    public class Employee
    {
        [Key]
        public int? employee_id { get; set; }

        //[Required(ErrorMessage = "Please enter First Name")]
        [DisplayName("First Name")]
        public string first_name{ get; set; }


        //[Required(ErrorMessage = "Please enter Last Name")]
        [DisplayName("Last Name")]
        public string last_name{ get; set; }

        //[Required(ErrorMessage = "Please enter Email")]
        [DisplayName("Email")]
        public string email{ get; set; }
    }
}