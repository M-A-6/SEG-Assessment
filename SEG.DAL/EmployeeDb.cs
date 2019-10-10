using SEG.BOL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEG.DAL
{
    public class EmployeeDb : BaseDb
    {
        public IEnumerable<Employee> GetALL()
        {
            return db.Employees.ToList();
        }
        public Employee GetByID(int Id)
        {
            return db.Employees.Find(Id);
        }
        public void Insert(Employee emp)
        {
            db.Employees.Add(emp);
            Save();
        }
        public void Delete(int Id)
        {
            Employee emp = db.Employees.Find(Id);
            db.Employees.Remove(emp);
            Save();
        }
        public void Update(Employee emp)
        {
            db.Entry(emp).State = EntityState.Modified;
            db.Configuration.ValidateOnSaveEnabled = false;
            Save();
            db.Configuration.ValidateOnSaveEnabled = true;
        }


        public IEnumerable<spGetEmployees_Result> GetemployeesByDept(int departmentId)
        {
            var deptId = new SqlParameter("@departmentId", departmentId);
            return db.Database.SqlQuery<spGetEmployees_Result>("spGetEmployees @departmentId", deptId).ToList();
            
        }
    }
}
