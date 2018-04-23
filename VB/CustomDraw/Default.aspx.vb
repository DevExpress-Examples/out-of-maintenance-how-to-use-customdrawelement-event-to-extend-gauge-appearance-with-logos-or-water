Imports Microsoft.VisualBasic
Imports System
Imports System.Drawing
Imports DevExpress.XtraGauges.Core.Primitive

Namespace CustomDraw
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Private Shared WatermarkBrush As New SolidBrush(Color.FromArgb(&H30, 0, 0, &HFF))
		Private Shared WatermarkFont As New Font(FontFamily.GenericSerif, 16)
		Private Shared WatermarkStringFormat As New StringFormat()
		Shared Sub New()
			WatermarkStringFormat.Alignment = StringAlignment.Center
			WatermarkStringFormat.LineAlignment = StringAlignment.Center
		End Sub
		'
		Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
			AddHandler arcScaleBackgroundLayer.CustomDrawElement, AddressOf arcScaleBackgroundLayer_CustomDrawElement
		End Sub
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			arcScale.Value = CSng(value.Number)
		End Sub
		Private Sub arcScaleBackgroundLayer_CustomDrawElement(ByVal sender As Object, ByVal e As CustomDrawElementEventArgs)
			e.Draw()
			DrawWatermark(e)
			e.Handled = True
		End Sub
		Private Sub DrawWatermark(ByVal e As CustomDrawElementEventArgs)
			e.Context.Graphics.DrawString("DevExpress ASPxGauges", WatermarkFont, WatermarkBrush, e.Info.BoundBox, WatermarkStringFormat)
		End Sub
	End Class
End Namespace