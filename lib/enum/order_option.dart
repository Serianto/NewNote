enum OrderOption {
  dateModified,
  dateCreated;

  String get name{
    return switch (this){
      OrderOption.dateModified => 'Tanggal diperbaharui',
      OrderOption.dateCreated => 'Tanggal dibuat'
    };
  }
}