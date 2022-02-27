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
    lboxCategorias: TListBox;
    ListBoxItem1: TListBoxItem;
    Rectangle2: TRectangle;
    Label5: TLabel;
    ListBoxItem2: TListBoxItem;
    Rectangle3: TRectangle;
    Label6: TLabel;
    lboxProdutos: TListBox;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lboxCategoriasItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { Private declarations }
    procedure AddProduto(idProduto: Integer;
                         descricao, unidade: String;
                         valor: Double );
    procedure ListarProdutos;
    procedure ListarCategorias;
    procedure AddCategoria(idCategoria: Integer; descricao: String);
    procedure SelecionarCategoria(item: TListBoxItem);
  public
    { Public declarations }
  end;

var
  frmCatalogo: TfrmCatalogo;

implementation

{$R *.fmx}

uses UnitPrincipal, Frame.ProdutoCatalogo;

{ TfrmCatalogo }

procedure TfrmCatalogo.AddCategoria(idCategoria: Integer; descricao: String);
var
  item: TListBoxItem;
  rect: TRectangle;
  text: TLabel;
begin
  //ADICIONA UMA NOVA CATEGORIA EM TEMPO DE EXECUÇÃO

  //ITEM DA LISTBOX
  item := TListBoxItem.Create(lboxCategorias);
  with item do begin
    Selectable := False;
    Text := '';
    Width := 100;
    Tag := idCategoria;
  end;

  //RETANGULO DA LISTBOX
  rect := TRectangle.Create(item);
  with rect do begin
    cursor := crHandPoint;
    HitTest := False;
    Fill.Color := $FFE2E2E2;
    Align := TAlignLayout.Client;
    Margins.Top := 5;
    Margins.Right := 5;
    Margins.Bottom := 5;
    Margins.Left := 5;
    XRadius := 9;
    YRadius := 9;
    Stroke.Kind := TBrushKind.None;
  end;

  //LABEL DA LSITBOX
  text := TLabel.Create(rect);
  with text do begin
    Align := TAlignLayout.Center;
    Text := descricao;
    TextSettings.HorzAlign := TTextAlign.Center;
    TextSettings.VertAlign := TTextAlign.Center;
    StyledSettings := StyledSettings - [TStyledSetting.Size,
                                        TStyledSetting.FontColor,
                                        TStyledSetting.Style,
                                        TStyledSetting.Other];
    Font.Size := 13;
    FontColor := $FF3A3A3A;
  end;

  rect.AddObject(text);
  item.AddObject(rect);
  lboxCategorias.AddObject(item);
end;

procedure TfrmCatalogo.AddProduto(idProduto: Integer; descricao,
  unidade: String; valor: Double);
var
  boxItem: TListBoxItem;
  frame: TFrameProdutoCatalogo;
begin
  //ADICONA UM NOVO PRODUTO EM TEMPO DE EXECUÇÃO UTILIZANDO O FRAME

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
  ListarCategorias;
end;

procedure TfrmCatalogo.Image1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCatalogo.lboxCategoriasItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  SelecionarCategoria(Item);
end;

procedure TfrmCatalogo.ListarCategorias;
begin

  lboxCategorias.Items.Clear;

  AddCategoria(0,'Frios');
  AddCategoria(1,'Açougue');
  AddCategoria(2,'Bebidas');
  AddCategoria(3,'Limpeza');
  AddCategoria(4,'Higiene');

  ListarProdutos;

end;

procedure TfrmCatalogo.ListarProdutos;
begin
  AddProduto(1,'Cafézim Pilão Fraco','500g',5.00);
  AddProduto(1,'Cafézim Pilão Normal','500g',5.50);
  AddProduto(1,'Cafézim Pilão Forte','500g',5.80);
  AddProduto(1,'Cafézim Pilão Extra Forte','500g',6.00);
  AddProduto(1,'Cafézim Pilão para Programador','500g',8.00);
end;

procedure TfrmCatalogo.SelecionarCategoria(item: TListBoxItem);
begin
  //DESMARCA TODOS OS ITENS DA LISTBOX
  for var I := 0 to lboxCategorias.items.Count -1 do begin
    TRectangle(lboxCategorias.ItemByIndex(I).Components[0]).Fill.Color := $FFE2E2E2;
    TLabel(TRectangle(lboxCategorias.ItemByIndex(I).Components[0]).Components[0]).FontColor := $ff3A3A3A;
  end;

  //MARCAR O ITEM SELECIONADO
  TRectangle(item.Components[0]).Fill.Color := $FF64BA01;
  TLabel(TRectangle(item.Components[0]).Components[0]).FontColor := $FFFFFFFF;

  lboxCategorias.Tag := item.Tag;
end;

end.
