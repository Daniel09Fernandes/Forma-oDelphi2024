library IIS;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Data.DBXCommon,
  Datasnap.DSSession,
  Classe.Produto in '..\Server\Classe.Produto.pas',
  Server.Methods.Files in '..\Server\Server.Methods.Files.pas' {SMFiles: TDSServerModule},
  Server.Methods.Geral in '..\Server\Server.Methods.Geral.pas' {SMGeral: TDSServerModule},
  Server.Methods.Produto in '..\Server\Server.Methods.Produto.pas' {SMProduto: TDSServerModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TISAPIApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
