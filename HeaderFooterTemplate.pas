unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  THeaderFooterForm = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    Panel1: TPanel;
    BackGround: TImage;
    Label1: TLabel;
    NÃO: TButton;
    SIM: TButton;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SIMClick(Sender: TObject);
    procedure NÃOClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   SimR : integer = 0;      {Resultado dos click em Sim}
   NaoR : integer = 0;      {Resultado dos click em Não}
   Pergunta : integer = 0;   {Total de perguntas}
  HeaderFooterForm: THeaderFooterForm;    {Tela inicial do jogo}

    procedure StartGame;    {Inicia a verificação do resultado das respostas}
     procedure CheckResult;   {Ferificar se o valor da resposta é igual ou menor que 0 ou >= 7}
implementation

{$R *.fmx}


       {Tela inicial do jogo / pergunta start game}
procedure THeaderFooterForm.FormCreate(Sender: TObject);
begin
  Label1.text := 'Bem vind@, deseja iniciar o jogo?';
end;

procedure THeaderFooterForm.SIMClick(Sender: TObject);
begin
  if (NaoR =7) then
          NaoR := NaoR-1
          else

       SimR :=  SimR+1;     {Ao clicar em SIM soma +1 ao valor total}
          Pergunta := Pergunta+1;   {Ao clicar em SIM passa para a proxima pergunta}


end;

procedure THeaderFooterForm.Timer1Timer(Sender: TObject);
begin
StartGame;  {Inicia a Thread de verificação dos resultados do jogo}
CheckResult;
end;

procedure THeaderFooterForm.NÃOClick(Sender: TObject);
begin
       NaoR :=  NaoR+1;   {Ao Clicar em NÃO soma +1 ao valor total de clicks em "não"}
          Pergunta := Pergunta-1;   {Reduz o valor de respostas positivas}

          if (SimR =7) then
          begin
          SimR := SimR-1;
          end;
end;

procedure CheckResult;
    begin
      if (Pergunta <= 0 ) then {Se o total de  pergunta for igual ou menor que 0}
      Pergunta := 0 ;           {Preenche o resultado das pergunta percorridas com 0}

      if (Pergunta >=7 ) then  {Se o total de perguntas for maior ou igual a 7}
      Pergunta:=7    ;          {Preenche o resultado das pergunta percorridas com valor 7}


      if (SimR <= 0 ) then {Se o total de  pergunta for igual ou menor que 0}
      SimR := 0 ;           {Preenche o resultado das pergunta percorridas com 0}

      if (SimR >=7 ) then  {Se o total de perguntas for maior ou igual a 7}
      SimR:=7 ;             {Preenche o resultado das pergunta percorridas com valor 7}


      if (NaoR >=7 ) then  {Se o total de perguntas for maior ou igual a 7}
      NaoR:=7 ;             {Preenche o resultado das pergunta percorridas com valor 7}

      if (NaoR <= 0 ) then {Se o total de  pergunta for igual ou menor que 0}
      NaoR := 0 ;           {Preenche o resultado das pergunta percorridas com 0}

    end;



procedure StartGame; {Inicia a Thread de verificação dos resultados do jogo}  {Passando de niveis}
var
PerguntaStg : String;
Nao : String;
Sim : String;
begin
    Perguntastg :=(IntToStr(pergunta));
    nao  :=(IntToStr(NaoR));
    sim  :=(IntToStr(SimR));

     HeaderFooterForm.label2.text := perguntastg;
     HeaderFooterForm.label3.text := Sim;
     HeaderFooterForm.label4.text := Nao;

  if (pergunta = 1) then
  begin
   HeaderFooterForm.label1.text := 'Primeira Pergunta: Você gosta de FestFood ?' ;

  end;

  if (pergunta = 2) then
  begin
   HeaderFooterForm.label1.text := 'Segunda Pergunta: Ingere 1,5 litro de agua por dia?' ;
  end;


  if (pergunta = 3) then
  begin
   HeaderFooterForm.label1.text := 'Terceira Pergunta: Correr ou cervejinha?';
  end;

  if (pergunta = 4) then
  begin
   HeaderFooterForm.label1.text := 'Quarta Pergunta: Carne frita ou ensopada?'   ;
  end;

  if (pergunta = 5) then
  begin
   HeaderFooterForm.label1.text := 'Quinta Pergunta: Dia de Sol, Cama ou Atividade fisica?';
  end;

  if (pergunta = 6) then
  begin
   HeaderFooterForm.label1.text := 'Sexta Pergunta: aaaa' ;
  end;

  if (pergunta = 7) then
  begin
   HeaderFooterForm.label1.text := 'Setima Pergunta: bbbb'  ;
  end;



end;

end.
