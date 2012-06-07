using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CVLK2011.Models
{
    public class UploadedFileInfoArrayBinder : IModelBinder 
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var files = controllerContext.HttpContext.Request.Files;
            var list = new List<UploadedFileInfo>();

            for (int i = 0; i < files.Count; i++)
            {
                var file = files[i];
                var name = files.AllKeys[i];
                var fileInfo = new UploadedFileInfo(name, file);
                list.Add(fileInfo);
            }
            return list.ToArray();
        }
    }
}