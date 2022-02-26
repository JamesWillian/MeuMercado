unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Ani,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    StyleBook: TStyleBook;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Edit1: TEdit;
    Image3: TImage;
    Button1: TButton;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    rectFormaEntrega: TRectangle;
    ColorAnimation1: TColorAnimation;
    FloatAnimation1: TFloatAnimation;
    lvMercados: TListView;
    imgShop: TImage;
    imgTaxaEntrega: TImage;
    imgVlrMin: TImage;
    procedure FormShow(Sender: TObject);
    procedure lvMercadosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
    procedure AddMercadoLv(id_mercado: Integer;
                           nome, endereco: String;
                           tx_entrega, vlr_min: Double);
    procedure ListarMercados;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UnitCatalogo;

{$R *.fmx}

{ TfrmPrincipal }

procedure TfrmPrincipal.AddMercadoLv(id_mercado: Integer;
                                     nome, endereco: String;
                                     tx_entrega, vlr_min: Double);
var
  img: TListItemImage;
  txt: TListItemText;
begin

  with lvMercados.items.Add do begin
    Height := 130;
    Tag := id_mercado;

    img := TListItemImage(Objects.FindDrawable('imgShop'));
    img.Bitmap := imgShop.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgTaxaEntrega'));
    img.Bitmap := imgTaxaEntrega.Bitmap;

    img := TListItemImage(Objects.FindDrawable('imgVlrMin'));
    img.Bitmap := imgVlrMin.Bitmap;

    txt := TListItemText(Objects.FindDrawable('txtShop'));
    txt.Text := nome;

    txt := TListItemText(Objects.FindDrawable('txtEndereco'));
    txt.Text := endereco;

    txt := TListItemText(Objects.FindDrawable('txtTaxaEntrega'));
    txt.Text := 'Taxa de entrega: '+FormatFloat('R$ #,##0.00',tx_entrega);

    txt := TListItemText(Objects.FindDrawable('txtVlrMin'));
    txt.Text := 'Compra mínima: '+FormatFloat('R$ #,##0.00',vlr_min);

  end;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ListarMercados;
end;

procedure TfrmPrincipal.ListarMercados;
begin
  AddMercadoLv(1,'Mercadinho da Esquina','Rua Cheia de Buraco, 999',5.00,25.00);
  AddMercadoLv(1,'Mercadinho da Esquina','Rua Cheia de Buraco, 999',5.00,25.00);
  AddMercadoLv(1,'Mercadinho da Esquina','Rua Cheia de Buraco, 999',5.00,25.00);
  AddMercadoLv(1,'Mercadinho da Esquina','Rua Cheia de Buraco, 999',5.00,25.00);
  AddMercadoLv(1,'Mercadinho da Esquina','Rua Cheia de Buraco, 999',5.00,25.00);
end;

procedure TfrmPrincipal.lvMercadosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not Assigned(frmCatalogo) then
    Application.CreateForm(TfrmCatalogo, frmCatalogo);

  frmCatalogo.Show;

end;

end.
