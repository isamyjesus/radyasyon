<%@ Page language="VB" masterpagefile="~/mstr_mavimavi_std.master" Title="Global Güneş Radyasyonu - Verifikasyon" %>

<%@ Import Namespace="System.IO" %>
<%@ MasterType virtualpath="~/mstr_mavimavi_std.master" %>

<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Master.menuKontrol("anasayfa")

        Dim oncekisayfa As String
        oncekisayfa = Request.ServerVariables("HTTP_REFERER")
        
        lnk_radyasyon_verifikasyon.NavigateUrl = oncekisayfa
        
        
    End Sub
</script>

<asp:Content id="cHead" contentplaceholderid="cpHead" runat="Server">
<link href="../App_Themes/mavimavi/cssTablo.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
    ul.menu {
        list-style-type: none;
        padding-left: 0;
        font-size:0;
        margin-left:0;
    }

    ul.menu li { 
        display: inline-block; font-size:16px;
    }
    ul.menu li a { 
        text-decoration: none; 
        color: #fff;
        background-color: #a3a3a3 ;
        border-right:1px solid #fff;
        padding: .1em .4em;
        font-size:14px;
    }
    ul.menu li a:hover {background-color: #f00;}
    ul.menu li a.over { 
        background-color: #f00 ;
    }
    ul.menu li a.out { 
        background-color: #a3a3a3 ;
    }
    table { width:700px; height:200px; -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;}
    caption { 
    padding: 0 0 5px 0; 
    font: 14px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    text-align: right; 
    }
    td.solBorder 
    {
        border-left:1px solid #e0e0e0;
    }
    th { 
    font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #474747; 
    border-bottom:1px solid #E0E0E0;
    border-right:1px solid #E0E0E0;
    border-top:1px solid #E0E0E0;
    letter-spacing: 2px; 
    text-align: left; 
    padding: 6px; 
    background-color: #d3d3d3; 
} 
th.bgYok {  
    border-right: 1px solid #E0E0E0;
    border-left: 1px solid #E0E0E0;
    border-top: 1px solid #E0E0E0;
    font: bold 14px;
    background: none; 
}
tr.baslikBir { 
    border-left: 1px solid #E0E0E0; 
    border-top: 0; 
    padding-left:25px; 
    background-color: #fff; 
}

tr.baslikIki { 
    border-left: 1px solid #E0E0E0; 
    border-top: 0; 
    padding-left:25px; 
    background-color: #F3F3F3; 
}
td { 
    border-bottom:1px solid #E0E0E0; 
    border-right:1px solid #E0E0E0; 
    padding: 6px; 
    color: #474747; 
    font:11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
}
select {
    padding:3px;
    margin: 0;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    border-radius:4px;
    background: #f8f8f8;
    color:#888;
    border:none;
    outline:none;
    display: inline-block;
    cursor:pointer;
}
    ul.thumb
    {
        list-style-type: none;
        padding-left: 0;
        font-size:0;
        margin-left:0;
    }
    ul.thumb li 
    {
        display: inline-block; font-size:16px;
    }
    ul.thumb li a img
    {
        width:100px;
        height:100px;
    }
    ul.thumb li a
    {
        text-decoration:none;
    }
    ul.thumb li a:hover
    {
        text-decoration:none;
        background:none;
    }
    #backgroundPopup {
    z-index:1;
    position: fixed;
    display:none;
    height:100%;
    width:100%;
    background:#000000;
    top:0px;
    left:0px;
}

