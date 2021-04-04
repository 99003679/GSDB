<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rubric.aspx.cs" Inherits="DemoRubric.Rubric" %>

 
  
    <!DOCTYPE html>  
  
    <html xmlns="http://www.w3.org/1999/xhtml">  
  
    <head runat="server">  
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>  
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>  
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
        <script src="/Scripts/Rubric.js" type="text/javascript"></script>
        <%--<script type="text/javascript" src="@Url.Content("/Scripts/Rubric.js")"></script>--%>
        <title></title>  
  
  
        <style type="text/css">  
            .auto-style1   
            {  
                width: 147px;  
            }  
        </style>  
    </head>  
  
    <body>  
        <form id="form1" runat="server"> 
            <div>  
  
                <table style="width:100%;">  
                    <tr>  
                        <td class="auto-style1"> </td>  
                        <td> </td>  
                        <td> </td>  
                    </tr>  
                    <tr>

                        <td class="auto-style1">Topic</td>
                        <td class="auto-style1">Basic</td>
                        <td class="auto-style1">Intermediate </td>
                        <td class="auto-style1">Expert</td>
                        <td class="auto-style1">Marks</td>
                        <td class="auto-style1">Improvements</td>
                        <td class="auto-style1">Strengths</td>
                    </tr> 
                    <tr>
                        <td>
                            <asp:TextBox ID="t1" name="Topic1"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check1(this)"
                       onclick="EnableDisableTextBox1(this)"
                       id="t1c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check1(this)"
                       onclick="EnableDisableTextBox1(this)"
                       id="t1c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check1(this)"
                       onclick="EnableDisableTextBox1(this)"
                       id="t1c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m1" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp1" name="imp1" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str1" name="str1" rows="2" runat="server"> </asp:TextBox></td>
             <td><asp:Button ID="btnSave" Text="Save" runat="server" /></td>
               </tr>             
           <tr>
                        <td>
                            <asp:TextBox id="t2" name="Topic2"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check2(this)"
                       onclick="EnableDisableTextBox2(this)"
                       id="t2c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check2(this)"
                       onclick="EnableDisableTextBox2(this)"
                       id="t2c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check2(this)"
                       onclick="EnableDisableTextBox2(this)"
                       id="t2c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m2" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp2" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str2" name="str" rows="2" runat="server"> </asp:TextBox></td>
                <td><asp:Button ID="Button2" Text="Save" runat="server" /></td>
                   </tr>       
                        <%--<td class="auto-style1"> </td>  
                        <td>  
                            <asp:Button ID="Button2" runat="server" Text="Submit" />  
                        </td>  
                        <td> </td>  --%>
             <tr>
                        <td>
                            <asp:TextBox id="t3" name="Topic3"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox3(this)"
                       id="t3c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox3(this)"
                       id="t3c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox3(this)"
                       id="t3c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m3" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp3" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str3" name="str" rows="2" runat="server"> </asp:TextBox></td>
                  <td><asp:Button ID="Button3" Text="Save" runat="server" /></td>
            </tr>
                   
               <tr>
            <td>
             <asp:TextBox id="t4" name="Topic4"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox4(this)"
                       id="t4c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox4(this)"
                       id="t4c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox4(this)"
                       id="t4c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m4" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp4" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str4" name="str" rows="2" runat="server"> </asp:TextBox></td>
                    <td><asp:Button ID="Button4" Text="Save" runat="server" /></td>
            </tr>

            <tr>
            <td>
             <asp:TextBox id="t5" name="Topic5"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox5(this)"
                       id="t5c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox5(this)"
                       id="t5c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox5(this)"
                       id="t5c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m5" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp5" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str5" name="str" rows="2" runat="server"> </asp:TextBox></td>
                 <td><asp:Button ID="Button5" Text="Save" runat="server" /></td>
            </tr>

            <tr>
            <td>
             <asp:TextBox id="t6" name="Topic6"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox6(this)"
                       id="t6c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox6(this)"
                       id="t6c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox6(this)"
                       id="t6c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m6" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp6" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str6" name="str" rows="2" runat="server"> </asp:TextBox></td>
                 <td><asp:Button ID="Button6" Text="Save" runat="server" /></td>
            </tr>

            <tr>
            <td>
             <asp:TextBox id="t7" name="Topic7"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox7(this)"
                       id="t7c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox7(this)"
                       id="t7c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox7(this)"
                       id="t7c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m7" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp7" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str7" name="str" rows="2" runat="server"> </asp:TextBox></td>
                 <td><asp:Button ID="Button7" Text="Save" runat="server" /></td>
            </tr>

            <tr>
            <td>
             <asp:TextBox id="t8" name="Topic8"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox8(this)"
                       id="t8c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox8(this)"
                       id="t8c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox8(this)"
                       id="t8c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m8" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp8" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str8" name="str" rows="2" runat="server"> </asp:TextBox></td>
                 <td><asp:Button ID="Button8" Text="Save" runat="server" /></td>
            </tr>

            <tr>
            <td>
             <asp:TextBox id="t9" name="Topic9"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox9(this)"
                       id="t9c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox9(this)"
                       id="t9c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox9(this)"
                       id="t9c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m9" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp9" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str9" name="str" rows="2" runat="server"> </asp:TextBox></td>
                 <td><asp:Button ID="Button9" Text="Save" runat="server" /></td>
            </tr>

        <tr>
            <td>
             <asp:TextBox id="t10" name="Topic10"  type="text" value="" maxlength="30"  runat="server"></asp:TextBox> 
                            </td>
           <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox10(this)"
                       id="t10c1"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox10(this)"
                       id="t10c2"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
                <input data-val="true"
                       data-val-required="The checkbox field is required."
                       onchange="check3(this)"
                       onclick="EnableDisableTextBox10(this)"
                       id="t10c3"
                       name="checkbox"
                       type="checkbox"
                       value="true" />
            </td>
            <td>
               <asp:TextBox enabled="false" id="m10" name="Marks" type="number" value=""
                       oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                       maxlength="2"  runat="server"> </asp:TextBox>
            </td>
            <td><asp:TextBox enabled="false" cols="20" id="imp10" name="imp" rows="2" runat="server"> </asp:TextBox></td>
            <td><asp:TextBox enabled="false" cols="20" id="str10" name="str" rows="2" runat="server"> </asp:TextBox></td>
             <td><asp:Button ID="Button10" Text="Save" runat="server" /></td>
            </tr>

        
        <tr><td ><asp:TextBox placeholder="PS Number" class="form-control" id="psno" name="psno" type="number" value="" runat="server"> </asp:TextBox></td>
        <td ><asp:TextBox placeholder="ModuleName" class="form-control" id="Mod" name="mod" type="text" value="" runat="server"> </asp:TextBox></td>
            <td style="visibility:hidden"></td >
        <td style="visibility:hidden"></td>
        <td style="visibility:hidden"></td>
            </tr>
             
                       
       <%-- <td><asp:TextBox type="text" name="total" id="total" runat="server"> </asp:TextBox>
            <br /><br /> 
            <asp:Button onclientclick="return sumInputs()" ID="Button1" runat="server" Text="Submit" />  
            <%--<a href="javascript:sumInputs()">Total</a>--%>
            </td></tr>--%>

   </table>  
               
  
            </div>  
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://cdn.jsdelivr.net/json2/0.1/json2.js"></script>
        <script type="text/javascript">
    $(function () {
        $("[id*=btnSave]").bind("click", function () {
            var user = {};
            user.TopicName = $("[id*=Topic1]").val();
            user.Basic - $("[id*=t1c1]").val();
            user.Intermediate - $("[id*=t1c2]").val();
            user.Expert - $("[id*=t1c3]").val();
            user.ModuleName = $("[id*=Mod]").val();
            user.PSNumber = $("[id*=psno]").val();
            user.Marks = $("[id*=m1]").val();
            user.Improvements = $("[id*=imp1]").val();
            user.Strengths = $("[id*=str1]").val();
            $.ajax({
                type: "POST",
                url: "Rubric.aspx.cs/SaveUser",
                data: '{user: ' + JSON.stringify(user) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("User has been added successfully.");
                    window.location.reload();
                }
            });
            return false;
        });
    });
        </script>
            </form>
  
    </body>  
  
    </html>  