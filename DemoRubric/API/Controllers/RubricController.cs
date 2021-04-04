using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using Models;
using System.Web.Http;
using BL;
namespace API.Controllers
{
    public class RubricController : ApiController
    {
        [ActionName("Insertdata")]
        [HttpPost]
        public HttpResponseMessage Insertdata(Models.ToicMatrix tObj)
        {
            BL.BL bObj = new BL.BL();
            try
            {
                var res = bObj.Insertdata(tObj);
                if (res > 0)
                    return Request.CreateResponse(HttpStatusCode.OK, " Added");
                else
                    return Request.CreateResponse(HttpStatusCode.NotFound, "not found");
            }
            catch (Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, e.Message);

            }
        }
    }
}
