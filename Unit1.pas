unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,xmldom,XMLIntf,XMLDoc, Grids, ExtCtrls;

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
    Label10: TLabel;
    Edit15: TEdit;
    Panel1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Label14: TLabel;
    Edit24: TEdit;
    Label15: TLabel;
    Edit25: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit26: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
 public
    id,name,kdv,tutar,pamount,urunmik:integer;
    csdname,iskoran,kdvoran,mail,site,strname,tel,telfax:integer;
    cname:integer;
    //
    id2,name2,kdv2,tutar2,csdname2,cname2:integer;

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


///////////////////////////////////   listele başlangıç
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
            inc(name); if name=8 then                // temel efaturada 6,9 idi
          StringGrid1.Cells[2,1]:=ANode.Text;
          end;

          if (ANode.LocalName='ID') then begin   // sıra no ürünlerin
           // ShowMessage(IntToStr(id)+' '+ANode.Text);
            if id=5 then
          StringGrid1.Cells[1,1]:=ANode.Text;
          end;
          if (ANode.LocalName='AllowanceChargeReason') then begin   // iskonto oran
           // ShowMessage(IntToStr(iskoran)+' '+ANode.Text);
            if iskoran=0 then         // id değeri ürün 1 tane olduğu için '0'
          StringGrid1.Cells[5,1]:=ANode.Text;
          end;
          if (ANode.LocalName='MultiplierFactorNumeric') then begin   // iskonto tutar
           // ShowMessage(IntToStr(iskoran)+' '+ANode.Text);
            if iskoran=0 then
          StringGrid1.Cells[6,1]:=ANode.Text;
          end;
          if (ANode.LocalName='Amount') then begin   // iskonto tutar
            //ShowMessage(IntToStr(iskoran)+' '+ANode.Text);
            if iskoran=0 then
          StringGrid1.Cells[6,1]:=ANode.Text; inc(iskoran);
          end;
          if (ANode.LocalName='Percent') then begin   // kdv oranı
            //ShowMessage(IntToStr(kdvoran)+' kdv '+ANode.Text);
            if kdvoran=1 then
          StringGrid1.Cells[8,1]:=ANode.Text; inc(kdvoran);
          end;

           if (ANode.LocalName='FirstName') then    //cari adı
           Edit3.Text:=ANode.Text;


           if (ANode.LocalName='FamilyName') then
           Edit7.Text:= ANode.Text;
             if (ANode.LocalName='ID') then begin //ID ler çok olduğu için saydırarak buluyorum
          inc(id); if id=6 then // postal adress teki id için  mahalle
          Edit9.Text:= ANode.Text;
            end;

            if (ANode.LocalName='StreetName') then begin         //müşteri adres
          ShowMessage(IntToStr(strname)+' str '+ANode.Text);
           if strname=1  then
          Edit10.Text:= ANode.Text; //sokak no

           end;

            if (ANode.LocalName='BuildingNumber') then
          Edit11.Text:=ANode.Text;
           if (ANode.LocalName='Room') then
           Edit12.Text:=ANode.Text;
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
              if (ANode.LocalName='PayableAmount') then     //baseamount
           Edit5.Text:= ANode.Text;    //toplam fiyat
              if (ANode.LocalName='PayableAmount') then
           Edit6.Text:= ANode.Text;  //genel toplam
               if (ANode.LocalName='AllowanceTotalAmount') then
           Edit15.Text:=ANode.Text;
                          // iskonto toplam

                 if (ANode.LocalName='InvoicedQuantity') then begin
                //ShowMessage('enes '+IntToStr(urunmik)+' '+ANode.Text);
                 if urunmik=0 then
                 StringGrid1.Cells[3,1]:=ANode.Text;
          // Memo2.Lines.Add('Ürün Detayı '+ANode.Text+' KWH');
                 end;


                if (ANode.LocalName='PriceAmount') then //BİRİM FİYAT
           StringGrid1.Cells[4,1]:=ANode.Text;
               
                if (ANode.LocalName='TaxAmount') then begin
                inc(kdv);  if kdv=4 then
           StringGrid1.Cells[9,1]:=ANode.Text;
               end;

               if (ANode.LocalName='LineExtensionAmount') then begin   //satır top tutar
          inc(tutar); if tutar=2 then
            StringGrid1.Cells[11,1]:=ANode.Text;
                end;

                ////2. SATIR
            {
             if (ANode.LocalName='Name') then begin   // elektrik tüketim bedeli  // ürün adı
            //ShowMessage(IntToStr(name)+ANode.Text);
             if name=8 then                // temel efaturada 6,9 idi
          StringGrid1.Cells[1,2]:=ANode.Text;
          end;

                if (ANode.LocalName='InvoicedQuantity') then begin         //ürün miktarı
                //ShowMessage('enes '+IntToStr(urunmik)+' '+ANode.Text);
                 if urunmik=1 then
                 StringGrid1.Cells[2,2]:=ANode.Text;
                 inc(urunmik);
          // Memo2.Lines.Add('Ürün Detayı '+ANode.Text+' KWH');
                end;


                if (ANode.LocalName='PriceAmount') then  begin   // birim fiyat
           inc(pamount); if pamount=2 then
           StringGrid1.Cells[3,2]:=ANode.Text;
                 end;
                if (ANode.LocalName='TaxAmount') then begin
                 if kdv=5 then
           StringGrid1.Cells[4,2]:=ANode.Text;
               end;

               if (ANode.LocalName='LineExtensionAmount') then begin   //satır top tutar
          if tutar=3 then
            StringGrid1.Cells[5,2]:=ANode.Text;//ShowMessage(ANode.NodeName);
                end;
                  }
                /////////////////////// satıcı bilgileri başlangıç
                 if (ANode.LocalName='Telephone') then begin         // satıcı firma adı
                //ShowMessage('tel '+IntToStr(tel)+' '+ANode.Text);
                if tel=0 then
                 Edit18.Text:=ANode.Text;
                 end;

                  if (ANode.LocalName='Telefax') then begin         // satıcı firma adı
                //ShowMessage('tel '+IntToStr(telfax)+' '+ANode.Text);
                if telfax=0 then
                 Edit19.Text:=ANode.Text;
                 end;

                 if (ANode.LocalName='Name') then begin         // satıcı firma adı
                //ShowMessage('n '+IntToStr(name)+' '+ANode.Text);
                if name=1 then
                 Edit16.Text:=ANode.Text;
                 end;

                 if (ANode.LocalName='StreetName') then begin         //adres
                //ShowMessage('site '+IntToStr(site)+' '+ANode.Text);
                 if strname=0 then
                 Edit17.Text:=ANode.Text;
                 inc(strname);
                 end;

                 if (ANode.LocalName='WebsiteURI') then begin         // website
               // ShowMessage('site '+IntToStr(site)+' '+ANode.Text);
                 if site=0 then
                 Edit20.Text:=ANode.Text;
                 end;
                 if (ANode.LocalName='ElectronicMail') then begin         // e posta
                //ShowMessage('mail '+IntToStr(mail)+' '+ANode.Text);
                 if mail=0 then
                 Edit21.Text:=ANode.Text;
                 end;
                 if (ANode.LocalName='Name') then begin         // V.dairesi
                //ShowMessage('id '+IntToStr(Name)+' '+ANode.Text);
                 if Name=3 then
                 Edit22.Text:=ANode.Text;
                 end;

                 if (ANode.LocalName='ID') then begin         // V.NO
                //ShowMessage('id '+IntToStr(ID)+' '+ANode.Text);
                 if id=2 then
                 Edit23.Text:=ANode.Text;
                 end;
                ////////////////////////satıcı8 bilgileri bitiş


          End Else Begin
          Memo1.Lines.Add(BoslukAt(Girinti)+'- '+ ANode.LocalName);
          NOdeOku(ANODE);
                   End;
 ANode  := ANode.NextSibling;//bir sonraki node ye atla...
                            end;
