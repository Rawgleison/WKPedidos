program WKPedidos;

uses
  Vcl.Forms,
  unt.View.Pedido in 'view\unt.View.Pedido.pas' {frmPedido},
  unt.Model.DAO.IniFile in 'model\DAO\unt.Model.DAO.IniFile.pas',
  unt.Model.Config.MySql in 'model\unt.Model.Config.MySql.pas',
  unt.Model.Provider.Cliente in 'model\provider\unt.Model.Provider.Cliente.pas',
  unt.Controller.Cliente in 'controller\unt.Controller.Cliente.pas',
  unt.Model.DTO.Cliente in 'model\DTO\unt.Model.DTO.Cliente.pas',
  unt.Model.Provider.Produtos in 'model\provider\unt.Model.Provider.Produtos.pas',
  unt.Model.Provider.Pedidos.Itens in 'model\provider\unt.Model.Provider.Pedidos.Itens.pas',
  unt.Model.Provider.Pedidos in 'model\provider\unt.Model.Provider.Pedidos.pas',
  unt.Model.DTO.Produtos in 'model\DTO\unt.Model.DTO.Produtos.pas',
  unt.Model.DTO.Pedidos in 'model\DTO\unt.Model.DTO.Pedidos.pas',
  unt.Model.DTO.Pedidos.Itens in 'model\DTO\unt.Model.DTO.Pedidos.Itens.pas',
  unt.Controller.Produto in 'controller\unt.Controller.Produto.pas',
  unt.controller.pedido in 'controller\unt.controller.pedido.pas',
  unt.Model.DAO.MySql in 'model\DAO\unt.Model.DAO.MySql.pas' {dmConnection: TDataModule},
  unt.View.Find.Generic in 'view\find\unt.View.Find.Generic.pas' {frmFindGeneric},
  unt.Controller.Interfaces in 'controller\unt.Controller.Interfaces.pas',
  unt.Conytroller.Viewer.Produto in 'controller\Viewer\unt.Conytroller.Viewer.Produto.pas',
  unt.Helpers.Messages in 'controller\helpers\unt.Helpers.Messages.pas',
  unt.View.Produto in 'view\unt.View.Produto.pas' {frmCadastroProduto},
  unt.Model.Imagens in 'model\unt.Model.Imagens.pas' {dmImagens: TDataModule},
  unt.View.Clientes in 'view\unt.View.Clientes.pas' {frmCadastroCliente},
  unt.Model.Provider.Interfaces in 'model\provider\unt.Model.Provider.Interfaces.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPedido, frmPedido);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfrmFindGeneric, frmFindGeneric);
  Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
  Application.CreateForm(TdmImagens, dmImagens);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.Run;
end.
