using System;
using System.Drawing;
using DevExpress.XtraGauges.Core.Primitive;

namespace CustomDraw {
    public partial class _Default : System.Web.UI.Page {
        static SolidBrush WatermarkBrush = new SolidBrush(Color.FromArgb(0x30, 0, 0, 0xFF));
        static Font WatermarkFont = new Font(FontFamily.GenericSerif, 16);
        static StringFormat WatermarkStringFormat = new StringFormat();
        static _Default() {
            WatermarkStringFormat.Alignment = StringAlignment.Center;
            WatermarkStringFormat.LineAlignment = StringAlignment.Center;
        }
        //
        protected void Page_Init(object sender, EventArgs e) {
            arcScaleBackgroundLayer.CustomDrawElement += arcScaleBackgroundLayer_CustomDrawElement;
        }
        protected void Page_Load(object sender, EventArgs e) {
            arcScale.Value = (float)value.Number;
        }
        void arcScaleBackgroundLayer_CustomDrawElement(object sender, CustomDrawElementEventArgs e) {
            e.Draw();
            DrawWatermark(e);
            e.Handled = true;
        }
        void DrawWatermark(CustomDrawElementEventArgs e) {
            e.Context.Graphics.DrawString("DevExpress ASPxGauges", WatermarkFont, WatermarkBrush, e.Info.BoundBox, WatermarkStringFormat);
        }
    }
}