unit UnitCatalogo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.ListBox;

type
  TfrmCatalogo = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Edit1: TEdit;
    Image3: TImage;
    Button1: TButton;
    Layout3: TLayout;
    Label3: TLabel;
    Image4: TImage;
    Image5: TImage;
    Label2: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    Rectangle2: TRectangle;
    Label5: TLabel;
    ListBoxItem2: TListBoxItem;
    Rectangle3: TRectangle;
    Label6: TLabel;
    lboxProdutos: TListBox;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AddProduto(idProduto: Integer;
                         descricao, unidade: String;
                         valor: Double );
    procedure ListarProdutos;
  public
    { Public declarations }
  end;

var
  frmCatalogo: TfrmCatalogo;

implementation

{$R *.fmx}

uses UnitPrincipal, Frame.ProdutoCatalogo;

{ TfrmCatalogo }

procedure TfrmCatalogo.AddProduto(idProduto: Integer; descricao,
  unidade: String; valor: Double);
var
  boxItem: TListBoxItem;
  frame: TFrameProdutoCatalogo;
begin
  boxItem := TListBoxItem.Create(lboxProdutos);
  with boxItem do begin
    Selectable := False;
    Text := '';
    Height := 200;
    Tag := idProduto;
  end;

  frame := TFrameProdutoCatalogo.Create(boxItem);
  with frame do begin
    lbNomeProduto.Text := descricao;
    lbValor.Text := FormatFloat('R$ #,##0.00', valor);
    lbUnidade.Text := unidade;
  end;

  boxItem.AddObject(frame);
  lboxProdutos.AddObject(boxItem);

end;

procedure TfrmCatalogo.FormShow(Sender: TObject);
begin
  ListarProdutos;
end;

procedure TfrmCatalogo.Image1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCatalogo.ListarProdutos;
begin
  AddProduto(1,'Cafézim Pilão Fraco','500g',5.00);
  AddProduto(1,'Cafézim Pilão Normal','500g',5.50);
  AddProduto(1,'Cafézim Pilão Forte','500g',5.80);
  AddProduto(1,'Cafézim Pilão Extra Forte','500g',6.00);
  AddProduto(1,'Cafézim Pilão para Programador','500g',8.00);
end;

end.
