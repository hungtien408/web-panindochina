using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assets_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int str = kiemtrastr("c,a,c", "c,a,c,c,a,a,c");
        Response.Write(str.ToString() +"<br/>");
        var count = demso(str, "c,a,c,c,a,a,c", "c");
        Response.Write(count.ToString() + "<br/>");
        var strd = posstr(str, "c,a,c,c,a,a,c", "c");
        Response.Write(strd.ToString() + "<br/>");
        var startstr = posstart(strd.ToString());
        Response.Write(startstr.ToString() + "<br/>");
        var positionstr = positionStr(startstr, strd);
        Response.Write(positionstr.ToString() + "<br/>");
        var strg = giaostr("3,4,7", "2,3,4,7");
        Response.Write(strg.ToString() + "<br/>");
        var startstr1 = posstart(strg.ToString());
        Response.Write(startstr1.ToString() + "<br/>");
        var positionstr1 = positionStr(startstr1, strg);
        Response.Write(positionstr1.ToString() + "<br/>");
        var sumb = sumbit("1011");
        Response.Write(sumb.ToString() + "<br/>");
        var cuts = cutbit("00010110100");
        Response.Write(cuts.ToString() + "<br/>");
    }
    public int kiemtrastr(string stra, string strb)
    {
        var straArray = stra.Split(',');
        var strbArray = strb.Split(',');
        var lena = straArray.Length;
        var lenb = strbArray.Length;
        var lenc = 0;
        var pos = "";
        var hstr = "";
        int numpos = 0;
        for (var i = 0; i < lena; i++)
        {
            for (var j = 0; j < lenb; j++)
            {
                if (straArray[i] == straArray[j] && lenc <= j)
                {
                    pos += "," + (j + 1);
                    lenc++;
                    break;
                }
            }
        }
        var posArray = pos.Split(',');
        if (lenc == lena)
        {

            if (lenc == 1)
            {
                numpos = 1;
            }
            else
            {
                for (int k = 1; k < posArray.Length; k++)
                {
                    for (int ka = k + 1; ka < posArray.Length; ka++)
                    {
                        int num1 = Int32.Parse(posArray[k]);
                        int num2 = Int32.Parse(posArray[ka]);
                        if (num1 > num2)
                        {
                            numpos = 0;
                            break;
                        }
                        else
                        {
                            numpos = ka;
                        }
                    }
                }
            }
        }
        return numpos;
    }

    public int demso(int start, string str, string dk)
    {
        var strArray = str.Split(',');
        var countsum = 0;
        for (int i = start; i < strArray.Length; i++)
        {
            if (strArray[i].ToString() == dk)
            {
                countsum++;
            }
        }
        return countsum;
    }
    public string posstr(int start, string str, string dk)
    {
        var strArray = str.Split(',');
        var strl = "";
        for (int i = start; i < strArray.Length; i++)
        {
            if (strArray[i].ToString() == dk)
            {
                strl += "," + (i+1);
            }
        }
        return strl.Remove(0,1);
    }
    public string posstart(string str)
    {
        var strArray = str.Split(',');
        return strArray[0].ToString();
    }
    public string positionStr(string strstart, string str)
    {
        strstart += ":" + str;
        return strstart;
    }
    public string giaostr(string str1, string str2){
        var straArray = str1.Split(',');
        var strbArray = str2.Split(',');
        var strgiao = "";
        var result = "";
        var nstep = 0;
        if (str1 == "null" || str1 == "" || str2 == "null" || str2 == "")
        {
            result = "null";
        }
        else
        {
            for (var i = 0; i < straArray.Length; i++)
            {
                for (var j = 0; j < strbArray.Length; j++)
                {
                    if (straArray[i] == strbArray[j])
                    {
                        strgiao += "," + straArray[i];
                        nstep++;
                    }
                }
            }
            if (nstep > 0)
            {
                result = strgiao.Remove(0, 1);
            }
            else
            {
                result = "null";
            }
        }
        return result.ToString();
    }
    public int sumbit(string bitvector){
        var sumb = 0;
        for (var i = 0; i < bitvector.Length; i++)
        {
            if (bitvector[i].ToString() == "1")
            {
                sumb++;
            }
        }
        return sumb;
    }
    public string cutbit(string bitvector)
    {
        var stringbit = bitvector;
        var strcut  = "";
        var sunstart = 0;
        var sunend = 0;
        for (var i = 0; i < bitvector.Length; i++)
        {
            var j = (bitvector.Length - 1) - i;
            if (bitvector[i].ToString() == "0")
            {
                sunstart++;
            }
            else
            {
                break;
            }
            if (bitvector[j].ToString() == "0")
            {
                sunend++;
            }
            else
            {
                break;
            }
        }
        var numa = bitvector.Length - sunstart - sunend;
        strcut = stringbit.Substring(sunstart, numa);
        return strcut;
    }
}