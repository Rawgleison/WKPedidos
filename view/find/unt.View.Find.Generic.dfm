object frmFindGeneric: TfrmFindGeneric
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmFindGeneric'
  ClientHeight = 646
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 65
    Align = alTop
    TabOrder = 0
    object edtFindByName: TEdit
      Left = 16
      Top = 16
      Width = 377
      Height = 33
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtFindByNameChange
    end
  end
  object dbgLista: TDBGrid
    Left = 0
    Top = 65
    Width = 431
    Height = 581
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsLista
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgListaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 319
        Visible = True
      end>
  end
  object dsLista: TDataSource
    AutoEdit = False
    Left = 208
    Top = 256
  end
end