#toPopup {
    font-family: "lucida grande",tahoma,verdana,arial,sans-serif;
    background: none repeat scroll 0 0 #FFFFFF;
    border: 10px solid #ccc;
    border-radius: 3px 3px 3px 3px;
    color: #333333;
    display: none;
    font-size: 14px;
    left: 4%;
    margin-left: 4px;
    position: fixed;
    top: 4%;
    width: 1030px;
    z-index: 2;
}
div.loader {
    background: url("../img/loading.gif") no-repeat scroll 0 0 transparent;
    height: 32px;
    width: 32px;
    display: none;
    z-index: 9999;
    top: 50%;
    left: 50%;
    position: absolute;
    margin-left: -10px;
}
div.close {
    background: url("../img/closebox.png") no-repeat scroll 0 0 transparent;
    cursor: pointer;
    height: 30px;
    position: absolute;
    right: -27px;
    top: -24px;
    width: 30px;
    color:#fff;
}
span.ecs_tooltip {
    background: none repeat scroll 0 0 #000000;
    border-radius: 2px 2px 2px 2px;
    color: #FFFFFF;
    display: none;
    font-size: 11px;
    height: 16px;
    opacity: 0.7;
    padding: 4px 3px 2px 5px;
    position: absolute;
    right: -62px;
    text-align: center;
    top: 4px;
    width: 93px;
}
span.arrow {
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 7px solid #000000;
    display: block;
    height: 1px;
    left: 40px;
    position: relative;
    top: 3px;
    width: 1px;
}
div#popup_content {
    margin: 4px 7px;
    overflow-y:scroll;
    height:650px
    
}
.sayfaParagraf a.over { 
        background-color: #0069BA;
        color:#fff;
    }
    .sayfaParagraf a.out { 
        background-color:none; color:#0069ba;
    }
    .sayfaParagraf a:hover {background-color: #FF0101; color:#fff;}
    </style>
    <script type="text/javascript" src="http://www.mgm.gov.tr/jQuery/scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var istasyonlar = ["Adana", "Afyonkarahisar Bölge", "Ağrı", "Aksaray", "Akşehir", "Amasra", "Ankara Bölge", "Artvin", "Aydın", "Beyşehir", "Boğazlıyan", "Bolu", "Bozova", "Burhaniye", "Bursa", "Ceylanpınar Tigem", "Çanakkale", "Develi", "Divriği", "DMI Genel Müdürlük", "Doğubeyazıt", "Elmalı", "Ergani", "Gemerek", "Göksun", "Gümüşhane", "Hakkari", "Isparta Bölge", "Karaman", "Kars Bölge", "Kastamonu", "Kemalpaşa", "Kırklareli", "Kilis", "Kulu", "Malatya Bölge", "Malazgirt", "Mardin", "Menemen", "Muğla", "Palu", "Pınarbaşı", "Rize", "Samandıra Meydan", "Sinop", "Sivrihisar", "Solhan", "Suşehri", "Şırnak", "Tarsus", "Tekirdağ", "Tercan", "Tokat Bölge", "Ulukışla", "Ünye", "Van Bölge"];
            var indikator = ["17351", "17190", "17099", "17192", "17239", "17602", "17130", "17045", "17234", "17242", "17760", "17070", "17944", "17722", "17116", "17968", "17112", "17836", "17734", "17725", "17720", "17952", "17847", "17162", "17866", "17088", "17285", "17240", "17246", "17097", "17074", "17749", "17052", "17262", "17754", "17199", "17780", "17275", "17789", "17292", "17806", "17802", "17040", "17065", "17026", "17726", "17776", "17684", "17287", "17978", "17056", "17718", "17086", "17906", "17624", "17172"];
            var str = "";
            var secilen = "17130";
            var sira = 84;
            var dosyaadi = "http://www.mgm.gov.tr/FTPDATA/arastirma/radyasyon_sonuc/radyasyon_sonuclar/2015/rs_";
            for (i = 0; i < 56; i++) {
                str += "<option value='" + indikator[i] + "'>" + istasyonlar[i] + "</option>";
            }
            $("#selectist").html(str);
            $("#selectist option").eq(6).attr("selected", "selected");
            $("#selectist").change(function () {
                secilen = $("select option:selected").attr("value");
                $.get(dosyaadi + secilen + ".txt", function (data) {
                    satir = data.split("\n");
                    for (var i = sira; i < sira + 7; i++) {
                        var hucre = satir[i].split("|");
                        for (var j = 0; j < hucre.length; j++) {
                            if (i % 7 == 0)
                                $("#baslik th").eq(j).text(hucre[j]);
                            else if (i % 7 == 1)
                                $("#mbe td").eq(j).text(hucre[j]);
                            else if (i % 7 == 2)
                                $("#rmse td").eq(j).text(hucre[j]);
                            else if (i % 7 == 3)
                                $("#rmbe td").eq(j).text(hucre[j]);
                            else if (i % 7 == 4)
                                $("#rrmse td").eq(j).text(hucre[j]);
                            else if (i % 7 == 5)
                                $("#stdev td").eq(j).text(hucre[j]);
                            else if (i % 7 == 6)
                                $("#core td").eq(j).text(hucre[j]);
                        }
                    }
                }, "text");
            });
            var satir;
            $.get(dosyaadi + secilen + ".txt", function (data) {
                satir = data.split("\n");
                for (var i = 84; i < 91; i++) {
                    var hucre = satir[i].split("|");
                    for (var j = 0; j < hucre.length; j++) {
                        if (i % 7 == 0)
                            $("#baslik th").eq(j).text(hucre[j]);
                        else if (i % 7 == 1)
                            $("#mbe td").eq(j).text(hucre[j]);
                        else if (i % 7 == 2)
                            $("#rmse td").eq(j).text(hucre[j]);
                        else if (i % 7 == 3)
                            $("#rmbe td").eq(j).text(hucre[j]);
                        else if (i % 7 == 4)
                            $("#rrmse td").eq(j).text(hucre[j]);
                        else if (i % 7 == 5)
                            $("#stdev td").eq(j).text(hucre[j]);
                        else if (i % 7 == 6)
                            $("#core td").eq(j).text(hucre[j]);
                    }
                }
            }, "text");
            $('#yillar a').on("click", function () {
                $("#yillar a").removeClass("over");
                $("#yillar a").addClass("out");
                $(this).removeClass("out");
                $(this).addClass("over");
                var gid = $(this).attr("id");
                switch (gid) {
                    case "y4":
                        sira = 0;
                        break;
                    case "y5":
                        sira = 7;
                        break;
                    case "y6":
                        sira = 14;
                        break;
                    case "y7":
                        sira = 21;
                        break;
                    case "y8":
                        sira = 28;
                        break;
                    case "y9":
                        sira = 35;
                        break;
                    case "y10":
                        sira = 42;
                        break;
                    case "y11":
                        sira = 49;
                        break;
                    case "y12":
                        sira = 56;
                        break;
                    case "y13":
                        sira = 63;
                        break;
                    case "y14":
                        sira = 70;
                        break;
                    case "y15":
                        sira = 77;
                        break;
                    case "ave":
                        sira = 84;
                        break;
                }
                for (var i = sira; i < sira + 7; i++) {
                    var hucre = satir[i].split("|");
                    for (var j = 0; j < hucre.length; j++) {
                        if (i % 7 == 0)
                            $("#baslik th").eq(j).text(hucre[j]);
                        else if (i % 7 == 1)
                            $("#mbe td").eq(j).text(hucre[j]);
                        else if (i % 7 == 2)
                            $("#rmse td").eq(j).text(hucre[j]);
                        else if (i % 7 == 3)
                            $("#rmbe td").eq(j).text(hucre[j]);
                        else if (i % 7 == 4)
                            $("#rrmse td").eq(j).text(hucre[j]);
                        else if (i % 7 == 5)
                            $("#stdev td").eq(j).text(hucre[j]);
                        else if (i % 7 == 6)
                            $("#core td").eq(j).text(hucre[j]);
                    }
                }
            });


            $("a.topopup").click(function () {
                loading(); // loading
                setTimeout(function () { // then show popup, deley in .5 second
                    loadPopup(); // function show popup
                }, 500); // .5 second
                return false;
            });

            /* event for close the popup */
            $("div.close").hover(
					function () {
					    $('span.ecs_tooltip').show();
					},
					function () {
					    $('span.ecs_tooltip').hide();
					}
				);

            $("div.close").click(function () {
                disablePopup();  // function close pop up
            });

            $(this).keyup(function (event) {
                if (event.which == 27) { // 27 is 'Ecs' in the keyboard
                    disablePopup();  // function close pop up
                }
            });

            $("div#backgroundPopup").click(function () {
                disablePopup();  // function close pop up
            });

            $('a.livebox').click(function () {
                alert('Hello World!');
                return false;
            });

            /************** start: functions. **************/
            function loading() {
                $("div.loader").show();
            }
            function closeloading() {
                $("div.loader").fadeOut('normal');
            }

            var popupStatus = 0; // set value

            function loadPopup() {
                if (popupStatus == 0) { // if value is 0, show popup
                    closeloading(); // fadeout loading
                    $("#toPopup").fadeIn(0500); // fadein popup div
                    $("#backgroundPopup").css("opacity", "0.7"); // css opacity, supports IE7, IE8
                    $("#backgroundPopup").fadeIn(0001);
                    popupStatus = 1; // and set value to 1
                }
            }

            function disablePopup() {
                if (popupStatus == 1) { // if value is 1, close popup
                    $("#toPopup").fadeOut("normal");
                    $("#backgroundPopup").fadeOut("normal");
                    popupStatus = 0;  // and set value to 0
                }
            }
            /************** end: functions. **************/
            $("#r1").click(function () {
                $("#popResim").attr("src", "../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/rMBE.png");
            });
            $("#r2").click(function () {
                $("#popResim").attr("src", "../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/rRMSE.png");
            });
            $("#r3").click(function () {
                $("#popResim").attr("src", "../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/std.png");
            });

        });
    </script>

