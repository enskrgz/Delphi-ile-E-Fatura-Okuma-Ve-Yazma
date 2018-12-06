unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,xmldom,XMLIntf,XMLDoc, Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button3: TButton;
    Edit2: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
 public
    id,name,kdv,tutar:integer;
    csdname:integer;
    cname:integer;
   { Public declarations }
procedure NOdeOku(A:IXMLNode);
procedure NOdeOkuKaydet(A:IXMLNode);
 end;

var
 Form1: TForm1;
Girinti : Integer;
implementation

uses Unit2;
 
{$R *.dfm}
 
Function BoslukAt(Deger:Integer):String;
var
x:Integer;
Begin
Result := '';
for x:=1 to Deger Do Result := Result + ' ';
End;


///////////////////////////////////   listele baþlangýç
procedure TForm1.NOdeOku(A:IXMLNode);
VAR
ANode : IXMLNode;
Begin
Girinti := Girinti + 3;
 ANode:=A.ChildNodes.First;
repeat
    if Assigned(ANode) then begin
 if (ANode.IsTextElement=true)
     Then Begin
        Memo1.Lines.Add(BoslukAt(Girinti)+': '+ANode.LocalName+' -> '+ANode.Text);

              if (ANode.LocalName='Name') then begin   // elektrik tüketim bedeli
            //ShowMessage(IntToStr(name)+ANode.Text);
            inc(name); if name=6 then
          StringGrid1.Cells[1,1]:=ANode.Text;
            end;



           if (ANode.LocalName='FirstName') then    //cari adý
           Edit3.Text:=ANode.Text;
            // memoda istenilen satýra ekleme
           if (ANode.LocalName='FamilyName') then
           Edit7.Text:= ANode.Text;
             if (ANode.LocalName='ID') then begin //ID ler çok olduðu için saydýrarak buluyorum
          inc(id); if id=6 then // postal adress teki id için  mahalle
          Edit9.Text:= ANode.Text;
            end;
            if (ANode.LocalName='StreetName') then
           Edit10.Text:= ANode.Text; //sokak no
            if (ANode.LocalName='BuildingNumber') then
          Edit11.Text:= 'No: '+ANode.Text;
           if (ANode.LocalName='Room') then
           Edit12.Text:='Daire: '+ ANode.Text;
            if (ANode.LocalName='CitySubdivisionName')then begin
            inc(csdname); if csdname=2 then
            Edit13.Text:=ANode.Text;
             end;
             if (ANode.LocalName='CityName') then begin
             inc(cname); if cname=2 then
             Edit14.Text:=ANode.Text;
             end;


              if (ANode.LocalName='TaxAmount') then
           Edit8.Text:= ANode.Text;                 //toplam kdv
              if (ANode.LocalName='BaseAmount') then
           Edit5.Text:= ANode.Text;    //toplam fiyat
              if (ANode.LocalName='PayableAmount') then
           Edit6.Text:= ANode.Text;  //genel toplam


                if (ANode.LocalName='InvoicedQuantity') then
                StringGrid1.Cells[2,1]:=ANode.Text+' KWH';
          // Memo2.Lines.Add('Ürün Detayý '+ANode.Text+' KWH');



                if (ANode.LocalName='PriceAmount') then
           StringGrid1.Cells[3,1]:=ANode.Text;


                if (ANode.LocalName='TaxAmount') then begin
                inc(kdv);  if kdv=4 then
           StringGrid1.Cells[4,1]:=ANode.Text;
               end;
              
               if (ANode.LocalName='LineExtensionAmount') then begin
          inc(tutar); if tutar=2 then
            StringGrid1.Cells[5,1]:=ANode.Text;
                end;
               




          End Else Begin
          Memo1.Lines.Add(BoslukAt(Girinti)+'- '+ ANode.LocalName);
          NOdeOku(ANODE);
                   End;
 ANode  := ANode.NextSibling;//bir sonraki node ye atla...
                            end;
until ANode=Nil;
End;
/////////////////////////// listeleme bitiþ

///////////////////////////KAYDETME  BAÞLANGIÇ


procedure TForm1.NOdeOkuKaydet(A:IXMLNode);
VAR
ANode : IXMLNode;
Begin
Girinti := Girinti + 3;
 ANode:=A.ChildNodes.First;
