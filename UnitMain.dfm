object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 75
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 87
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1072#1088#1090#1091':'
  end
  object Label2: TLabel
    Left = 8
    Top = 30
    Width = 300
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1074#1086#1079#1084#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '#1087#1088#1080' '#1086#1082#1086#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077' WoT'
  end
  object ComboBox1: TComboBox
    Left = 101
    Top = 8
    Width = 207
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = #1050#1072#1088#1077#1083#1080#1103
    OnChange = ComboBox1Change
    Items.Strings = (
      #1050#1072#1088#1077#1083#1080#1103
      #1052#1072#1083#1080#1085#1086#1074#1082#1072
      #1061#1080#1084#1084#1077#1083#1100#1089#1076#1086#1088#1092
      #1055#1088#1086#1093#1086#1088#1086#1074#1082#1072
      #1069#1085#1089#1082
      #1051#1072#1089#1074#1080#1083#1083#1100
      #1055#1072#1075#1086#1088#1082#1080
      #1052#1091#1088#1086#1074#1072#1085#1082#1072
      #1069#1083#1077#1085#1073#1077#1088#1075
      #1050#1086#1084#1072#1088#1080#1085
      #1059#1090#1077#1089
      #1052#1086#1085#1072#1089#1090#1099#1088#1100
      #1055#1077#1089#1095#1072#1085#1072#1103' '#1088#1077#1082#1072)
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 54
    Width = 514
    Height = 21
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object LabelCopy: TLabel
      Left = 6
      Top = 4
      Width = 136
      Height = 13
      Caption = 'Copyright (c) 2010 by MyIE,'
    end
    object LabelVer: TLabel
      Left = 148
      Top = 4
      Width = 46
      Height = 13
      Caption = 'v1.0.0.0,'
    end
    object LabelCopyLink: TLabel
      Left = 200
      Top = 4
      Width = 50
      Height = 13
      Cursor = crHandPoint
      Caption = 'WOTTV.ru'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = LabelCopyLinkClick
    end
    object LabelIssetNewVirsion: TLabel
      Left = 332
      Top = 4
      Width = 171
      Height = 13
      Cursor = crHandPoint
      Caption = #1053#1072' '#1089#1072#1081#1090#1077' '#1076#1086#1089#1090#1091#1087#1085#1072' '#1085#1086#1074#1072#1103' '#1074#1077#1088#1089#1080#1103'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      Visible = False
      OnClick = LabelIssetNewVirsionClick
    end
  end
  object TimerUpdate: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerUpdateTimer
    Left = 480
  end
end
