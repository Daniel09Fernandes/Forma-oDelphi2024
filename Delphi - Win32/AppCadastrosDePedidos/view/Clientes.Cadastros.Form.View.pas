unit Clientes.Cadastros.Form.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Base.Cadastro.Form.View, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid,
  FMX.TabControl, FMX.Objects, FMX.Controls.Presentation, system.Generics.Collections,
  Data.Cliente.Entity, Data.Cliente.Controller, FMX.DateTimeCtrls, FMX.Edit;

type
  TFrCadastroClientes = class(TFrBaseCadastros)
    clIdCliente: TIntegerColumn;
    clNomeCliente: TStringColumn;
    clEndereco: TStringColumn;
    ClDtaCadastro: TStringColumn;
    EdtId: TEdit;
    EdtName: TEdit;
    edtEndereco: TEdit;
    DEdtCadastro: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblcad: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnInsertClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure SgDadosCellDblClick(const Column: TColumn; const Row: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    ListaCliente : TList<TClienteEntity>;
    FControllerCliente : TClienteController;
    FProcuraCliente : TClienteEntity;
    FIndexReg : Integer;
    Procedure IniciarGrid;
    procedure AtualizaRowCount(AValor: Integer);
    procedure ControleVisualCadastro(AValue: Boolean);
    procedure EditarRegistro;
    procedure PopulaGrid;
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrBaseCadastros1 }

procedure TFrCadastroClientes.BtnCancelClick(Sender: TObject);
begin
  inherited;
  ControleVisualCadastro(false);
end;

procedure TFrCadastroClientes.BtnEditClick(Sender: TObject);
begin
  inherited;
  EditarRegistro;
end;

procedure TFrCadastroClientes.BtnInsertClick(Sender: TObject);
begin
  inherited;
  ControleVisualCadastro(true);
end;

procedure TFrCadastroClientes.BtnSaveClick(Sender: TObject);
begin
  inherited;

  if FIndexReg > -1 then
  begin
     ListaCliente.Items[FIndexReg].IdCliente      := EdtId.Text.ToInteger;
     ListaCliente.Items[FIndexReg].NomeCliente    := EdtName.Text;
     ListaCliente.Items[FIndexReg].Endereco       := edtEndereco.Text;
     ListaCliente.Items[FIndexReg].DataCadastro   := DEdtCadastro.Date;
  end
  else
  begin
    var Cliente := TClienteEntity.Create;

    Cliente.IdCliente    := EdtId.Text.ToInteger;
    Cliente.NomeCliente  := EdtName.Text;
    Cliente.Endereco     := edtEndereco.Text;
    Cliente.DataCadastro := DEdtCadastro.Date;

    ListaCliente.Add (Cliente);
  end;
  FIndexReg := -1;

  ControleVisualCadastro(false);
  PopulaGrid;
end;

procedure TFrCadastroClientes.ControleVisualCadastro(AValue: Boolean);
begin
    for var I := 0 to ComponentCount-1 do
  begin
    if Components[i] is TEdit then
    begin
      TEdit(Components[i]).Enabled := AValue;
      if  FLimparComponenete then
        TEdit(Components[i]).Text := '';
    end;

   if Components[i] is TDateEdit then
   begin
    TDateEdit(Components[i]).Enabled := AValue;

    if  FLimparComponenete then
        TDateEdit(Components[i]).Date := now;
   end;
  end;
end;

procedure TFrCadastroClientes.EditarRegistro;
procedure procurarRegistro;
begin
  for var I := 0 to ListaCliente.Count -1 do
  begin
    FIndexReg := -1;
    if ListaCliente.Items[i].IdCliente = SgDados.Cells[clIdCliente.Index, SgDados.Row].ToInteger() then
    begin
      FIndexReg := I;
      break;
    end;
  end;
end;

begin
  ControleVisualCadastro(true);
  procurarRegistro;

  EdtId.Text        := SgDados.Cells[clIdCliente.Index, SgDados.Row];
  EdtName.Text      := SgDados.Cells[clNomeCliente.Index, SgDados.Row];
  edtEndereco.Text  := SgDados.Cells[clEndereco.Index, SgDados.Row];
  DEdtCadastro.Date := StrToDate(SgDados.Cells[ClDtaCadastro.Index, SgDados.Row]);
end;


procedure TFrCadastroClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FControllerCliente) then
    FreeAndNil(FControllerCliente);

  FreeAndNil(FProcuraCliente);
end;

procedure TFrCadastroClientes.FormShow(Sender: TObject);
begin
  inherited;
   FIndexReg := -1;
  lblTitulo.Text := 'Cadastro de Clientes';
  IniciarGrid;
end;

procedure TFrCadastroClientes.IniciarGrid;
begin
  FControllerCliente := TClienteController.Create;
  FProcuraCliente    := TClienteEntity.Create;
  ListaCliente       :=  FControllerCliente.BuscarCliente;
  AtualizaRowCount(ListaCliente.Count);
  PopulaGrid;
end;

procedure TFrCadastroClientes.PopulaGrid;
procedure LimparGrid;
begin
 for var I := 0 to pred(SgDados.RowCount) do
 begin
    SgDados.Cells[clIdCliente.Index,i]   := '';
    SgDados.Cells[clNomeCliente.Index,i] := '';
    SgDados.Cells[clEndereco.Index,i]    := '';
    SgDados.Cells[ClDtaCadastro.Index,i] := '';
 end;
end;
begin
  AtualizaRowCount(ListaCliente.Count);
  LimparGrid;
  for var I := 0 to pred(ListaCliente.Count) do
   begin
      SgDados.Cells[clIdCliente.Index,i]   :=  ListaCliente[i].IdCliente.ToString;
      SgDados.Cells[clNomeCliente.Index,i] :=  ListaCliente[i].NomeCliente;
      SgDados.Cells[clEndereco.Index,i]    :=  ListaCliente[i].Endereco;
      SgDados.Cells[ClDtaCadastro.Index,i] :=  FormatDateTime('dd/MM/yyyy', ListaCliente[i].DataCadastro);
   end;
end;


procedure TFrCadastroClientes.SgDadosCellDblClick(const Column: TColumn; const Row: Integer);
begin
  inherited;
  EditarRegistro;
end;

procedure TFrCadastroClientes.AtualizaRowCount(AValor:Integer);
begin
  SgDados.RowCount := AValor;
end;

end.
