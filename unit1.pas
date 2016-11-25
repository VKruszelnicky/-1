unit Unit1;
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
  public
  end;



  var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

Procedure TForm1.Button2Click(Sender: TObject);
Var PName: String; TargetNumber, PlayerShot, Step: Integer;
Begin
Memo1.Clear;
PName:=Edit2.Text;
TargetNumber:=Random(10)+1;
           Step:=1;
While Step<=10 Do
Begin
        do
        PlayerShot:=StrToIntDef(InputBox('INPUT YOUR DATA', 'Введите число:', ''), 0);
        while inttostr(PlayerShot) <> '';

       If (TargetNumber<>PlayerShot) Then
               begin
            Memo1.Lines.Add(PName+','+inttostr(PlayerShot)+' '+'неверное число, это ваша '+IntToStr(Step)+' попытка!');

                    end
      Else
            Begin
             Memo1.Clear;
            Memo1.Lines.Add(IntToStr(10-Step)+' '+'- ваш личный рейтинг'+' '+ PName+', вы угадали с '+IntToStr(Step)+'-й попытки!');
            Step:=0;
            break;
            End;
      Inc(Step);

      End;

  If Step=11 Then
           begin
      ShowMessage('Вы не угадали, загаданное число было '+IntToStr(TargetNumber));
          Memo1.Clear;
          Edit2.text:='';
           end;
   Button4.Visible:= true;
end;


procedure TForm1.Button1Click(Sender: TObject);
 var t:tstringlist;
begin
  Memo1.Lines.LoadFromfile('F:\ugadai\rez.txt');
t:=TStringlist.Create;
t.addstrings(memo1.lines);
t.sort;
memo1.clear;
memo1.Lines.addstrings(t);
end;

procedure TForm1.Button3Click(Sender: TObject);

begin
   close;
end;

procedure TForm1.Button4Click(Sender: TObject);
 var
  i:integer;
begin
Edit2.Clear;

with TStringList.Create do
  try
   if FileExists('F:\ugadai\rez.txt')
   then LoadFromFile('F:\ugadai\rez.txt');

   for i := 0 to memo1.Lines.Count-1 do
   begin
    Add(memo1.Lines.Strings[i]);
   end;
   SaveToFile('F:\ugadai\rez.txt');
  finally
    Free;
   Memo1.Lines.Clear;
  end;

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
   Button2.Enabled := Trim(Edit2.Text) <> '';
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
Button2.Visible := false;
randomize();
Button4.Visible:= false;
end;

end.
