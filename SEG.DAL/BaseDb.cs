using SEG.BOL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SEG.DAL
{
    public class BaseDb
    {
        protected SEGEntities db;
        public BaseDb()
        {
            db = new SEGEntities();
        }

        protected void Save()
        {
            db.SaveChanges();
        }
    }
}
