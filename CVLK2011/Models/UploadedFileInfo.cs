using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CVLK2011.Models
{
    public class UploadedFileInfo
    {
        public string Name { get; private set; }
        public HttpPostedFileBase File { get; private set; }

        public UploadedFileInfo(string name, HttpPostedFileBase file)
        {
            Name = name;
            File = file;
        }   
    }
}