</asp:Content>

<asp:Content id="cReklamUst" contentplaceholderid="cpReklamUst" runat="Server">
</asp:Content>

<asp:Content id="c_sayfa" contentplaceholderid="cp_sayfa" Runat="Server">
<h1 id="sfB">Verifikasyon</h1>
    <p class="sayfaParagraf">
                    <strong></strong>
                    <em><a href="radyasyon.aspx" id="urun" class="out">Model Ürünleri</a> | 
                    <a href="radyasyon_verifikasyon.aspx" id="verif" class="over">Verifikasyon</a></em>
                    
                </p>  <br />
<!-- ########################################################################## sayfa ######################################### -->
<br class="clear" />
<ul class="thumb">
<li><a href="" class="topopup" id="r1"><img src="../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/rMBE.png" alt="" /></a></li>
<li><a href="" class="topopup" id="r2"><img src="../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/rRMSE.png" alt="" /></a></li>
<li><a href="" class="topopup" id="r3"><img src="../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/std.png" alt="" /></a></li>
</ul>
<div id="toPopup">
      <div class="close"> X </div>
      <span class="ecs_tooltip">Kapatmak için ESC<span class="arrow"></span></span>
      <div id="popup_content"> <!--your content start-->
           <img src="../FTPDATA/arastirma/radyasyon_sonuc/istatistik_harita/rMBE.png" alt="" style="width:1000px; height:600px;" id="popResim" />
      </div> <!--your content end-->
  </div> <!--toPopup end-->
