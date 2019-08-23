
Option Explicit
   Dim rowsNum
   rowsNum = 0
'-----------------------------------------------------------------------------
' Main function
'-----------------------------------------------------------------------------
' Get the current active model
Dim Model
Set Model = ActiveModel
If (Model Is Nothing) Or (Not Model.IsKindOf(PdPDM.cls_Model)) Then
  MsgBox "The current model is not an PDM model."
Else
 ' Get the tables collection
 '创建EXCEL APP
 dim beginrow
 DIM EXCEL, SHEET
 set EXCEL = CREATEOBJECT("Excel.Application")
 EXCEL.workbooks.add(-4167)'添加工作表
 EXCEL.workbooks(1).sheets(1).name ="test"
 set sheet = EXCEL.workbooks(1).sheets("test")

 ShowProperties Model, SHEET
 EXCEL.visible = true
 '设置列宽和自动换行
 sheet.Columns(1).ColumnWidth = 20
 sheet.Columns(2).ColumnWidth = 15
 sheet.Columns(4).ColumnWidth = 12
 sheet.Columns(5).ColumnWidth = 25
 sheet.Columns(1).WrapText =true
 sheet.Columns(2).WrapText =true
 sheet.Columns(4).WrapText =true
 sheet.Columns(5).WrapText =true
 End If
'-----------------------------------------------------------------------------
' Show properties of tables
'-----------------------------------------------------------------------------
Sub ShowProperties(mdl, sheet)
   ' Show tables of the current model/package
   rowsNum=0
   beginrow = rowsNum+1
   ' For each table
   output "begin"
   Dim tab
   For Each tab In mdl.tables
      ShowTable tab,sheet
   Next
   if mdl.tables.count > 0 then
        sheet.Range("A" & beginrow + 1 & ":A" & rowsNum).Rows.Group
   end if
   output "end"
End Sub
'-----------------------------------------------------------------------------
' Show table properties
'-----------------------------------------------------------------------------
Sub ShowTable(tab, sheet)
   If IsObject(tab) Then
     Dim rangFlag
     rowsNum = rowsNum + 2
      ' Show properties
      Output "================================"
      sheet.cells(rowsNum, 1) = tab.code + "(" + tab.name + ")"
      sheet.Range(sheet.cells(rowsNum, 1),sheet.cells(rowsNum, 5)).Merge
      sheet.Range(sheet.cells(rowsNum, 1),sheet.cells(rowsNum, 5)).HorizontalAlignment = 3
      sheet.Range(sheet.cells(rowsNum, 1),sheet.cells(rowsNum, 5)).Font.Bold = True
      sheet.Range(sheet.cells(rowsNum, 1),sheet.cells(rowsNum, 5)).Font.Size = 20
      rowsNum = rowsNum + 1
      sheet.cells(rowsNum, 1) = "字段"
      sheet.cells(rowsNum, 2) = "类型"
      sheet.cells(rowsNum, 3) = "默认值"
      sheet.cells(rowsNum, 4) = "是否非空？"
      sheet.cells(rowsNum, 5) = "说明"
      '设置边框
      sheet.Range(sheet.cells(rowsNum-1, 1),sheet.cells(rowsNum, 5)).Borders.LineStyle = "0"
Dim col ' running column
Dim colsNum
colsNum = 0
      for each col in tab.columns
        rowsNum = rowsNum + 1
        colsNum = colsNum + 1
      sheet.cells(rowsNum, 1) = col.code
      sheet.cells(rowsNum, 2) = col.datatype
      sheet.cells(rowsNum, 3) = col.defaultvalue
      sheet.cells(rowsNum, 4) = col.mandatory
      sheet.cells(rowsNum, 5) = col.comment
      next
      sheet.Range(sheet.cells(rowsNum-colsNum,1),sheet.cells(rowsNum,5)).Borders.LineStyle = "1"
      sheet.Range(sheet.cells(rowsNum-colsNum,1),sheet.cells(rowsNum,5)).HorizontalAlignment = 2
      rowsNum = rowsNum + 1
      sheet.Range(sheet.cells(rowsNum, 1),sheet.cells(rowsNum, 5)).Merge
      sheet.Range(sheet.cells(rowsNum, 1),sheet.cells(rowsNum, 5)).Borders.LineStyle = "1"
      sheet.cells(rowsNum, 1) = "索引："
      Output "FullDescription: "       + tab.Name
   End If
End Sub