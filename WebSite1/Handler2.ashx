<%@ WebHandler Language="C#" Class="Handler2" %>

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using Newtonsoft.Json;

public class Handler2 : IHttpHandler  {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string array = context.Request.QueryString["array"] ?? string.Empty;
        List<Person> _User = JsonConvert.DeserializeObject<List<Person>>(array);
        StringBuilder sb = new StringBuilder();
        sb.Append("[");
        foreach (Person person in _User)
        {
            sb.Append("{");
            sb.AppendFormat("\"Name\":\"{0}\",\"Age\":\"{1}\"", person.Name, person.Age);
            sb.Append("}");
        }
        sb.Append("]");
        context.Response.Write(sb);
    }


    public class Person
    {
        public string Name { get; set; }
        public int Age { get; set; }
    }

    public bool IsReusable
    {
        get {
            return false;
        }
    }
}