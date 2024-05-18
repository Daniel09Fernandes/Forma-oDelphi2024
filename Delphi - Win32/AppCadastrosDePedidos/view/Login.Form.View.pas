unit Login.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, System.ImageList,
  FMX.ImgList;

type
  TFrLogin = class(TForm)
    Main: TRectangle;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image1: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    ImageList1: TImageList;
    procedure CornerButton2Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
  private
    procedure RealizarLogin;
  public
    { Public declarations }
  end;

var
  FrLogin: TFrLogin;

implementation

{$R *.fmx}
uses Data.Login.Controller;

procedure TFrLogin.CornerButton1Click(Sender: TObject);
begin
  RealizarLogin;
end;

procedure TFrLogin.CornerButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrLogin.RealizarLogin;
begin
  if TLoginController.ValidarLogin(edtUsuario.Text, edtSenha.Text) then
    ShowMessage('Login realizado com sucesso')
  else
    ShowMessage('Usuario ou senha invalidos!');

end;

end.