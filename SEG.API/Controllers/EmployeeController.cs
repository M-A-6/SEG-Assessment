using SEG.BLL;
using SEG.BOL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace SEG.API.Controllers
{
    [EnableCors("*", "*", "*")]
    public class EmployeeController : ApiController
    {
        EmployeeBs employeeBsObj;

        public EmployeeController()
        {
            employeeBsObj = new EmployeeBs();
        }
        [ResponseType(typeof(IEnumerable<Employee>))]
        public IHttpActionResult Get()
        {
            return Ok(employeeBsObj.GetemployeesByDept());
        }
        [ResponseType(typeof(Employee))]
        public IHttpActionResult Get(int Id)
        {
            Employee employee = employeeBsObj.GetByID(Id);
            if (employee != null)
            {
                return Ok(employee);
            }
            else
                return NotFound();
        }

        [ResponseType(typeof(Employee))]
        public IHttpActionResult Post(Employee emp)
        {
            if (ModelState.IsValid)
            {
                employeeBsObj.Insert(emp);
                return CreatedAtRoute("DefaultApi", new { Id = emp.EmployeeId }, emp);
            }
            else
            {
                return BadRequest(ModelState);
            }
        }
        [ResponseType(typeof(Employee))]
        public IHttpActionResult Put(int id, Employee emp)
        {
            if (ModelState.IsValid)
            {
                employeeBsObj.Update(emp);
                return Ok(emp);
            }
            else
            {
                return BadRequest(ModelState);
            }

        }
        [ResponseType(typeof(Employee))]
        public IHttpActionResult Delete(int id)
        {
            Employee emp = employeeBsObj.GetByID(id);
            if (emp != null)
            {
                employeeBsObj.Delete(id);
                return Ok(emp);
            }
            else
            {
                return NotFound();
            }
        }
    }
}

