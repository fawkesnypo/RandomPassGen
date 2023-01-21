unit PASSWORDGEN;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, ExtCtrls,
  StdCtrls, ComCtrls, Spin,Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    btGerar: TButton;
    cbGroup1: TCheckGroup;
    lTamanho: TLabel;
    cbNumeros: TCheckBox;
    Panel1: TPanel;
    cbSimbolos: TCheckBox;
    cbLetras: TCheckBox;
    seTamanho: TSpinEdit;
    procedure btGerarClick(Sender: TObject);
    procedure cbChange(Sender: TObject);
    function Password(range:Integer):string;
    function getContent:string;
    function ValidateNumberLN(number:Integer):Integer;
    function ValidateNumberLS(number:Integer):Integer;
    function ValidateNumberNS(number:Integer):Integer;
    function ValidateNumberL(number:Integer):Integer;
    function ValidateNumberS(number:Integer):Integer;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btGerarClick(Sender: TObject);
var
  pswd:string;
begin
  if seTamanho.Value >= 3 then
     begin
          pswd := Password(seTamanho.Value);
          ShowMessage(pswd);
     end
  else
      begin
        ShowMessage('O tamanho deve estar entre 3 e 1000')
      end;
end;

function TForm1.getContent:string;
begin
  Result := '';
  if not((cbLetras.Checked) and (cbNumeros.Checked) and (cbSimbolos.Checked)) then
      begin
           if cbLetras.Checked then
              Result := Result + 'L';

           if cbNumeros.Checked then
              Result := Result + 'N';

           if cbSimbolos.Checked then
              Result := Result + 'S';

           Exit;
      end
   else
       begin
         Result := 'LNS';
         Exit;
       end;
end;

function TForm1.ValidateNumberLN(number:Integer):Integer;
begin
   case number of
       48..57:begin
         Result := number
       end;
       65..90:begin
         Result := number
       end;
       97..122:begin
         Result := number
       end;
       else
         begin
         Result := RandomRange(65,90)
       end;
   end;

end;
function TForm1.ValidateNumberLS(number:Integer):Integer;
begin
   case number of
       33..47:begin
         Result := number
       end;
       58..126:begin
         Result := number
       end;
       else
         begin
         Result := RandomRange(58,126)
       end;
   end;

end;
function TForm1.ValidateNumberNS(number:Integer):Integer;
begin
   case number of
       33..64:begin
         Result := number
       end;
       91..96:begin
         Result := number
       end;
       123..126:begin
         Result := number
       end;
       else
         begin
         Result := RandomRange(33,64)
       end;
   end;

end;
function TForm1.ValidateNumberL(number:Integer):Integer;
begin
   case number of
       65..90:begin
         Result := number
       end;
       97..122:begin
         Result := number
       end;
       else
         begin
         Result := RandomRange(97,122)
       end;
   end;

end;
function TForm1.ValidateNumberS(number:Integer):Integer;
begin
   case number of
       33..47:begin
         Result := number
       end;
       58..64:begin
         Result := number
       end;
       91..96:begin
         Result := number
       end;
       123..126:begin
         Result := number
       end;
       else
         begin
         Result := RandomRange(33,47)
       end;
   end;

end;

function TForm1.Password(range:Integer):string;
var
    str, content: string;
    int,rFrom,rTo : integer;
begin
   content := getContent;
   str:='';
   setLength(str,range);
   for int := 1 to range do

       case content of
           'LNS':begin
                        rFrom := 33;
                        rTo := 126;
                        str[int] := chr(RandomRange(rFrom,rTo));
           end;

           'LN':begin
                        rFrom := 48;
                        rTo := 122;
                        str[int] := chr(ValidateNumberLN(RandomRange(rFrom,rTo)));
           end;

           'LS':begin
                        rFrom := 33;
                        rTo := 126;
                        str[int] := chr(ValidateNumberLS(RandomRange(rFrom,rTo)));
           end;

           'NS':begin
                        rFrom := 33;
                        rTo := 126;
                        str[int] := chr(ValidateNumberNS(RandomRange(rFrom,rTo)));
           end;

           'L':begin
                        rFrom := 65;
                        rTo := 122;
                        str[int] := chr(ValidateNumberL(RandomRange(rFrom,rTo)));
           end;

           'N':begin
                        rFrom := 48;
                        rTo := 57;
                        str[int] := chr(RandomRange(rFrom,rTo));
           end;

           'S':begin
                        rFrom := 33;
                        rTo := 126;
                        str[int] := chr(ValidateNumberS(RandomRange(rFrom,rTo)));
           end;
       end;

   Result:= str;
end;

procedure TForm1.cbChange(Sender: TObject);
begin

  if not((cbLetras.Checked) or (cbNumeros.Checked) or (cbSimbolos.Checked)) then
     begin
          ShowMessage('Uma das opções deve ser selecionada!');
          btGerar.Enabled:=False;
          Exit;
     end;

  if not(btGerar.Enabled) then
     btGerar.Enabled:=True;
end;


end.