until ANode=Nil;
End;
/////////////////////////// listeleme bitiş

///////////////////////////KAYDETME  BAŞLANGIÇ


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
            //ShowMessage(IntToStr(name)+ANode.Text);
            inc(name); if name=8 then                // temel efaturada 6,9 idi
          ANode.Text:=StringGrid1.Cells[2,1];
          end;

          if (ANode.LocalName='ID') then begin   // sıra no ürünlerin
           // ShowMessage(IntToStr(id)+' '+ANode.Text);
            if id=5 then
          ANode.Text:=StringGrid1.Cells[1,1];
          end;
          if (ANode.LocalName='AllowanceChargeReason') then begin   // iskonto oran
           // ShowMessage(IntToStr(iskoran)+' '+ANode.Text);
            if iskoran=0 then         // id değeri ürün 1 tane olduğu için '0'
          ANode.Text:=StringGrid1.Cells[5,1];
          end;
          if (ANode.LocalName='MultiplierFactorNumeric') then begin   // iskonto tutar
           // ShowMessage(IntToStr(iskoran)+' '+ANode.Text);
            if iskoran=0 then
          ANode.Text:=StringGrid1.Cells[6,1];
          end;
          if (ANode.LocalName='Amount') then begin   // iskonto tutar
            //ShowMessage(IntToStr(iskoran)+' '+ANode.Text);
            if iskoran=0 then
          ANode.Text:=StringGrid1.Cells[6,1]; inc(iskoran);
          end;
          if (ANode.LocalName='Percent') then begin   // kdv oranı
            //ShowMessage(IntToStr(kdvoran)+' kdv '+ANode.Text);
            if kdvoran=1 then
          ANode.Text:=StringGrid1.Cells[8,1]; inc(kdvoran);
          end;

           if (ANode.LocalName='FirstName') then    //cari adı
           ANode.Text:=Edit3.Text;


           if (ANode.LocalName='FamilyName') then
            ANode.Text:=Edit7.Text;
             if (ANode.LocalName='ID') then begin //ID ler çok olduğu için saydırarak buluyorum
          inc(id); if id=6 then // postal adress teki id için  mahalle
           ANode.Text:=Edit9.Text;
            end;

            if (ANode.LocalName='StreetName') then begin         //müşteri adres
          ShowMessage(IntToStr(strname)+' str '+ANode.Text);
           if strname=1  then
           ANode.Text:=Edit10.Text; //sokak no

           end;

            if (ANode.LocalName='BuildingNumber') then
           ANode.Text:=Edit11.Text;
           if (ANode.LocalName='Room') then
           ANode.Text:=Edit12.Text;
            if (ANode.LocalName='CitySubdivisionName')then begin
            inc(csdname); if csdname=2 then
            ANode.Text:=Edit13.Text;
             end;
             if (ANode.LocalName='CityName') then begin
             inc(cname); if cname=2 then
             ANode.Text:=Edit14.Text;
             end;


              if (ANode.LocalName='TaxAmount') then
           ANode.Text:=Edit8.Text;                 //toplam kdv
              if (ANode.LocalName='PayableAmount') then     //baseamount
           ANode.Text:=Edit5.Text;    //toplam fiyat
              if (ANode.LocalName='PayableAmount') then
            ANode.Text:=Edit6.Text;  //genel toplam
               if (ANode.LocalName='AllowanceTotalAmount') then
           ANode.Text:=Edit15.Text;
                          // iskonto toplam

                 if (ANode.LocalName='InvoicedQuantity') then begin
                //ShowMessage('enes '+IntToStr(urunmik)+' '+ANode.Text);
                 if urunmik=0 then
                 ANode.Text:=StringGrid1.Cells[3,1];
          // Memo2.Lines.Add('Ürün Detayı '+ANode.Text+' KWH');
                 end;


                if (ANode.LocalName='PriceAmount') then //BİRİM FİYAT
           ANode.Text:=StringGrid1.Cells[4,1];
               
                if (ANode.LocalName='TaxAmount') then begin
                inc(kdv);  if kdv=4 then
           ANode.Text:=StringGrid1.Cells[9,1];
               end;

               if (ANode.LocalName='LineExtensionAmount') then begin   //satır top tutar
          inc(tutar); if tutar=2 then
            ANode.Text:=StringGrid1.Cells[11,1];
                end;

                ////2. SATIR
            {
             if (ANode.LocalName='Name') then begin   // elektrik tüketim bedeli  // ürün adı
            //ShowMessage(IntToStr(name)+ANode.Text);
             if name=8 then                // temel efaturada 6,9 idi
          StringGrid1.Cells[1,2]:=ANode.Text;
          end;

                if (ANode.LocalName='InvoicedQuantity') then begin         //ürün miktarı
                //ShowMessage('enes '+IntToStr(urunmik)+' '+ANode.Text);
                 if urunmik=1 then
                 StringGrid1.Cells[2,2]:=ANode.Text;
                 inc(urunmik);
          // Memo2.Lines.Add('Ürün Detayı '+ANode.Text+' KWH');
                end;


                if (ANode.LocalName='PriceAmount') then  begin   // birim fiyat
           inc(pamount); if pamount=2 then
           StringGrid1.Cells[3,2]:=ANode.Text;
                 end;
                if (ANode.LocalName='TaxAmount') then begin
                 if kdv=5 then
           StringGrid1.Cells[4,2]:=ANode.Text;
               end;

               if (ANode.LocalName='LineExtensionAmount') then begin   //satır top tutar
          if tutar=3 then
            StringGrid1.Cells[5,2]:=ANode.Text;//ShowMessage(ANode.NodeName);
                end;
                  }
                /////////////////////// satıcı bilgileri başlangıç
                 if (ANode.LocalName='Telephone') then begin         // satıcı firma adı
                //ShowMessage('tel '+IntToStr(tel)+' '+ANode.Text);
                if tel=0 then
                 ANode.Text:=Edit18.Text;
                 end;

                  if (ANode.LocalName='Telefax') then begin         // satıcı firma adı
                //ShowMessage('tel '+IntToStr(telfax)+' '+ANode.Text);
                if telfax=0 then
                 ANode.Text:=Edit19.Text;
                 end;

                 if (ANode.LocalName='Name') then begin         // satıcı firma adı
                //ShowMessage('n '+IntToStr(name)+' '+ANode.Text);
                if name=1 then
                 ANode.Text:=Edit16.Text;
                 end;

                 if (ANode.LocalName='StreetName') then begin         //adres
                //ShowMessage('site '+IntToStr(site)+' '+ANode.Text);
                 if strname=0 then
                 ANode.Text:=Edit17.Text;
                 inc(strname);
                 end;

                 if (ANode.LocalName='WebsiteURI') then begin         // website
               // ShowMessage('site '+IntToStr(site)+' '+ANode.Text);
                 if site=0 then
                 ANode.Text:=Edit20.Text;
                 end;
                 if (ANode.LocalName='ElectronicMail') then begin         // e posta
                //ShowMessage('mail '+IntToStr(mail)+' '+ANode.Text);
                 if mail=0 then
                 ANode.Text:=Edit21.Text;
                 end;
                 if (ANode.LocalName='Name') then begin         // V.dairesi
                //ShowMessage('id '+IntToStr(Name)+' '+ANode.Text);
                 if Name=3 then
                 ANode.Text:=Edit22.Text:=;
                 end;

                 if (ANode.LocalName='ID') then begin         // V.NO
                //ShowMessage('id '+IntToStr(ID)+' '+ANode.Text);
                 if id=2 then
                 ANode.Text:=Edit23.Text;
                 end;
                ////////////////////////satıcı8 bilgileri bitiş


              {
              if (ANode.LocalName='Name') then begin   // elektrik tüketim bedeli
            inc(name2); if name2=11 then
          ANode.Text:=StringGrid1.Cells[1,1];
            end;



           if (ANode.LocalName='FirstName') then    //cari adı
           ANode.Text:=Edit3.Text;
            // memoda istenilen satıra ekleme
           if (ANode.LocalName='FamilyName') then
            ANode.Text:=Edit7.Text;
             if (ANode.LocalName='ID') then begin //ID ler çok olduğu için saydırarak buluyorum
          inc(id2); if id2=6 then // postal adress teki id için  mahalle
          ANode.Text:=Edit9.Text;
            end;
            if (ANode.LocalName='StreetName') then
           ANode.Text:=Edit10.Text; //sokak no
            if (ANode.LocalName='BuildingNumber') then
          ANode.Text:=Edit11.Text;
           if (ANode.LocalName='Room') then
           ANode.Text:=Edit12.Text;
            if (ANode.LocalName='CitySubdivisionName')then begin  //ilçe çamlık!
            inc(csdname2); if csdname2=2 then
            ANode.Text:=Edit13.Text;
             end;
             if (ANode.LocalName='CityName') then begin
             inc(cname2); if cname2=2 then
             ANode.Text:=Edit14.Text;
             end;


              if (ANode.LocalName='TaxAmount') then
           ANode.Text:=Edit8.Text;                 //toplam kdv
              if (ANode.LocalName='BaseAmount') then
           ANode.Text:=Edit5.Text;    //toplam fiyat
              if (ANode.LocalName='PayableAmount') then
           ANode.Text:=Edit6.Text;  //genel toplam


                if (ANode.LocalName='InvoicedQuantity') then
                ANode.Text:=StringGrid1.Cells[2,1];
          // Memo2.Lines.Add('Ürün Detayı '+ANode.Text+' KWH');



                if (ANode.LocalName='PriceAmount') then
           ANode.Text:=StringGrid1.Cells[3,1];


                if (ANode.LocalName='TaxAmount') then begin
                inc(kdv2);  if kdv2=4 then
           ANode.Text:=StringGrid1.Cells[4,1];
               end;

               if (ANode.LocalName='LineExtensionAmount') then begin
          inc(tutar2); if tutar2=2 then
            ANode.Text:=StringGrid1.Cells[5,1];
            end;
                  }




          End Else Begin
          Memo1.Lines.Add(BoslukAt(Girinti)+'- '+ ANode.LocalName);
          NOdeOkuKaydet(ANODE);
                   End;
 ANode  := ANode.NextSibling;//bir sonraki node ye atla...
                            end;
