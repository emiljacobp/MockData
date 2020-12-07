﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MockData.Models
{
    public class EmployeeContext : DbContext
    {
        // Database Instance
        public EmployeeContext(): base("MockDB")
        { }

        public DbSet<Employee> Employees { get; set; }
    }
}