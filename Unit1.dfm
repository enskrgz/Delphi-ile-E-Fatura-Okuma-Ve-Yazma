object Form1: TForm1
  Left = 331
  Top = 159
  Width = 889
  Height = 735
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 424
    Top = 592
    Width = 65
    Height = 13
    Caption = 'TOPLAMLAR'
  end
  object Label2: TLabel
    Left = 424
    Top = 640
    Width = 22
    Height = 13
    Caption = 'KDV'
  end
  object Label3: TLabel
    Left = 416
    Top = 664
    Width = 70
    Height = 13
    Caption = 'GEN TOPLAM'
  end
  object Label4: TLabel
    Left = 403
    Top = 252
    Width = 42
    Height = 13
    Caption = 'FAT. NO'
  end
  object Label5: TLabel
    Left = 384
    Top = 283
    Width = 62
    Height = 13
    Caption = 'FAT. TAR'#304'H'#304
  end
  object Label6: TLabel
    Left = 387
    Top = 308
    Width = 57
    Height = 13
    Caption = 'FAT. SAAT'#304
  end
  object Label7: TLabel
    Left = 18
    Top = 162
    Width = 39
    Height = 13
    Caption = 'Cari Ad'#305':'
  end
  object Label8: TLabel
    Left = 18
    Top = 186
    Width = 39
    Height = 13
    Caption = 'Cari Ad'#305':'
  end
  object Label9: TLabel
    Left = 18
    Top = 210
    Width = 30
    Height = 13
    Caption = 'Adres:'
  end
  object Label10: TLabel
    Left = 424
    Top = 616
    Width = 48
    Height = 13
    Caption = #304'SKONTO'
  end
  object Label14: TLabel
    Left = 380
    Top = 220
    Width = 66
    Height = 13
    Caption = 'FATURA T'#304'P'#304
  end
  object Label15: TLabel
    Left = 31
    Top = 580
    Width = 68
    Height = 13
    Caption = 'UUID(ETTN) :'
  end
  object Label17: TLabel
    Left = 364
    Top = 196
    Width = 75
    Height = 13
    Caption = 'SENARYO T'#304'P'#304
  end
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 201
    Height = 25
    Caption = 'G'#214'STER VE KUTULARI DOLDUR'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 48
    Width = 593
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 488
    Top = 16
    Width = 75
    Height = 25
    Caption = 'VT'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 448
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 448
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 496
    Top = 584
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit6: TEdit
    Left = 496
    Top = 656
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edit8: TEdit
    Left = 496
    Top = 632
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Button3: TButton
    Left = 272
    Top = 16
    Width = 169
    Height = 25
    Caption = 'YEN'#304' DE'#286'ERLER'#304' DOLDUR'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 448
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object Edit3: TEdit
    Left = 72
    Top = 158
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object Edit7: TEdit
    Left = 72
    Top = 182
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object Edit9: TEdit
    Left = 72
    Top = 206
    Width = 121
    Height = 21
    TabOrder = 12
  end
  object Edit10: TEdit
    Left = 72
    Top = 232
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object Edit11: TEdit
    Left = 72
    Top = 256
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object Edit12: TEdit
    Left = 72
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 15
  end
  object Edit13: TEdit
    Left = 72
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 16
  end
  object Edit14: TEdit
    Left = 72
    Top = 328
    Width = 121
    Height = 21
    TabOrder = 17
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 360
    Width = 769
    Height = 201
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
    TabOrder = 18
    ColWidths = (
      64
      64
      64
      64
      64)
  end
  object Edit15: TEdit
    Left = 496
    Top = 608
    Width = 121
    Height = 21
    TabOrder = 19
  end
  object Panel1: TPanel
    Left = 616
    Top = 24
    Width = 249
    Height = 297
    Caption = 'Panel1'
    TabOrder = 20
    object Label11: TLabel
      Left = 34
      Top = 34
      Width = 46
      Height = 13
      Caption = 'Firma Ad'#305':'
    end
    object Label12: TLabel
      Left = 42
      Top = 58
      Width = 30
      Height = 13
      Caption = 'Adres:'
    end
    object Label13: TLabel
      Left = 67
      Top = 138
      Width = 18
      Height = 13
      Caption = 'Tel:'
    end
    object Label16: TLabel
      Left = 40
      Top = 8
      Width = 136
      Height = 13
      Caption = '                        Sat'#305'c'#305' Bilgileri:'
      Layout = tlCenter
    end
    object Label18: TLabel
      Left = 68
      Top = 164
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    object Label19: TLabel
      Left = 44
      Top = 188
      Width = 42
      Height = 13
      Caption = 'Web site'
    end
    object Label20: TLabel
      Left = 60
      Top = 212
      Width = 25
      Height = 13
      Caption = 'eMail'
    end
    object Label21: TLabel
      Left = 44
      Top = 236
      Width = 45
      Height = 13
      Caption = 'V.Dairesi:'
    end
    object Label22: TLabel
      Left = 60
      Top = 260
      Width = 27
      Height = 13
      Caption = 'V.No:'
    end
    object Edit16: TEdit
      Left = 88
      Top = 30
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit17: TEdit
      Left = 88
      Top = 54
      Width = 137
      Height = 51
      TabOrder = 1
    end
    object Edit18: TEdit
      Left = 96
      Top = 134
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Edit19: TEdit
      Left = 96
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object Edit20: TEdit
      Left = 96
      Top = 184
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object Edit21: TEdit
      Left = 96
      Top = 208
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object Edit22: TEdit
      Left = 96
      Top = 232
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object Edit23: TEdit
      Left = 96
      Top = 256
      Width = 121
      Height = 21
      TabOrder = 7
    end
  end
  object Edit24: TEdit
    Left = 448
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 21
  end
  object Edit25: TEdit
    Left = 24
    Top = 600
    Width = 361
    Height = 21
    TabOrder = 22
    Text = 'UUID DE'#286'ER'#304' BURAYA GELECEK'
  end
  object Edit26: TEdit
    Left = 448
    Top = 192
    Width = 121
    Height = 21
    TabOrder = 23
  end
end
