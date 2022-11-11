unit unt.Model.Imagens;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TdmImagens = class(TDataModule)
    imgList24: TImageList;
    imgList16: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmImagens: TdmImagens;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
