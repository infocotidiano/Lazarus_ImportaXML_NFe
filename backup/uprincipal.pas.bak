unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DBGrids, DbCtrls, ACBrNFe, ZConnection, ZDataset, ZSqlUpdate, pcnConversao;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    NF: TACBrNFe;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DsCAB: TDataSource;
    DsITE: TDataSource;
    edtXML: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Conexao: TZConnection;
    qrCAB: TZQuery;
    qrCABDES_BAI: TStringField;
    qrCABDES_CID: TStringField;
    qrCABDES_CNPJ: TStringField;
    qrCABDES_END: TStringField;
    qrCABDES_NOME: TStringField;
    qrCABEMISSAO: TDateField;
    qrCABEMI_BAI: TStringField;
    qrCABEMI_CID: TStringField;
    qrCABEMI_CNPJ: TStringField;
    qrCABEMI_END: TStringField;
    qrCABEMI_NOME: TStringField;
    qrCABNATOPERACAO: TStringField;
    qrCABNRONFE: TLongintField;
    qrCABSTATUS: TStringField;
    qrITE: TZQuery;
    qrITEBARRAS: TStringField;
    qrITECFOP: TStringField;
    qrITECODPROD: TStringField;
    qrITECOFINS_CST: TStringField;
    qrITECOFINS_PER: TFloatField;
    qrITECOFINS_VAL: TFloatField;
    qrITEDESCONTO: TFloatField;
    qrITEDESCRICAO: TStringField;
    qrITEICMS_CSOSN: TStringField;
    qrITEICMS_CST: TStringField;
    qrITEICMS_PER: TFloatField;
    qrITEICMS_VAL: TFloatField;
    qrITEITEM: TLongintField;
    qrITENCM: TStringField;
    qrITENRONOTA: TLongintField;
    qrITEPIS_CST: TStringField;
    qrITEPIS_PER: TFloatField;
    qrITEPIS_VAL: TFloatField;
    qrITEQUANTIDADE: TFloatField;
    qrITETOTALITEM: TFloatField;
    qrITEUNIDADE: TStringField;
    qrITEVALUNI: TFloatField;
    upCAB: TZUpdateSQL;
    upITE: TZUpdateSQL;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmprincipal: Tfrmprincipal;

implementation

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.Button1Click(Sender: TObject);
var  nX : integer;
begin
  if edtXML.Text <> '' then
     begin
       if not FileExists(edtXML.text) then
          begin
            OpenDialog1.Execute;
            edtXML.Text:= OpenDialog1.FileName;
          end;
     end
  else
     begin
       OpenDialog1.Execute;
       edtXML.Text:= OpenDialog1.FileName;
     end;
   // Abrir o arquivo XML
   nf.NotasFiscais.Clear;
   nf.NotasFiscais.LoadFromFile(edtXML.Text);
   // Importar o cabeçalho da NFe // do XML
   qrCAB.Insert;
   qrCABNRONFE.Value      := nf.NotasFiscais.Items[0].NFe.Ide.cNF;
   qrCABEMISSAO.Value     := nf.NotasFiscais.Items[0].NFe.Ide.dEmi;
   showmessage('Ler tag emissao: nf.NotasFiscais.Items[0].NFe.Ide.dEmi'+#13+
                'Conteúdo da tag: '+ datetostr(nf.NotasFiscais.Items[0].NFe.Ide.dEmi) );
   qrCABNATOPERACAO.Value := nf.NotasFiscais.Items[0].NFe.Ide.natOp;
   qrCABSTATUS.Value      := nf.NotasFiscais.Items[0].NFe.procNFe.xMotivo;
   qrCABEMI_NOME.Value    := nf.NotasFiscais.Items[0].NFe.Emit.xNome;
   qrCABEMI_CNPJ.Value    := nf.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
   qrCABEMI_END.Value     := nf.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr;
   qrCABEMI_BAI.Value     := nf.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xBairro;
   qrCABEMI_CID.Value     := nf.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun;
   qrCABDES_NOME.Value    := nf.NotasFiscais.Items[0].NFe.Dest.xNome;
   qrCABDES_CNPJ.Value    := nf.NotasFiscais.Items[0].NFe.Dest.CNPJCPF;
   qrCABDES_END.Value     := nf.NotasFiscais.Items[0].NFe.Dest.EnderDest.xLgr;
   qrCABDES_BAI.Value     := nf.NotasFiscais.Items[0].NFe.Dest.EnderDest.xBairro;
   qrCABDES_CID.Value     := nf.NotasFiscais.Items[0].NFe.Dest.EnderDest.xMun;
   qrCAB.Post;
   // Importar o item do XML da NFe
   for nX := 0 to  nf.NotasFiscais.Items[0].NFe.Det.Count -1 do
      begin
        qrITE.Insert ;
        qrITENRONOTA.Value   := nf.NotasFiscais.Items[0].NFe.Ide.cNF;
        qrITEITEM.Value      := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.nItem;
        qrITEBARRAS.Value    := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.cEAN;
        qrITECODPROD.Value   := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.cProd;
        qrITEDESCRICAO.Value := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.xProd;
        qrITECFOP.Value      := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.CFOP;
        qrITEUNIDADE.Value   := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.uTrib;
        qrITEVALUNI.Value    := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.vUnCom;
        qrITEQUANTIDADE.Value:= nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.qCom;
        qrITEDESCONTO.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.vDesc;
        qrITETOTALITEM.Value := (nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.vUnCom * nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Prod.qCom);
        // Tributos ICMS
        qrITEICMS_CSOSN.Value:= CSOSNIcmsToStr(nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.ICMS.CSOSN);
        qrITEICMS_CST.Value  := CSTICMSToStr(nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.ICMS.CST);
        qrITEICMS_PER.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.ICMS.pICMS;
        qrITEICMS_VAL.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.ICMS.vICMS;
        // Tributos PIS
        qrITEPIS_CST.Value  := CSTPISToStr(nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.PIS.CST);
        qrITEPIS_PER.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.PIS.pPIS;
        qrITEPIS_VAL.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.PIS.vPIS;
        // Tributos COFINS
        qrITECOFINS_CST.Value  := CSTCOFINSToStr(nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.COFINS.CST);
        qrITECOFINS_PER.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.COFINS.pCOFINS;
        qrITECOFINS_VAL.Value  := nf.NotasFiscais.Items[0].NFe.Det.Items[nX].Imposto.COFINS.vCOFINS;
        qrITE.Post ;
      end;
   ShowMessage('Importação concluída !');

end;

end.

