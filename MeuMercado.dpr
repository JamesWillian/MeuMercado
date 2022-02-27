program MeuMercado;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitLogin in 'UnitLogin.pas' {frmLogin},
  UnitPrincipal in 'UnitPrincipal.pas' {frmPrincipal},
  UnitCatalogo in 'UnitCatalogo.pas' {frmCatalogo},
  Frame.ProdutoCatalogo in 'Frames\Frame.ProdutoCatalogo.pas' {FrameProdutoCatalogo: TFrame},
  Splash in 'Splash.pas' {Form1},
  UnitProduto in 'UnitProduto.pas' {frmProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCatalogo, frmCatalogo);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.Run;
end.