<div class="loader">Yükleniyor...</div>
<div id="backgroundPopup"></div>

<br />
<div><select id="selectist" style="float:left">

</select>&nbsp;&nbsp;&nbsp;
<ul id="yillar" class="menu"  style="float:left; margin-left:16px; margin-top:0; padding-top:0">
<li><a href="#sfB" id="y4" class="out">2004</a></li>
<li><a href="#sfB" id="y5" class="out">2005</a></li>
<li><a href="#sfB" id="y6" class="out">2006</a></li>
<li><a href="#sfB" id="y7" class="out">2007</a></li>
<li><a href="#sfB" id="y8" class="out">2008</a></li>
<li><a href="#sfB" id="y9" class="out">2009</a></li>
<li><a href="#sfB" id="y10" class="out">2010</a></li>
<li><a href="#sfB" id="y11" class="out">2011</a></li>
<li><a href="#sfB" id="y12" class="out">2012</a></li>
<li><a href="#sfB" id="y13" class="out">2013</a></li>
<li><a href="#sfB" id="y14" class="out">2014</a></li>
<li><a href="#sfB" id="y15" class="out">2015</a></li>
<li><a href="#sfB" id="ave" class="over">Ortalama</a></li>
</ul></div><br />
<table cellspacing="1" class="uzerinde" id="tblSonuclar" summary="Radyasyon Verifikasyon Sonuçları" style="clear:both">
<caption>Radyasyon Verifikasyon Sonuçları</caption>
<thead> 
<tr id="baslik">
<th id="yil" scope="col" class="bgYok"></th>
<th id="ay1" scope="col"></th>
<th id="ay2" scope="col"></th>
<th id="ay3" scope="col"></th>
<th id="ay4" scope="col"></th>
<th id="ay5" scope="col"></th>
<th id="ay6" scope="col"></th>
<th id="ay7" scope="col"></th>
<th id="ay8" scope="col"></th>
<th id="ay9" scope="col"></th>
<th id="ay10" scope="col"></th>
<th id="ay11" scope="col"></th>
<th id="ay12" scope="col"></th>
<th id="yillik" scope="col"></th>
</tr>
</thead>
<tbody> 
<tr id="mbe" class="baslikBir">
<td class="solBorder"></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr id="rmse" class="baslikIki">
<td class="solBorder"></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr id="rmbe" class="baslikBir">
<td class="solBorder"></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr id="rrmse" class="baslikIki">
<td class="solBorder"></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr id="stdev" class="baslikBir">
<td class="solBorder"></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr id="core" class="baslikIki">
<td class="solBorder"></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<%' ############################################################################################################# %>
<asp:panel id="pnl_radyasyon_verifikasyon" runat="server">
    <asp:hyperlink id="lnk_radyasyon_verifikasyon" runat="server" text="Önceki Sayfa"></asp:hyperlink>
<hr />
</asp:panel>

</asp:Content>

<asp:Content id="cReklamYan" contentplaceholderid="cpReklamYan" runat="Server">
</asp:Content>

<asp:Content id="cAlt" contentplaceholderid="cpAlt" runat="Server">
</asp:Content>