until ANode=Nil;
End;


///////////////////////////KAYDETME BİTİŞ

procedure TForm1.Button1Click(Sender: TObject);
var
D : IXMLDocument;
ANode: IXMLNode;
begin
Button3.Visible:=True;// Ekranlar boşken kaydetme özelliğinin kullanılmamasını sağlamak için
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

            // FATURA BİLGİLERİ
            if ANode.LocalName='IssueDate' then
            Edit4.Text:=ANode.Text;
            if ANode.LocalName='ID' then
             Edit1.Text:=ANode.Text;
             if ANode.LocalName='IssueTime' then
            Edit2.Text:=ANode.Text;
            if (ANode.LocalName='UUID')then begin    // Uuid çekme
           Edit25.Text:=ANode.Text;
           end;
            if (ANode.LocalName='InvoiceTypeCode')then begin    // FATURA TİPİ SATIŞ
           Edit24.Text:=ANode.Text;
           end;
           if (ANode.LocalName='ProfileID')then begin    // FATURA SENARYO TEMEL FATURA
           Edit26.Text:=ANode.Text;
           end;
             // BURADA ANA NODE UN SADECE DEĞER OLANLARI LİSTELENİR



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
Button3.Visible:=False;
StringGrid1.RowCount:=4;
StringGrid1.ColCount:=12;
 StringGrid1.Cells[1,0]:='Sıra No';
 StringGrid1.Cells[2,0]:='Mal Hizmet';
 StringGrid1.Cells[3,0]:='Miktar';
 StringGrid1.Cells[4,0]:='Birim Fiyat';
 StringGrid1.Cells[5,0]:='İskonto/Artırım Oranı';
 StringGrid1.Cells[6,0]:='İskonto/Artırım Tutarı';
 StringGrid1.Cells[7,0]:='İskonto/Artırım Nedeni';
 StringGrid1.Cells[8,0]:='KDV Oranı';
 StringGrid1.Cells[9,0]:='KDV Tutarı';
 StringGrid1.Cells[10,0]:='Diğer Vergiler';
 StringGrid1.Cells[11,0]:='Mal Hizmet Tutarı';

