unit Frame.ProdutoCatalogo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TFrameProdutoCatalogo = class(TFrame)
    imgProduto: TImage;
    lbNomeProduto: TLabel;
    lbValor: TLabel;
    lbUnidade: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
