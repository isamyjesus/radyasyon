<%@ Page language="VB" masterpagefile="~/mstr_mavimavi_std.master" %>
<%@ MasterType virtualpath="~/mstr_mavimavi_std.master" %>

<script runat="server">
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       

        Page.Title = "Global Güneş Radyasyon Dağılımı (HELIOSAT Model Ürünleri) - Meteoroloji Genel Müdürlüğü"


    End Sub
    
    

    
    Function tarih_duzelt(ByVal gelenTarih As String) As Date
        Try
            Return (gelenTarih.Substring(0, 2) & "." & gelenTarih.Substring(3, 2) & "." & gelenTarih.Substring(6, 4))
        Catch ex As Exception
            Return DateTime.Now
        End Try
    End Function
    
    'Sub linkle(ByVal idd As Integer, ByVal ay_no As String)
    '    Try
    '        Dim b As New HyperLink
    '        b.Text = ay_no
    '        b.NavigateUrl = "mgm.gov.tr" & idd
    '        b.ID = "deneme" & idd
    '        frm_aylar_yillar.Controls.Add(b)
    '    Catch ex As Exception
    '    End Try
    'End Sub

</script>

<asp:Content id="cHead" contentplaceholderid="cpHead" runat="Server">

<style type="text/css">
    /*  Sayfa Genel Tanımlamalar Başlangıç  */
    img {border:0;}
    h3 {
        font: bold 16px 'Roboto Slab', serif;
        line-height: 21px;
        color: #009cb3;
        text-align:left;
        }
    /*  Sayfa Genel Tanımlamalar Bitiş   */
    /*  Yerleşim Düzeni Başlangıç   */
    .fltLeft {float:left;} /*Sola hizala*/
    .fltRight {float:right;} /*Sağa hizala*/
    .fltClear{ /*Hizalamayı kaldır*/
        clear:both;
        height:0;
	    font-size: 1px;
	    line-height: 0px;
	    }
    .tumSayfa { /*Tüm sayfayı içeren div*/
        /*width:100%;
        min-height:100%;
        height:auto !important;
        height:100%;*/
        text-align:left;
        background-color:#fff;
        padding:0;
        margin: 0 auto;
    }
    .ust { /*Üst linklerin yer aldığı div*/
        /*height:100px;*/
        background-color:#fff;
        margin:0;
    }
    .alt {/*height:600px;*/} Resimlerin yer aldığı div
    /*  Yerleşim Düzeni Bitiş   */
    /*  Linkler Başlangıç  */
    ul.menu {
        list-style-type: none;
        padding-left: 0;
        margin-bottom: 5px; font-size:0;
        margin-left:0;
    }

    ul.menu li { 
        display: inline-block;
    }
    ul.menu li a { 
        text-decoration: none; 
        padding: .1em .4em;
        color: #fff;
    }
    .sayfaParagraf a.over { 
        background-color: #0069BA;
        color:#fff;
    }
    .sayfaParagraf a.out { 
        background-color:none; color:#0069ba;
    }
    .sayfaParagraf a:hover {background-color: #FF0101; color:#fff;}
    /*  Linkler Bitiş  */
    /*   Diğer   */
    .ustBaslik
    {
        color:#0069ba;
        margin:0;
        font: bold 'Roboto Slab', serif;
        /*text-align:center;*/
    }
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
    <script type="text/javascript">
        var path = "http://www.mgm.gov.tr/FTPDATA/arastirma/radyasyon_sonuc/Images/";
        var yil = "2004";
        var ay = "0";
        var yilActiveFirst = "y2004";
        var ayActiveFirst = "a0";
        var gunActiveFirst = "g00";
        var gun = "00";
        function ayCevir(ayNo) {
            var ayAd = "0";
            switch (ayNo) {
                case "01":
                    ayAd = "ocak";
                    break;
                case "02":
                    ayAd = "subat";
                    break;
                case "03":
                    ayAd = "mart";
                    break;
                case "04":
                    ayAd = "nisan";
                    break;
                case "05":
                    ayAd = "mayis";
                    break;
                case "06":
                    ayAd = "haziran";
                    break;
                case "07":
                    ayAd = "temmuz";
                    break;
                case "08":
                    ayAd = "agustos";
                    break;
                case "09":
                    ayAd = "eylul";
                    break;
                case "10":
                    ayAd = "ekim";
                    break;
                case "11":
                    ayAd = "kasim";
                    break;
                case "12":
                    ayAd = "aralik";
                    break;
                default:
                    ayAd = ayNo;
                    break;
            }
            return ayAd;
        }
        function ayCevir2(ayAd) {
            var ayNo = "0";
            switch (ayAd) {
                case "ocak":
                    ayNo = "01";
                    break;
                case "subat":
                    ayNo = "02";
                    break;
                case "mart":
                    ayNo = "03";
                    break;
                case "nisan":
                    ayNo = "04";
                    break;
                case "mayis":
                    ayNo = "05";
                    break;
                case "haziran":
                    ayNo = "06";
                    break;
                case "temmuz":
                    ayNo = "07";
                    break;
                case "agustos":
                    ayNo = "08";
                    break;
                case "eylul":
                    ayNo = "09";
                    break;
                case "ekim":
                    ayNo = "10";
                    break;
                case "kasim":
                    ayNo = "11";
                    break;
                case "aralik":
                    ayNo = "12";
                    break;
                default:
                    ayNo = ayAd;
                    break;
            }
            return ayNo;
        }
        function linkOlustur(gyil, gay, ggun, gActive, gHangi) {
            yil = gyil;
            ay = gay;
            gun = ggun;
            if (ay == "0") {
                link = path + yil + "/yillik_ortalama/" + yil + ".jpg";
            }
            else {
                if (gun == "00") {
                    ay = ayCevir(ay);
                    link = path + yil + "/aylik_ortalamalar/" + ay + ".jpg";
                }
                else {
                    ay = ayCevir2(ay);
                    link = path + yil + "/" + ay + "/" + yil + ay + gun + ".jpg";
                }
            }
            document.getElementById("im").setAttribute("src", link);
            document.getElementById(gActive).className = "over";
            switch (gHangi) {
                case "1":
                    if (yilActiveFirst != gActive) {
                        document.getElementById(yilActiveFirst).className = "out";
                        yilActiveFirst = gActive;
                    }
                    break;
                case "2":
                    if (ayActiveFirst != gActive) {
                        document.getElementById(ayActiveFirst).className = "out";
                        ayActiveFirst = gActive;
                        //document.getElementById("sfB").innerText = "if içi";
                        //document.getElementById("sfB").innerHtml = "if içi";
                    }
                    //document.getElementById("sfB").innerText = "if dışı";
                    //document.getElementById("sfB").innerHtml = "if dışı";
                    break;
                case "3":
                    if (gunActiveFirst != gActive) {
                        document.getElementById(gunActiveFirst).className = "out";
                        gunActiveFirst = gActive;
                    }
                    break;
            }
        }
        $(document).ready(function () {
            var kontrol = "0";
            $("#a0").on("click", function () {
                $("#gunler a").removeClass("over");
                $("#gunler a").addClass("out");
                $("#aylar a").removeClass("over");
                $("#aylar a").addClass("out");
                $("#g00").removeClass("over");
                $("#g00").addClass("out");
                kontrol = "0";
            });
            $("#gunler a").click(function () {
                kontrol = "1";
                $("#gunler a").removeClass("over");
                $("#gunler a").addClass("out");
                $(this).removeClass("out");
                $(this).addClass("over");
            });
            $("#yillar a").click(function () {
                kontrol = "1";
                $("#gunler a").removeClass("over");
                $("#gunler a").addClass("out");
                $("#aylar a").removeClass("over");
                $("#aylar a").addClass("out");
            });
            $("#g00").click(function () {
                kontrol = "1";
            });
            $("#aylar a").click(function () {
                if (kontrol == "0") {
                    $("#g00").removeClass("out");
                    $("#g00").addClass("over");
                }
                $("#aylar a").removeClass("over");
                $("#aylar a").addClass("out");
                $("#gunler a").removeClass("over");
                $("#gunler a").addClass("out");
                $(this).removeClass("out");
                $(this).addClass("over");
            });
        });

    </script>

</asp:Content>

<asp:Content id="cReklamUst" contentplaceholderid="cpReklamUst" runat="Server">
</asp:Content>

<asp:Content id="c_sayfa" contentplaceholderid="cp_sayfa" Runat="Server">
<div class="tumSayfa">
        <div class="ust">
        <h1 id="sfB">Global Güneş Radyasyon Dağılımı (HELIOSAT Model Ürünleri)</h1>
            <div class="ustBaslik" style="padding-left:0; margin-left:0">
                <p class="sayfaParagraf">
                    <strong></strong>
                    <em><a href="radyasyon.aspx" id="urun" class="over">Model Ürünleri</a> | 
                    <a href="radyasyon_verifikasyon.aspx" id="verif" class="out">Verifikasyon</a></em>
                </p>    
                 <p class="sayfaParagraf" id="yillar">
                        <strong>Yıllar:&nbsp;</strong>
                        <em>
                        <a href="#sfd" onclick="javscript:linkOlustur('2004','0','00','y2004','1')" id="y2004" class="over">2004</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2005','0','00','y2005','1')" id="y2005" class="out">2005</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2006','0','00','y2006','1')" id="y2006" class="out">2006</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2007','0','00','y2007','1')" id="y2007">2007</a> |
                       
                        <a href="#sfd" onclick="javscript:linkOlustur('2008','0','00','y2008','1')" id="y2008">2008</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2009','0','00','y2009','1')" id="y2009">2009</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2010','0','00','y2010','1')" id="y2010">2010</a> |
                       
                        <a href="#sfd" onclick="javscript:linkOlustur('2011','0','00','y2011','1')" id="y2011">2011</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2012','0','00','y2012','1')" id="y2012">2012</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2013','0','00','y2013','1')" id="y2013">2013</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2014','0','00','y2014','1')" id="y2014">2014</a> |
                        
                        <a href="#sfd" onclick="javscript:linkOlustur('2015','0','00','y2015','1')" id="A13">2015</a>
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'0',gun,'a0','2')" id="a0" class="over" style="visibility:hidden">Yıllık Ortalama</a>
                        </em>
                 </p>
                    <p class="sayfaParagraf" id="aylar">
                        <strong>Aylar:&nbsp;</strong>
                        <em>
                            
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'01','00','a1','2')" id="a1">Ocak</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'02','00','a2','2')" id="a2">Şubat</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'03','00','a3','2')" id="a3">Mart</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'04','00','a4','2')" id="a4">Nisan</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'05','00','a5','2')" id="a5">Mayıs</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'06','00','a6','2')" id="a6">Haziran</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'07','00','a7','2')" id="a7">Temmuz</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'08','00','a8','2')" id="a8">Ağustos</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'09','00','a9','2')" id="a9">Eylül</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'10','00','a10','2')" id="a10">Ekim</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'11','00','a11','2')" id="a11">Kasım</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,'12','00','a12','2')" id="a12">Aralık</a>
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'00','g00','3')" id="g00" class="out" style="visibility:hidden">Aylık Ortalama</a>
                        </em>
                   </p>
                    <p class="sayfaParagraf" id="gunler">
                        <strong>Gün:</strong>
                        <em>
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'01','g01','3')" id="g01" class="out">01</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'02','g02','3')" id="g02" class="out">02</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'03','g03','3')" id="g03" class="out">03</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'04','g04','3')" id="g04" class="out">04</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'05','g05','3')" id="g05" class="out">05</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'06','g06','3')" id="g06" class="out">06</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'07','g07','3')" id="g07" class="out">07</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'08','g08','3')" id="g08" class="out">08</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'09','g09','3')" id="g09" class="out">09</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'10','g10','3')" id="g10" class="out">10</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'11','g11','3')" id="g11" class="out">11</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'12','g12','3')" id="g12" class="out">12</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'13','g13','3')" id="g13" class="out">13</a> |
                      
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'14','g14','3')" id="g14" class="out">14</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'15','g15','3')" id="g15" class="out">15</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'16','g16','3')" id="g16" class="out">16</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'17','g17','3')" id="g17" class="out">17</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'18','g18','3')" id="g18" class="out">18</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'19','g19','3')" id="g19" class="out">19</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'20','g20','3')" id="g20" class="out">20</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'21','g21','3')" id="g21" class="out">21</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'22','g22','3')" id="g22" class="out">22</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'23','g23','3')" id="g23" class="out">23</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'24','g24','3')" id="g24" class="out">24</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'25','g25','3')" id="g25" class="out">25</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'26','g26','3')" id="g26" class="out">26</a> |
                       
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'27','g27','3')" id="g27" class="out">27</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'28','g28','3')" id="g28" class="out">28</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'29','g29','3')" id="g29" class="out">29</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'30','g30','3')" id="g30" class="out">30</a> |
                        
                            <a href="#sfd" onclick="javscript:linkOlustur(yil,ay,'31','g31','3')" id="g31" class="out">31</a>
                            </em>
                       </p>
            </div>
        </div>
        <div class="alt">
            <div>
                
                <img src="http://www.mgm.gov.tr/FTPDATA/arastirma/radyasyon_sonuc/Images/2004/yillik_ortalama/2004.jpg" alt="" name="im" id="im" class="bResim" />
            </div>
        </div>
    </div>
<div class="tiktik_aciklama">
<ul>
    <li><a href="../site/yardim2.aspx?=radyasyon_aciklama">Ayrıntılı Bilgi</a></li>
</ul>
</div>

</asp:Content>

<asp:Content id="cReklamYan" contentplaceholderid="cpReklamYan" runat="Server">
</asp:Content>

<asp:Content id="cAlt" contentplaceholderid="cpAlt" runat="Server">
</asp:Content>

