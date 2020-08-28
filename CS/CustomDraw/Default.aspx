<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CustomDraw._Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges.Gauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges.Gauges.State" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript">
        // <![CDATA[
        var isDirty;
        function PerformCallbackCore() {
            var gauge = window["gauge"];
            isDirty = gauge.InCallback();
            if (!isDirty)
                gauge.PerformCallback();
        }
        function OnChanged() {
            PerformCallbackCore();
        }
        function OnEndCallback() {
            if (isDirty)
                window.setTimeout(PerformCallbackCore, 0);
        }
        // ]]> 
    </script>

    <div>
        <dx:ASPxGaugeControl runat="server" Height="300px" Width="300px" BackColor="Transparent" ID="gaugeControl" ClientInstanceName="gauge"
            SaveStateOnCallbacks="false">
            <ClientSideEvents EndCallback="OnEndCallback" />
            <Gauges>
                <dx:CircularGauge Bounds="0, 0, 300, 300" Name="cGauge">
                    <scales>
                        <dx:ArcScaleComponent AppearanceTickmarkText-Font="Tahoma, 11pt" ID="arcScale" Name="arcScale"
                            AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                            Center="125, 125" EndAngle="60" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-3.5" 
                            MajorTickmark-ShapeType="Circular_Style1_4" MajorTickmark-TextOffset="-15" MajorTickmark-TextOrientation="LeftToRight" 
                            MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeType="Circular_Style1_3" StartAngle="-240" 
                            Value="80">
                        </dx:ArcScaleComponent>
                    </scales>
                    <backgroundlayers>
                        <dx:ArcScaleBackgroundLayerComponent  ID="arcScaleBackgroundLayer" Name="bg" ScaleID="arcScale" ShapeType="CircularFull_Style1" ZOrder="1000" />
                    </backgroundlayers>
                    <needles>
                        <dx:ArcScaleNeedleComponent ID="arcScaleNeedle" Name="needle" ScaleID="arcScale" ShapeType="CircularFull_Style1" StartOffset="-4.5" 
                            ZOrder="-50" />
                    </needles>
                </dx:CircularGauge>
            </Gauges>
        </dx:ASPxGaugeControl>
        <table border="0" cellpadding="4" cellspacing="0">
            <tr>
                <td align="left">
                    Value:
                </td>
                <td align="left">
                    <dx:ASPxSpinEdit ID="value" runat="server" MaxValue="100" MinValue="0" Number="60" Width="120px" NumberType="Float" Increment="1"
                        LargeIncrement="5" SpinButtons-ShowLargeIncrementButtons="true">
                        <ClientSideEvents NumberChanged="OnChanged" />
                    </dx:ASPxSpinEdit>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
