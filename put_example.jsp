<%@ page import="java.io.*" %>
<pre>
<%
  try
  {
    Runtime r = Runtime.getRuntime();
    String msg = "", emsg = "";
    String cmd = "sh /home/pi/libcoap-4.1.1/examples/wrapper.sh";
    Process p = r.exec(cmd);
    p.waitFor();
    BufferedReader inOut =
      new BufferedReader(new InputStreamReader(p.getInputStream()));
    BufferedReader inErr =
      new BufferedReader(new InputStreamReader (p.getErrorStream()));
    while ((msg = inOut.readLine()) != null)
    {
      out.println("Out = " + msg);
    }
    while ((emsg = inErr.readLine()) != null)
    {
      out.println("Error = "+ emsg);
    }
    p.destroy();
  } catch(Exception e) {
     out.println(e.toString());
  }
%>
</pre>
