<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Web.SessionState;

public class Handler : IHttpHandler, IRequiresSessionState{

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        String text = (String)context.Session["data"];
        context.Response.Write(text);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}