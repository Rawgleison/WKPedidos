object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  Caption = 'WKTechnology'
  ClientHeight = 644
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCliente: TPanel
    Left = 0
    Top = 81
    Width = 994
    Height = 80
    Align = alTop
    Color = clGrayText
    ParentBackground = False
    TabOrder = 1
    object butBuscarCliente: TSpeedButton
      Left = 119
      Top = 33
      Width = 23
      Height = 33
      DisabledImageIndex = 0
      ImageIndex = 1
      Images = dmImagens.imgList16
      HotImageIndex = 2
      Flat = True
      OnClick = butBuscarClienteClick
    end
    object butNovoCliente: TSpeedButton
      Left = 138
      Top = 33
      Width = 23
      Height = 33
      DisabledImageIndex = 9
      ImageIndex = 10
      Images = dmImagens.imgList16
      HotImageIndex = 11
      Flat = True
      OnClick = butNovoClienteClick
    end
    object edtCliente: TLabeledEdit
      Left = 16
      Top = 34
      Width = 100
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      EditLabel.Width = 56
      EditLabel.Height = 23
      EditLabel.Caption = 'Cliente'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtClienteKeyDown
    end
    object edtNomeCliente: TLabeledEdit
      Left = 167
      Top = 34
      Width = 642
      Height = 33
      TabStop = False
      BorderStyle = bsNone
      Color = cl3DLight
      EditLabel.Width = 49
      EditLabel.Height = 23
      EditLabel.Caption = 'Nome'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 568
    Width = 994
    Height = 76
    Align = alBottom
    Color = clGrayText
    ParentBackground = False
    TabOrder = 4
    object butPedCancel: TBitBtn
      AlignWithMargins = True
      Left = 873
      Top = 17
      Width = 117
      Height = 42
      Margins.Top = 16
      Margins.Bottom = 16
      Align = alRight
      Caption = 'Cancelar'
      DisabledImageIndex = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 5
      ImageIndex = 4
      Images = dmImagens.imgList24
      ParentFont = False
      TabOrder = 0
      OnClick = butPedCancelClick
    end
    object butPedGravar: TBitBtn
      AlignWithMargins = True
      Left = 627
      Top = 17
      Width = 117
      Height = 42
      Margins.Top = 16
      Margins.Bottom = 16
      Align = alRight
      Caption = 'Gravar'
      DisabledImageIndex = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 8
      ImageIndex = 7
      Images = dmImagens.imgList24
      ParentFont = False
      TabOrder = 1
      OnClick = butPedGravarClick
    end
    object edtPedQtdItens: TLabeledEdit
      Left = 16
      Top = 32
      Width = 100
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      Color = cl3DLight
      EditLabel.Width = 42
      EditLabel.Height = 23
      EditLabel.Caption = 'Itens'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object edtPedTotal: TLabeledEdit
      Left = 144
      Top = 32
      Width = 169
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      Color = cl3DLight
      EditLabel.Width = 41
      EditLabel.Height = 23
      EditLabel.Caption = 'Total'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '0,00'
    end
    object butPedExcluir: TBitBtn
      AlignWithMargins = True
      Left = 750
      Top = 17
      Width = 117
      Height = 42
      Margins.Top = 16
      Margins.Bottom = 16
      Align = alRight
      Caption = 'Excluir'
      DisabledImageIndex = 9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 11
      ImageIndex = 10
      Images = dmImagens.imgList24
      ParentFont = False
      TabOrder = 4
      OnClick = butPedExcluirClick
    end
  end
  object dbgItens: TDBGrid
    Left = 0
    Top = 241
    Width = 994
    Height = 327
    Align = alClient
    DataSource = dsItens
    FixedColor = clWindow
    GradientEndColor = clBlack
    GradientStartColor = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit]
    ParentFont = False
    PopupMenu = ppmenuItens
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgItensDblClick
    OnKeyDown = dbgItensKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'item'
        Title.Caption = 'ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Caption = 'C'#211'DIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vrUnit'
        Title.Caption = 'VR. UNIT.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'QUANTIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vrTotal'
        Title.Caption = 'VR. TOTAL'
        Visible = True
      end>
  end
  object pnlPedido: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 81
    Align = alTop
    Color = clGrayText
    ParentBackground = False
    TabOrder = 0
    object butBuscarPedido: TSpeedButton
      Left = 119
      Top = 33
      Width = 23
      Height = 33
      DisabledImageIndex = 3
      ImageIndex = 4
      Images = dmImagens.imgList16
      HotImageIndex = 5
      Flat = True
      OnClick = butBuscarPedidoClick
    end
    object butNovoPedido: TSpeedButton
      Left = 138
      Top = 33
      Width = 23
      Height = 33
      DisabledImageIndex = 6
      ImageIndex = 7
      Images = dmImagens.imgList16
      HotImageIndex = 8
      Flat = True
      OnClick = butNovoPedidoClick
    end
    object edtPedido: TLabeledEdit
      Left = 16
      Top = 33
      Width = 100
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      EditLabel.Width = 56
      EditLabel.Height = 23
      EditLabel.Caption = 'Pedido'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtPedidoKeyDown
    end
    object edtDataPedido: TLabeledEdit
      Left = 167
      Top = 33
      Width = 186
      Height = 33
      TabStop = False
      BorderStyle = bsNone
      Color = cl3DLight
      EditLabel.Width = 39
      EditLabel.Height = 23
      EditLabel.Caption = 'Data'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlProduto: TPanel
    Left = 0
    Top = 161
    Width = 994
    Height = 80
    Align = alTop
    Color = clGrayText
    ParentBackground = False
    TabOrder = 2
    object butBuscarProduto: TSpeedButton
      Left = 119
      Top = 33
      Width = 23
      Height = 33
      DisabledImageIndex = 12
      ImageIndex = 13
      Images = dmImagens.imgList16
      HotImageIndex = 14
      Flat = True
      OnClick = butBuscarProdutoClick
    end
    object butNovoProduto: TSpeedButton
      Left = 138
      Top = 33
      Width = 23
      Height = 33
      DisabledImageIndex = 15
      ImageIndex = 16
      Images = dmImagens.imgList16
      HotImageIndex = 17
      Flat = True
      OnClick = butNovoProdutoClick
    end
    object edtProdCod: TLabeledEdit
      Left = 16
      Top = 32
      Width = 100
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      EditLabel.Width = 65
      EditLabel.Height = 23
      EditLabel.Caption = 'Produto'
      EditLabel.Color = clGrayText
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentColor = False
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edtProdCodKeyDown
    end
    object edtProdVrUnit: TLabeledEdit
      Left = 427
      Top = 32
      Width = 100
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      EditLabel.Width = 69
      EditLabel.Height = 23
      EditLabel.Caption = 'Vr. Unit.'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edtProdVrUnitExit
      OnKeyPress = edtProdVrUnitKeyPress
    end
    object edtProdQtd: TLabeledEdit
      Left = 533
      Top = 32
      Width = 100
      Height = 33
      Alignment = taRightJustify
      BorderStyle = bsNone
      EditLabel.Width = 30
      EditLabel.Height = 23
      EditLabel.Caption = 'Qtd'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edtProdVrUnitKeyPress
    end
    object edtProdTotal: TLabeledEdit
      Left = 639
      Top = 32
      Width = 100
      Height = 33
      TabStop = False
      Alignment = taRightJustify
      BorderStyle = bsNone
      Color = cl3DLight
      EditLabel.Width = 41
      EditLabel.Height = 23
      EditLabel.Caption = 'Total'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = '0,00'
    end
    object butProdAdd: TBitBtn
      AlignWithMargins = True
      Left = 745
      Top = 26
      Width = 115
      Height = 39
      Margins.Top = 16
      Margins.Bottom = 16
      Caption = 'Inserir'
      DisabledImageIndex = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 2
      ImageIndex = 1
      Images = dmImagens.imgList24
      ParentFont = False
      TabOrder = 5
      OnClick = butProdAddClick
    end
    object edtProdDesc: TLabeledEdit
      Left = 167
      Top = 32
      Width = 254
      Height = 33
      TabStop = False
      BorderStyle = bsNone
      Color = cl3DLight
      EditLabel.Width = 80
      EditLabel.Height = 23
      EditLabel.Caption = 'Descri'#231#227'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindow
      EditLabel.Font.Height = -19
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowFrame
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object butProdCancel: TBitBtn
      AlignWithMargins = True
      Left = 866
      Top = 26
      Width = 115
      Height = 39
      Margins.Top = 16
      Margins.Bottom = 16
      Cancel = True
      Caption = 'Cancel'
      DisabledImageIndex = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      HotImageIndex = 5
      ImageIndex = 4
      Images = dmImagens.imgList24
      ParentFont = False
      TabOrder = 6
      OnClick = butProdCancelClick
    end
  end
  object dsItens: TDataSource
    DataSet = memTblItens
    Left = 304
    Top = 464
  end
  object memTblItens: TFDMemTable
    AfterPost = memTblItensAfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 376
    Top = 464
    object memTblItensitem: TIntegerField
      FieldName = 'item'
    end
    object memTblItensid: TIntegerField
      FieldName = 'id'
    end
    object memTblItensid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object memTblItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object memTblItensvrUnit: TCurrencyField
      FieldName = 'vrUnit'
    end
    object memTblItensquantidade: TCurrencyField
      FieldName = 'quantidade'
    end
    object memTblItensvrTotal: TCurrencyField
      FieldName = 'vrTotal'
    end
  end
  object ppmenuItens: TPopupMenu
    Images = dmImagens.imgList24
    Left = 632
    Top = 368
    object butEditar: TMenuItem
      Caption = 'Editar'
      ImageIndex = 13
      ShortCut = 16397
      OnClick = butEditarClick
    end
    object butExcluir: TMenuItem
      Caption = 'Excluir'
      ImageIndex = 10
      ShortCut = 16430
      OnClick = butExcluirClick
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 544
    Top = 352
  end
  object MainMenu: TMainMenu
    Images = dmImagens.imgList16
    Left = 232
    Top = 352
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        ImageIndex = 10
        OnClick = Clientes1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        ImageIndex = 16
        OnClick = Produtos1Click
      end
    end
  end
end
