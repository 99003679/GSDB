using Models;
using System;
using Default;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class BL
    {
        int res;


        public int Insertdata(ToicMatrix usObj)

        {

            try
            {
                    Default.Default falObj = new Default.Default();
                    res = falObj.Insertdata(usObj);
                    return res;
            }
            catch (Exception)
            {
                return -2;
            }
        }
    }
}
