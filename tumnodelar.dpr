program tumnodelar;

uses
  Forms,
  Unit1 in '..\ekobim fatura gonder04.12.18\Unit1.pas' {Form1},
  Unit2 in '..\ekobim fatura gonder04.12.18\Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
