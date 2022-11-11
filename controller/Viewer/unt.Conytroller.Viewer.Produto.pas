unit unt.Conytroller.Viewer.Produto;

interface

Uses
  System.Variants, System.Classes, unt.Model.DTO.Produtos,
  Vcl.Controls, Vcl.StdCtrls, unt.Model.DTO.Pedidos.Itens;

Type
  TProdutoViewer = class
  private
    FCod: TEdit;
    FDesc: TEdit;
    FVrUnit: TEdit;
    FQtd: TEdit;
    FVrTotal: TEdit;
    Fitem: Integer;
    FcodItem: integer;
    function GetCod: Integer;
    procedure SetCod(const Value: Integer);
    function Getdescricao: String;
    procedure Setdescricao(const Value: String);
    function GetvrUnit: Currency;
    procedure SetvrUnit(const Value: Currency);
    function Getqtd: Currency;
    procedure Setqtd(const Value: Currency);
    procedure AtualizaTotal;
    function GetvrTotal: Currency;
    procedure SetvrTotal(const Value: Currency);
    procedure OnVrChange(Sender: TObject);
    procedure OnQtdChange(Sender: Tobject);
    { private declarations }
  public
    { public declarations }
    constructor Create(const pEditCod, pEditDesc, pEditVrUnit, pEditQtd, pEditVrTotal: TCustomEdit);
    procedure Clear;
    procedure ReadProdDTO(pProdDTO: TProdutoDTO);
    function AsPedidosItensDTO: TPedidosItensDTO;
    property Cod: Integer read GetCod write SetCod;
    property descricao: String read Getdescricao write Setdescricao;
    property vrUnit: Currency read GetvrUnit write SetvrUnit;
    property qtd: Currency read Getqtd write Setqtd;
    property vrTotal: Currency read GetvrTotal write SetvrTotal;
    property item: Integer read Fitem write Fitem;
    property codItem: integer read FcodItem write FcodItem;
  end;

implementation

uses
  System.SysUtils;

{ TProdutoViewer }

function TProdutoViewer.AsPedidosItensDTO: TPedidosItensDTO;
begin
  Result.id := codItem;
  Result.item := item;
  Result.produto.id := cod;
  Result.produto.descricao := descricao;
  Result.quantidade := qtd;
  Result.vrUnit := vrUnit;
end;

procedure TProdutoViewer.AtualizaTotal;
begin
  vrTotal := vrUnit * qtd;
end;

procedure TProdutoViewer.Clear;
begin
  FCod.Clear;
  FDesc.Clear;
  FVrUnit.Clear;
  FQtd.Clear;
  FVrTotal.Clear;
  item := 0;
  FcodItem := 0;
end;

constructor TProdutoViewer.Create(const pEditCod, pEditDesc, pEditVrUnit, pEditQtd, pEditVrTotal: TCustomEdit);
begin
  FCod     := TEdit(pEditCod);
  FDesc    := TEdit(pEditDesc);
  FVrUnit  := TEdit(pEditVrUnit);
  FQtd     := TEdit(pEditQtd);
  FVrTotal := TEdit(pEditVrTotal);

  FVrUnit.OnChange := OnVrChange;
  FQtd.OnChange := OnQtdChange;
end;

function TProdutoViewer.GetCod: Integer;
begin
  Result := StrToIntDef(FCod.Text,0);
end;

function TProdutoViewer.Getdescricao: String;
begin
  Result := FDesc.Text;
end;

function TProdutoViewer.Getqtd: Currency;
begin
  Result := StrToCurrDef(FQtd.Text,0);
end;

function TProdutoViewer.GetvrTotal: Currency;
begin
  Result := StrToCurrDef(FVrTotal.Text,0);
end;

function TProdutoViewer.GetvrUnit: Currency;
begin
  Result := StrToCurrDef(FVrUnit.Text,0);
end;

procedure TProdutoViewer.OnQtdChange(Sender: Tobject);
begin
  AtualizaTotal;
end;

procedure TProdutoViewer.OnVrChange(Sender: TObject);
begin
  AtualizaTotal;
end;

procedure TProdutoViewer.ReadProdDTO(pProdDTO: TProdutoDTO);
begin
  Clear;
  if pProdDTO.id = 0 then
    raise Exception.Create('Produto não encontrado.');
  cod := pProdDTO.id;
  descricao := pProdDTO.descricao;
  vrUnit := pProdDTO.valor;
  qtd := 1;
end;

procedure TProdutoViewer.SetCod(const Value: Integer);
begin
  FCod.Text := Value.ToString;
end;

procedure TProdutoViewer.Setdescricao(const Value: String);
begin
  FDesc.Text := Value;
end;

procedure TProdutoViewer.Setqtd(const Value: Currency);
begin
  FQtd.Text := FormatCurr('0.00',Value);
  AtualizaTotal;
end;

procedure TProdutoViewer.SetvrTotal(const Value: Currency);
begin
  FVrTotal.Text := FormatCurr('0.00',Value);
end;

procedure TProdutoViewer.SetvrUnit(const Value: Currency);
begin
  FVrUnit.Text := FormatCurr('0.00',Value);
  AtualizaTotal;
end;

end.
