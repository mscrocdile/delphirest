object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 258
  Width = 371
  object FDMemTable1: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 184
    Top = 80
    object FDMemTable1firstfield: TIntegerField
      DisplayLabel = 'MyFirstField'
      DisplayWidth = 20
      FieldName = 'firstfield'
      ReadOnly = True
      Visible = False
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 80
    Top = 128
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 232
    Top = 160
  end
end