end;

procedure TForm1.Button3Click(Sender: TObject);
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
            ANode.Text:=Edit4.Text;
            if ANode.LocalName='ID' then
             ANode.Text:=Edit1.Text;
             if ANode.LocalName='IssueTime' then
            ANode.Text:=Edit2.Text;
            if (ANode.LocalName='UUID')then begin    // Uuid çekme
           ANode.Text:=Edit25.Text;
           end;
            if (ANode.LocalName='InvoiceTypeCode')then begin    // FATURA TİPİ SATIŞ
           ANode.Text:=Edit24.Text;
           end;
           if (ANode.LocalName='ProfileID')then begin    // FATURA SENARYO TEMEL FATURA
           ANode.Text:=Edit26.Text;
           end;
             // BURADA ANA NODE UN SADECE DEĞER OLANLARI LİSTELENİR



          End Else Begin
     if (ANode.NodeName<>'ext:UBLExtensions') and
        (ANode.NodeName<>'cac:AdditionalDocumentReference') and
        (ANode.NodeName<>'cac:Signature')
         Then Begin
              Memo1.Lines.Add('*'+ ANode.NodeName); // Ana Node (Ana Baslik)
              Girinti := 0;
              NOdeOkuKaydet(ANODE);
              End;
                   End;
 ANode  := ANode.NextSibling;//bir sonraki node ye atla...
       End;
until ANode=Nil;
D.SaveToFile('TemelFaturaOrnegi.xml');  // işlemler bittiğinde kaydetmek için

end;

end.