repeat
    if Assigned(ANode) then begin
 if (ANode.IsTextElement=true)
     Then Begin
        Memo1.Lines.Add(BoslukAt(Girinti)+': '+ANode.LocalName+' -> '+ANode.Text);

              if (ANode.LocalName='Name') then begin   // elektrik tüketim bedeli
            inc(name); if name=11 then
          StringGrid1.Cells[1,1]:=ANode.Text;
            end;



           if (ANode.LocalName='FirstName') then    //cari adý
           Edit3.Text:=ANode.Text;
            // memoda istenilen satýra ekleme
           if (ANode.LocalName='FamilyName') then
           Edit7.Text:= ANode.Text;
             if (ANode.LocalName='ID') then begin //ID ler çok olduðu için saydýrarak buluyorum
          inc(id); if id=6 then // postal adress teki id için  mahalle
          Edit9.Text:= ANode.Text;
            end;
            if (ANode.LocalName='StreetName') then
           Edit10.Text:= ANode.Text; //sokak no
            if (ANode.LocalName='BuildingNumber') then
          Edit11.Text:= 'No: '+ANode.Text;
           if (ANode.LocalName='Room') then
           Edit12.Text:='Daire: '+ ANode.Text;
            if (ANode.LocalName='CitySubdivisionName')then begin
            inc(csdname); if csdname=2 then
            Edit13.Text:=ANode.Text;
             end;
             if (ANode.LocalName='CityName') then begin
             inc(cname); if cname=2 then
             Edit14.Text:=ANode.Text;
             end;


              if (ANode.LocalName='TaxAmount') then
           Edit8.Text:= ANode.Text;                 //toplam kdv
              if (ANode.LocalName='BaseAmount') then
           Edit5.Text:= ANode.Text;    //toplam fiyat
              if (ANode.LocalName='PayableAmount') then
           Edit6.Text:= ANode.Text;  //genel toplam


                if (ANode.LocalName='InvoicedQuantity') then
                StringGrid1.Cells[2,1]:=ANode.Text+' KWH';
          // Memo2.Lines.Add('Ürün Detayý '+ANode.Text+' KWH');



                if (ANode.LocalName='PriceAmount') then
           StringGrid1.Cells[3,1]:=ANode.Text;


                if (ANode.LocalName='TaxAmount') then begin
                inc(kdv);  if kdv=4 then
           StringGrid1.Cells[4,1]:=ANode.Text;
               end;

               if (ANode.LocalName='LineExtensionAmount') then begin
          inc(tutar); if tutar=2 then
            StringGrid1.Cells[5,1]:=ANode.Text;
                end;
               ShowMessage(StringGrid1.Cells[1,1]);




          End Else Begin
          Memo1.Lines.Add(BoslukAt(Girinti)+'- '+ ANode.LocalName);
          NOdeOku(ANODE);
                   End;
 ANode  := ANode.NextSibling;//bir sonraki node ye atla...
                            end;
until ANode=Nil;
End;


///////////////////////////KAYDETME BÝTÝÞ

procedure TForm1.Button1Click(Sender: TObject);
var
D : IXMLDocument;
ANode: IXMLNode;
begin
memo1.Lines.Clear;
D:= LoadXMLDocument('TemelFaturaOrnegi.xml');
D.Active := True ;
ANode:=D.DocumentElement.ChildNodes.First; // ilk node invoice tir
repeat
if Assigned(ANode)
  Then begin
 if (ANode.IsTextElement=True)
     Then Begin
        Memo1.Lines.Add(BoslukAt(Girinti)+': '+ANode.LocalName+' -> '+ANode.Text);
            if ANode.LocalName='IssueDate' then
            Edit4.Text:=ANode.Text;
            if ANode.LocalName='ID' then
             Edit1.Text:=ANode.Text;
             if ANode.LocalName='IssueTime' then
            Edit2.Text:=ANode.Text;
             // BURADA ANA NODE UN SADECE DEÐER OLANLARI LÝSTELENÝR



          End Else Begin
     if (ANode.NodeName<>'ext:UBLExtensions') and
        (ANode.NodeName<>'cac:AdditionalDocumentReference') and
        (ANode.NodeName<>'cac:Signature')
         Then Begin
              Memo1.Lines.Add('*'+ ANode.NodeName); // Ana Node (Ana Baslik)
              Girinti := 0;
              NOdeOku(ANODE);
              End;
                   End;
 ANode  := ANode.NextSibling;//bir sonraki node ye atla...
       End;
until ANode=Nil;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
FORM2.SHOW;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
StringGrid1.RowCount:=4;
StringGrid1.ColCount:=6;
 StringGrid1.Cells[1,0]:='Ürün Adý';
 StringGrid1.Cells[2,0]:='Ürün Detayý';
 StringGrid1.Cells[3,0]:='Birim Fiyat';
 StringGrid1.Cells[4,0]:='KDV';
 StringGrid1.Cells[5,0]:='Tutar';
end;

end.
