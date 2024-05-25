unit Principal.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Base.Form.View, FMX.Objects, FMX.Controls.Presentation, FMX.Menus;

type
  TFrPrincipalView = class(TFrBase)
    MenuBar1: TMenuBar;
    miCadastros: TMenuItem;
    MainMenu1: TMainMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    pmCadastros: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Timer1: TTimer;
    procedure miCadastrosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPrincipalView: TFrPrincipalView;

implementation

{$R *.fmx}
uses
  Data.Login.Controller, Data.Cliente.Controller;

procedure TFrPrincipalView.MenuItem5Click(Sender: TObject);
begin
  inherited;
  var ClienteController := TClienteController.Create;
  try
     ClienteController.GetTelaCliente(self);
  finally
     ClienteController.Free;
  end;
end;

procedure TFrPrincipalView.miCadastrosClick(Sender: TObject);
begin
  inherited;
    pmCadastros.Popup(miCadastros.Position.x+10, miCadastros.Position.y+100);
end;

procedure TFrPrincipalView.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  {$ifdef Release}
    TLoginController.GetTelaLogin(self);
  {$ENDIF}
end;

end.
