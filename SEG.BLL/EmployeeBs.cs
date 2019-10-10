using SEG.BOL;
using SEG.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEG.BLL
{
    public class EmployeeBs
    {
        private EmployeeDb ObjDb;

        public List<string> Errors = new List<string>();

        public EmployeeBs()
        {
            ObjDb = new EmployeeDb();
        }
        public IEnumerable<Employee> GetALL()
        {
            return ObjDb.GetALL();
        }
        public IEnumerable<spGetEmployees_Result> GetemployeesByDept()
        {
            return ObjDb.GetemployeesByDept(0);
        }
        
        public Employee GetByID(int Id)
        {
            return ObjDb.GetByID(Id);
        }

        public bool Insert(Employee emp)
        {
            if (IsValidOnInsert(emp))
            {
                ObjDb.Insert(emp);               
                return true;
            }
            else
            {
                return false;
            }
        }
        public void Delete(int Id)
        {
            ObjDb.Delete(Id);
        }
        public bool Update(Employee emp)
        {
            if (IsValidOnUpdate(emp))
            {
                ObjDb.Update(emp);
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool IsValidOnInsert(Employee emp)
        {           
            //Unique Email Validation
            string EmailValue = emp.Email.ToString();
            int count = GetALL().Where(x => x.Email == EmailValue).ToList().Count();
            if (count != 0)
            {
                Errors.Add("Email Already Exist");
            }
            if (Errors.Count() == 0)
                return true;
            else
                return false;
        }

         

        public bool IsValidOnUpdate(Employee emp)
        {
            return true;
        }
    }
}
