unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, dbf, process, FileUtil, SynHighlighterHTML, SynEdit,
  Forms, Controls, Graphics, Dialogs, DbCtrls, StdCtrls, ExtCtrls, ComCtrls,
  Menus, blcksock, sockets, Synautil,   synaip,   synsock, ftpsend; {Use Synaptic}

const

  {$IFDEF UNIX}
  fsod : Char = '/';
  {$ELSE}
  fsod : Char = '\';
  {$ENDIF}

  DLM_MODULE = '%';

type




  { ServerThread }



  { TForm1 }

  TForm1 = class(TForm)
    btBold: TButton;
    btBuildSite: TButton;
    btHref: TButton;
    btImg: TButton;
    btItalic: TButton;
    btOrderedList: TButton;
    btParagraph: TButton;
    btSub: TButton;
    btSup: TButton;
    btUnderline: TButton;
    btUnorderedList: TButton;
    Buffer: TMemo;
    Button1: TButton;
    btStartServer: TButton;
    btStopServer: TButton;
    btFtpUpdate: TButton;
    cboLocale: TComboBox;
    chkUseModules: TCheckBox;
    Label34: TLabel;
    ZipArchiverPath: TEdit;
    Label26: TLabel;
    PrefferedExtension: TComboBox;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    Datasource3: TDatasource;
    Datasource4: TDatasource;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Dbf1: TDbf;
    Dbf2: TDbf;
    Dbf3: TDbf;
    Dbf4: TDbf;

    edFtpIP: TEdit;
    edFtpPort: TEdit;
    edFtpUsername: TEdit;
    edFtpPassword: TEdit;
    edPreset: TDBLookupComboBox;
    DBLookupListBox1: TDBLookupListBox;
    DBLookupListBox2: TDBLookupListBox;
    DBLookupListBox3: TDBLookupListBox;
    DBLookupListBox4: TDBLookupListBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    dbNav: TDBNavigator;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    fCaption: TDBEdit;
    fContent: TDBMemo;
    fID: TDBEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    mmFtpLog: TMemo;
    PageControl3: TPageControl;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel6: TPanel;
    ServerGuide: TMemo;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    tabUpdateByFTP: TTabSheet;
    tabSpecial: TTabSheet;
    WebServerLog: TMemo;
    Memo3: TMemo;
    AppPages: TPageControl;
    PageControl2: TPageControl;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Process1: TProcess;
    tabPages: TTabSheet;
    tabWebServer: TTabSheet;
    tabCommonSettings: TTabSheet;
    tabHelp: TTabSheet;
    tabGlobalBlocks: TTabSheet;
    tabSections: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    procedure btBoldClick(Sender: TObject);
    procedure btBuildSiteClick(Sender: TObject);
    procedure btFtpUpdateClick(Sender: TObject);
    procedure btItalicClick(Sender: TObject);
    procedure btnSaveRegionsClick(Sender: TObject);
    procedure btOrderedListClick(Sender: TObject);
    procedure btParagraphClick(Sender: TObject);
    procedure btStartServerClick(Sender: TObject);
    procedure btStopServerClick(Sender: TObject);
    procedure btSubClick(Sender: TObject);
    procedure btSupClick(Sender: TObject);
    procedure btUnderlineClick(Sender: TObject);
    procedure btUnorderedListClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btHrefClick(Sender: TObject);
    procedure cboLocaleChange(Sender: TObject);
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure DBLookupListBox2Click(Sender: TObject);
    procedure DBLookupListBox3Click(Sender: TObject);
    procedure DBLookupListBox4Click(Sender: TObject);
    procedure DBMemo2Change(Sender: TObject);
    procedure fContentChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);

    procedure FormCreate(Sender: TObject);
    procedure bodyTplChange(Sender: TObject);
    procedure btImgClick(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
     Titles, Urls, Sections : TMemo;
     SiteSectionUrls, SiteSectionTitles : TMemo;
     ListenerSocket, ConnectionSocket: TTCPBlockSocket;
    procedure initdb();
    function buildHead(title : String; headTemplate : string) : String;
    function buildBody(title : String; body : String; bodyTemplate  : String) : String;
    function useBlocks(part : String) : String;
    procedure scanLinks();
    procedure scanSections();
    function insLinks(body : String) : String;
    function insSections(body : String) : String;
    procedure SiteMapping();
    procedure makePage(title : String; body : String; headTemplate : String;  bodyTemplate : String; filenam : String);
    procedure paired(t : String);
    procedure tagHref();
    procedure tagImg();
    procedure tagList(t : String);
    function moduleexec(cmd : String) : String;
    function useModules(app : String) : String;
    function owntagexec(containter, cmd : String) : String;
    function useOwnTags(app : String) : String;
    function buildItem(itemtpl : String; itemUrl : String; itemTitle : String) : String;
    function buildSection(sectiontpl : String; sectionUrl : String; sectionTitle : String;
      items : String) : String;
    function buildPagination(url : String; currentPage : byte; pagesTotal : Integer) : String;
    procedure AttendConnection(ASocket: TTCPBlockSocket);
    procedure StartOwnServer();
    procedure StopOwnServer();
    function OutputHTMLFile(uri : String) : String;
    function buildOwnFields(html : String) : String;
    function prefExtension(lin : String) : String;
    procedure localeRUS();
    procedure localeENG();

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  initdb();
    Titles := TMemo.Create(Self); // Заголовки
    Urls := TMemo.Create(Self); // URL страниц
    Sections := TMemo.Create(Self); // Разделы страниц

    SiteSectionUrls := TMemo.Create(Self); // URL разделов
    SiteSectionTitles := TMemo.Create(Self); // Заголовки разделов

    edPreset.ItemIndex:=0;

  {$IFDEF UNIX}
  // TODO correct path
  ZipArchiverPath.Text:='/usr/bin/7zip a -r';
  {$ELSE}
  {$ENDIF}
end;



procedure TForm1.bodyTplChange(Sender: TObject);
begin

end;

procedure TForm1.btImgClick(Sender: TObject);
begin
  tagImg();
end;

procedure TForm1.PageControl2Change(Sender: TObject);
begin

end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.Panel5Click(Sender: TObject);
begin

end;



procedure TForm1.btBuildSiteClick(Sender: TObject);
var
  filenam, dir, titl, content, headT, bodyT : String;
begin

  scanLinks();
  scanSections();

  Dbf3.Locate('id', edPreset.Text , []);
  dir:=Dbf3.FieldByName('dirpath').AsString;
  headT := useBlocks(Dbf3.FieldByName('headtpl').AsString);
  bodyT := useBlocks(Dbf3.FieldByName('bodytpl').AsString);
  if SysUtils.DirectoryExists(dir) then
  begin
         Dbf1.First;
                      while not Dbf1.EOF do
                              begin
                              filenam := dir+fsod+dbf1.FieldByName('id').AsString+'.'+PrefferedExtension.Text;
                              titl := dbf1.FieldByName('caption').AsString;
                              content := dbf1.FieldByName('content').AsString;
                              makePage(titl, content, headT, bodyT, filenam);
                                          dbf1.Next;
   end;                           end;
  dbf1.First;
  SiteMapping();
end;

procedure TForm1.btFtpUpdateClick(Sender: TObject);
var
   IP, Port, FileName, LocalFile, Path,  User, Pass : String;
   F : TSearchRec;
   b : Boolean;
   ServerEnabled : boolean;
   FTPClient : TFtpSend;
begin


  ServerEnabled:=false;

  FTPClient:=TFTPSend.Create;
  FTPClient.TargetHost:=edFtpIp.Text;
  FTPClient.TargetPort:=edFtpPort.Text;
  FTPClient.UserName:=edFtpUsername.Text;
  FTPClient.Password:=edFtpPassword.Text;


  btFtpUpdate.enabled:=false;
  IP:=edFtpIP.Text;
  Port:=edFtpPort.Text;
  User:=edFtpUsername.Text;
  Pass:=edFtpPassword.Text;

  Path:=dbf3.FieldByName('dirpath').AsString;

   if FtpClient.Login then
           begin
                ServerEnabled:=true;
                FtpClient.Logout;
           end;

  if ServerEnabled then mmFtpLog.Lines.Add('Подключение установлено')
  else mmFtpLog.Lines.Add('Подключение не установлено');

  if ServerEnabled = true then
          begin
  if FindFirst(Path+fsod+'*.*', faAnyFile, F)=0 then
  begin
   while FindNext(F) = 0 do
         begin
                     Application.ProcessMessages;
           if (F.Name='.') or (F.Name='..') then continue;
           LocalFile := Path+fsod+F.Name;
           FileName := F.Name;

           if FtpClient.Login then
           begin
                mmFtpLog.Lines.Add('Запрос на удаление '+FileName+' с сервера');
                if FtpClient.DeleteFile(FileName) then
                 mmFtpLog.Lines.Add('... успешно удален')
                 else
                 mmFtpLog.Lines.Add('... не удалось удалить');
                FtpClient.Logout;
           end;
           b:=FtpPutFile(IP, Port, FileName, LocalFile, User, Pass);
           if b then
             mmFtpLog.Lines.Add('[+] Файл '+FileName+' выгружен на сервер из '+LocalFile)
           else
             mmFtpLog.Lines.Add('[x] Файл '+FileName+' не удалось выгрузить на сервер из '+LocalFile);
         end;
  end;
  FindClose(F);

  end;
   FtpClient.Free;
   btFtpUpdate.enabled:=true;
  // FtpPutFile(const IP, Port, FileName, LocalFile, User, Pass: string): Boolean;
end;

procedure TForm1.btItalicClick(Sender: TObject);
begin
    paired('i');
end;

procedure TForm1.btnSaveRegionsClick(Sender: TObject);
begin
  end;

procedure TForm1.btOrderedListClick(Sender: TObject);
begin
   tagList('ol');
end;

procedure TForm1.btBoldClick(Sender: TObject);
begin
    paired('b');
end;

procedure TForm1.btParagraphClick(Sender: TObject);
begin
  paired('p');
end;

procedure TForm1.btStartServerClick(Sender: TObject);
begin
  btStartServer.Enabled:=False;
  btStopServer.Enabled:=True;
  StartOwnServer();

end;

procedure TForm1.btStopServerClick(Sender: TObject);
begin

  StopOwnServer();
  btStartServer.Enabled:=true;
  btStopServer.Enabled:=false;
end;

procedure TForm1.btSubClick(Sender: TObject);
begin
    paired('sub');
end;

procedure TForm1.btSupClick(Sender: TObject);
begin
    paired('sup');
end;

procedure TForm1.btUnderlineClick(Sender: TObject);
begin
    paired('u');
end;

procedure TForm1.btUnorderedListClick(Sender: TObject);
begin
  tagList('ul');
end;

procedure TForm1.Button1Click(Sender: TObject);
var dir : String;
begin
  dir:=dbf3.FieldByName('dirpath').AsString;
  Process1.CommandLine:=ziparchiverpath.Text+' '+
  dir+'\site.zip '+dir+fsod+'*.*';
  Process1.Execute;
  Process1.CommandLine:='explorer '+dir;
  Process1.Execute;
end;

procedure TForm1.btHrefClick(Sender: TObject);
begin
  tagHref();
end;

procedure TForm1.cboLocaleChange(Sender: TObject);
begin
  if  cboLocale.itemindex=0 then
      LocaleRUS()
  else
      LocaleENG();
end;

procedure TForm1.DBLookupListBox1Click(Sender: TObject);
begin
  DBLookupListBox1.ListSource.DataSet.Locate(DBLookupListBox1.KeyField,DBLookupListBox1.KeyValue,[]);
end;

procedure TForm1.DBLookupListBox2Click(Sender: TObject);
begin
 DBLookupListBox2.ListSource.DataSet.Locate(DBLookupListBox2.KeyField,DBLookupListBox2.KeyValue,[]);
end;

procedure TForm1.DBLookupListBox3Click(Sender: TObject);
begin
  DBLookupListBox3.ListSource.DataSet.Locate(DBLookupListBox3.KeyField,DBLookupListBox3.KeyValue,[]);
end;

procedure TForm1.DBLookupListBox4Click(Sender: TObject);
begin
  DBLookupListBox4.ListSource.DataSet.Locate(DBLookupListBox4.KeyField,DBLookupListBox4.KeyValue,[]);
end;

procedure TForm1.DBMemo2Change(Sender: TObject);
begin

end;

procedure TForm1.fContentChange(Sender: TObject);
begin

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if ListenerSocket<>NIL then ListenerSocket.Free;
  if ConnectionSocket<>NIL then  ConnectionSocket.Free;
end;

procedure TForm1.initdb;
begin
  // ТАБЛИЦА № 1 - КОНТЕНТ
  Dbf1.TableName:='content.dbf';
  Dbf1.Exclusive:=True;
  Dbf1.Active:=False;
  if not SysUtils.FileExists('content.dbf') then
  begin
   with Dbf1.FieldDefs do
    begin
    Add('id', ftString, 60, True); // ID страницы
    Add('caption', ftString, 255, True); // Заголовок страницы
    Add('content', ftMemo, 16, True); // Контент страницы
    Add('section', ftString, 60, True); // Раздел, к которому относится страница
    Add('uf1', ftString, 60, True); // Доп. поле 1
    Add('uf2', ftString, 60, True); // Доп. поле 2
    Add('uf3', ftString, 60, True); // Доп. поле 3
    Add('uf4', ftString, 60, True); // Доп. поле 4
    Add('uf5', ftString, 60, True); // Доп. поле 5
    Add('uf6', ftString, 60, True); // Доп. поле 6
    Add('uf7', ftMemo, 16, True); // Доп. поле 7
    end;
   Dbf1.CreateTable;
   Dbf1.Active:=true;
   Dbf1.Insert;
   Dbf1.FieldByName('id').AsString:='index';
   Dbf1.FieldByName('caption').AsString:='Hello!';
   Dbf1.FieldByName('content').AsString:='This is my first static page. Here link <<blog>> to section';
   Dbf1.FieldByName('section').AsString:='blog';
   Dbf1.Post;
   Dbf1.Insert;
   Dbf1.FieldByName('id').AsString:='p1';
   Dbf1.FieldByName('caption').AsString:='Second page';
   Dbf1.FieldByName('content').AsString:='This is my second static page. Link to other <<index>> section.';
   Dbf1.FieldByName('section').AsString:='blog';
   Dbf1.Post;
   Dbf1.Insert;
   Dbf1.FieldByName('id').AsString:='p2';
   Dbf1.FieldByName('caption').AsString:='Third page';
   Dbf1.FieldByName('content').AsString:='This is my third static page.';
   Dbf1.FieldByName('section').AsString:='index';
   Dbf1.Post;
  end;
  // ТАБЛИЦА № 2 - ГЛОБАЛЬНЫЕ БЛОКИ
  Dbf2.TableName:='blocks.dbf';
  Dbf2.Exclusive:=True;
  Dbf2.Active:=False;
  if not SysUtils.FileExists('blocks.dbf') then
  begin
   with Dbf2.FieldDefs do
    begin
    Add('id', ftString, 60, True); // ID блока
    Add('markup', ftMemo, 16, True); // Разметка блока
    Add('remark', ftMemo, 16, True); // Примечание к блоку
    Add('regions', ftMemo, 16, True); // Регион, в который надо вывести блок
    end;
   Dbf2.CreateTable;

   Dbf2.CreateTable;
   Dbf2.Active:=true;
   Dbf2.Insert;
   Dbf2.FieldByName('id').AsString:='mainmenu';
   Dbf2.FieldByName('markup').AsString:='<div style="background-color:#e8e8e8"><ul><li>[index]</li><li>[p1]</li></ul></div>';
   Dbf2.FieldByName('remark').AsString:='Меню';
   Dbf2.Post;

  end;
  // ТАБЛИЦА № 3 - ПРЕСЕТЫ (НАСТРОЙКИ И ШАБЛОНЫ)
  Dbf3.TableName:='presets.dbf';
  Dbf3.Exclusive:=True;
  Dbf3.Active:=False;
  if not SysUtils.FileExists('presets.dbf') then
  begin
   with Dbf3.FieldDefs do
    begin
    Add('id', ftString, 60, True); // ID пресета
    Add('sitename', ftString, 60, True); // Название сайта
    Add('dirpath', ftString, 60, True); // Путь к папке в результатами
    Add('headtpl', ftMemo, 16, True); // Заголовочная часть шаблона
    Add('bodytpl', ftMemo, 16, True); // Основная часть шаблона
    Add('sectiontpl', ftMemo, 16, True); // Раздела обрамление
    Add('itemtpl', ftMemo, 16, True); // Оформление списка
    Add('ufn1', ftString, 60, True); // Название доп. поля 1
    Add('ufn2', ftString, 60, True); // Название доп. поля 2
    Add('ufn3', ftString, 60, True); // Название доп. поля 3
    Add('ufn4', ftString, 60, True); // Название доп. поля 4
    Add('ufn5', ftString, 60, True); // Название доп. поля 5
    Add('ufn6', ftString, 60, True); // Название доп. поля 6
    Add('ufn7', ftString, 60, True); // Название доп. поля 7
    end;
   Dbf3.CreateTable;
   Dbf3.Active:=true;
   Dbf3.Insert;
   Dbf3.FieldByName('id').AsString:='basis';
   Dbf3.FieldByName('sitename').AsString:='My Site';
   // path on linux

  {$IFDEF UNIX}
 Dbf3.FieldByName('dirpath').AsString:=expandfilename('~/MySite');
  {$ELSE}
 Dbf3.FieldByName('dirpath').AsString:='C:\MySite';
  {$ENDIF}
   Dbf3.FieldByName('headtpl').AsString:='<meta charset="utf-8"><title>{sitename}-{title}</title>';
   Dbf3.FieldByName('bodytpl').AsString:='{mainmenu}<h1>{title}</h1><p>{content}</p>';
   Dbf3.FieldByName('sectiontpl').AsString:='{mainmenu}<h1>Тема: {sectionTitle}</h1> Материалы :<ul>{items}</ul>';
   Dbf3.FieldByName('itemtpl').AsString:='<li><a href="{itemUrl}.htm">{itemTitle}</a></li>';
   Dbf3.FieldByName('ufn1').AsString:='UserField1';
   Dbf3.FieldByName('ufn2').AsString:='UserField2';
   Dbf3.FieldByName('ufn3').AsString:='UserField3';
   Dbf3.FieldByName('ufn4').AsString:='UserField4';
   Dbf3.FieldByName('ufn5').AsString:='UserField5';
   Dbf3.FieldByName('ufn6').AsString:='UserField6';
   Dbf3.FieldByName('ufn7').AsString:='UserField7';
   Dbf3.Post;
  end;

    // ТАБЛИЦА № 4 - РАЗДЕЛЫ САЙТА
  Dbf4.TableName:='sections.dbf';
  Dbf4.Exclusive:=True;
  Dbf4.Active:=False;
  if not SysUtils.FileExists('sections.dbf') then
  begin
   with Dbf4.FieldDefs do
    begin
    Add('id', ftString, 60, True); // ID пресета
    Add('section', ftString, 60, True); // Название сайта
    Add('preset', ftString, 60, True); // Путь к папке в результатами
    Add('note', ftMemo, 16, True); // Заголовочная часть шаблона
    end;
   Dbf4.CreateTable;
   Dbf4.Active:=true;
   Dbf4.Insert;
   Dbf4.FieldByName('id').AsString:='blog';
   Dbf4.FieldByName('section').AsString:='Блог';
   Dbf4.FieldByName('preset').AsString:='basis';
   Dbf4.FieldByName('note').AsString:='Мой блог';
   Dbf4.Post;
   Dbf4.Insert;
   Dbf4.FieldByName('id').AsString:='index';
   Dbf4.FieldByName('section').AsString:='Прочее';
   Dbf4.FieldByName('preset').AsString:='basis';
   Dbf4.FieldByName('note').AsString:='Мой блог';
   Dbf4.Post;
  end;





  Dbf1.Active:=true;
  Dbf2.Active:=true;
  Dbf3.Active:=true;
  Dbf4.Active:=true;

end;

function TForm1.buildHead(title: String; headTemplate: string) : String;
var r : String;
begin
  r := headTemplate;
  r:=StringReplace(r, '{title}', title, [rfReplaceAll]);
  r:=StringReplace(r, '{sitename}', Dbf3.FieldByName('sitename').AsString, [rfReplaceAll]);
  Result:=r;
end;

function TForm1.buildBody(title : String; body : String; bodyTemplate  : String)  : String;
var r : String;
begin
 r:=bodyTemplate;
 r:=StringReplace(r, '{title}', title, [rfReplaceAll]);
 r:=StringReplace(r, '{content}', body, [rfReplaceAll]);
 r:=StringReplace(r, '{sitename}', Dbf3.FieldByName('sitename').AsString, [rfReplaceAll]);
 Result:=R;
end;


function TForm1.useBlocks(part: String): String;
var r : String;
begin
  r := part;
  dbf2.First;
  while not dbf2.EOF do begin
        r:=StringReplace(r, '{'+dbf2.FieldByName('id').AsString+'}', dbf2.FieldByName('markup').AsString, [rfReplaceAll]);
        dbf2.Next;
  end;
  dbf2.First;
  Result:=r;
end;

procedure TForm1.scanLinks;
begin

  Titles.Clear;
  Urls.Clear;
  Sections.Clear;
  dbf1.First;
  while not dbf1.eof do begin
           Titles.Lines.Add(dbf1.FieldByName('caption').AsString);
           Urls.Lines.Add(dbf1.FieldByName('id').AsString);
           Sections.Lines.Add(dbf1.FieldByName('section').AsString);
           dbf1.Next;
  end;
dbf1.First;
end;

procedure TForm1.scanSections;
begin
  SiteSectionUrls.Clear;
  SiteSectionTitles.Clear;
  dbf4.First;
  while not dbf4.eof do begin
           SiteSectionTitles.Lines.Add(dbf4.FieldByName('section').AsString);
           SiteSectionUrls.Lines.Add(dbf4.FieldByName('id').AsString);
           dbf4.Next;
  end;
dbf4.First;
end;

function TForm1.insLinks(body: String): String;
var r : String; i : Integer;
begin
  r := body;
  i:=0;
  while i<Urls.Lines.Count do
                           begin
                                    r:=StringReplace(r, '['+Urls.Lines[i]+']',
                                    '<a href="'+Urls.Lines[i]+'.'+PrefferedExtension.Text+'">'+Titles.Lines[i]+'</a>', [rfReplaceAll]);
                                    inc(i);
                           end;
  Result:=r;
end;

function TForm1.insSections(body: String): String;
var r : String; i : Integer;
begin
  r := body;
  i:=0;
  while i<SiteSectionUrls.Lines.Count do
                           begin
                                    r:=StringReplace(r, '<<'+SiteSectionUrls.Lines[i]+'>>',
                                    '<a href="section_'+SiteSectionUrls.Lines[i]+'.'+PrefferedExtension.text+'">'+SiteSectionTitles.Lines[i]+'</a>', [rfReplaceAll]);
                                    inc(i);
                           end;
  Result:=r;
end;

procedure TForm1.SiteMapping;
var i, j : integer; dir : String;  filenam : String; body : String;
  bodyTemplate, headTemplate, itemTpl, sectionTpl : String;
  stub : String;
  pagesTotal : integer;
  pageCurrent : integer;
  itemsPerPage : integer;
  itemsOnPage : integer;
  page : integer;
  b : String;
  items : Integer;
  paginator : String;
  pages : array[byte] of String;
  itemTxt : String;
  itemsTotal : byte;
begin
  itemsPerPage := 7;
  dir:=dbf3.FieldByName('dirpath').AsString;
  bodyTemplate:= '{content}';
  headTemplate:=dbf3.FieldByName('headtpl').AsString;
  itemTpl := dbf3.FieldByName('itemtpl').AsString;
  sectionTpl := dbf3.FieldByName('sectionTpl').AsString;
  i:=0;
  while i<SiteSectionUrls.Lines.Count do
                           begin
                           {Подсчет страниц в разделе}
                           pagesTotal := 1;
                           pageCurrent := 1;
                           itemsOnPage := 0;
                           itemsTotal :=0;
                           Buffer.Clear;
                                              j:=0;
                           while j<Sections.Lines.Count do begin
                                    if Sections.lines[j] = SiteSectionUrls.lines[i] then
                                       begin
                                           inc(itemsOnPage);
                                           inc(itemsTotal);
                                           itemTxt:= buildItem(itemtpl, Urls.Lines[j], Titles.Lines[j]);
                                           Buffer.Lines.Add(itemTxt);
                                            if itemsOnPage<=itemsPerPage then
                                               pages[pageCurrent]:=buffer.text
                                               else begin
                                               inc(pageCurrent);
                                               buffer.Clear;
                                               buffer.Lines.Add(itemTxt);
                                               pages[pageCurrent]:=buffer.text;
                                               inc(pagesTotal);
                                               itemsOnPage:=1;
                                               end;
                                       end;
                   j:=j+1;
                                                      end; {/while}



  for page:=1 to pagesTotal do begin
  Buffer.Clear;
  buffer.lines.add(pages[page]);
  buffer.lines.add(buildPagination(SiteSectionUrls.Lines[i], page, pagesTotal));
//  stub:=InputBox('A', 'A', buildPagination(SiteSectionUrls.Lines[i], page, pagesTotal));
  if page=1 then
  filenam := dir + fsod+'section_'+SiteSectionUrls.Lines[i]+'.'+PrefferedExtension.text
  else
   filenam := dir +fsod+'section_'+SiteSectionUrls.Lines[i]+'_'+IntToStr(page)+'.'+PrefferedExtension.text;
  body:=insSections(insLinks(buildSection(sectionTpl, SiteSectionUrls.lines[i], SiteSectionTitles.Lines[i], buffer.Text)));
//  stub:=InputBox('B', 'B', body);
  makePage(SiteSectionTitles.Lines[i], body, headTemplate, bodyTemplate, filenam);
                   end; {/for}


              i:=i+1;
                                       end;

end;

procedure TForm1.makePage(title: String; body: String; headTemplate: String;
  bodyTemplate: String; filenam : String);
begin
    if FileExists(filenam) then DeleteFile(filenam);
    Buffer.Clear;
    Buffer.Lines.Add('<!DOCTYPE html>');
    Buffer.Lines.Add('<html><head>');
                              Buffer.Lines.Add(
                              useOwnTags(useModules(useBlocks(buildHead(title, headTemplate)))));
                              Buffer.Lines.Add('</head><body>');
                              Buffer.Lines.Add(buildOwnFields(useOwnTags(useModules(insSections(insLinks(useBlocks(buildBody(title, body, bodyTemplate))))))));
                              Buffer.Lines.Add('</body></html>');
                              Buffer.Lines.SaveToFile(filenam);
end;

procedure TForm1.paired(t : String);
begin
  if (fContent.SelText <> '') then
  fContent.SelText:='<'+t+'>'+  fContent.SelText+'</'+t+'>'
  else
    fContent.Lines.Add('<'+t+'></'+t+'>');
end;

procedure TForm1.tagHref;
begin
  fContent.Lines.Add('<a href=""></a>');
end;

procedure TForm1.tagImg;
begin
fContent.Lines.Add('<img src="" />');
end;

procedure TForm1.tagList(t: String);
begin
 fContent.Lines.Add('<'+t+'>');
 fContent.Lines.Add('<li>Элемент списка 1</li>');
 fContent.Lines.Add('<li>Элемент списка 2</li>');
 fContent.Lines.Add('</'+t+'>');
end;

function TForm1.moduleexec(cmd: String): String;
var P : TProcess;
  R : String;
  M : TMemo;
  filenam : String;
begin
 P:=TProcess.Create(Self);
 M:=TMemo.Create(Self);
 P.CommandLine:=cmd;
 P.Execute;
 while P.Active do;
 filenam := Copy(cmd, 1, Pos(' ', cmd)-1) + '.tmp';
 R:='';
 if FileExists(filenam) then
  begin
   M.Lines.LoadFromFile(filenam);
   R:=M.Text;
   DeleteFile(filenam);
  end;
 P.Free;
 M.Free;
 Result:=R;
end;

function TForm1.useModules(app: String): String;
var C, Start, En_d : integer;
  replacement : String;
  R : String;
begin

 R:=app;
 if chkUseModules.Checked then begin
  C:=0;
  Start := -1;
  En_d := -1;
  while C<Length(r) do
                           begin
                           if Copy(r, C, 1) = DLM_MODULE then
                              begin
                                if Start<0 then Start:=C else
                                  begin
                                   En_d :=C;
                                   replacement:=moduleexec(Copy(r, Start+1, En_d-Start-1));
                                   r:=StringReplace(r, Copy(r, Start, En_d-Start+1),
                                   replacement, [rfReplaceAll]);
                                   c:=Start+Length(replacement)-1;
                                   Start:=-1;
                                   En_d := -1;
                                  end;
                              end;
                           C:=C+1;
                           end;
 end; // else will be not processed
 Result:=R;
end;

function TForm1.owntagexec(containter, cmd: String): String;
var M : TMemo;
  P : TProcess;
  R : String;
begin
  M:=TMemo.Create(Self);
  M.Clear;
  M.Text:=containter;
  M.Lines.SaveToFile(cmd+'.inp');
  P:=TProcess.Create(Self);
  P.CommandLine:=cmd;
  P.Execute;
  while P.Active do;
  R:='';
  if FileExists(cmd+'.out') then
     begin
          M.Clear;
          M.Lines.LoadFromFile(cmd+'.out');
          R:=M.Text;
     end;
 if FileExists(cmd+'.inp') then DeleteFile(cmd+'.inp');
 if FileExists(cmd+'.out') then DeleteFile(cmd+'.out');
 M.Free;
 Result:=R;
end;

function TForm1.useOwnTags(app: String): String;
var
   C, Start, En_d, Q : Integer;
   R : String;
   pattern : String;
   containter : String;
   replacement : String;
   stub : String;
   epattern : String;
   remstr : String;
   z : Integer;
begin
  r:=app;
  c:=0;
  Start:=-1;
  En_d:=-1;
  Q:=-1;
  while (C<Length(r)) do
                            begin
                            if Copy(r, c, 1)  = '~' then
                               begin
                                    if Start<0 then
                                        Start:=C
                                    else
                                        begin
                                        En_d:=C;
                                        pattern:=Copy(r, start+1, en_d-start-1);
                                       // Stub := InputBox('Debug', 'pattern=', pattern);
                                        epattern:='~/'+pattern+'~';
                                        Q:=Pos(epattern, r);
                                        containter:=Copy(r, en_d+1, q-en_d-1);
// Stub := InputBox('Parameter', 'containter=', containter);
                                        replacement:=owntagexec(containter, pattern);
                                        //Stub := InputBox('replacement', 'result=', replacement);
                                        z:=q+Length(epattern)-1;
                                        remstr :=  Copy(r, Start, Z-Start+1);
                                        //  Stub := InputBox('RemStr', 'RemStr=', remstr);
                                        r:=StringReplace(r, remstr, replacement, [rfReplaceAll]);
                                      // Stub := InputBox('Out', 'Out=', r);
                                        //Stub := InputBox('C', 'C=', String(C));
                                      C:=Start+Length(replacement)-1;
                                        Start:=-1;
                                        En_d:=-1;
                                        Q:=-1;
                                        end;
                               end;
                            c:=c+1;
                            end;
 Result:=R;
end;

function TForm1.buildItem(itemtpl: String; itemUrl: String; itemTitle: String
  ): String;
var r : String;
begin
 r:=itemTpl;
 r:=StringReplace(r, '{itemUrl}', itemUrl, [rfReplaceAll]);
 r:=StringReplace(r, '{itemTitle}', itemTitle, [rfReplaceAll]);
 r:=insSections(insLinks(r));
 r:=prefExtension(r);
 Result:=R;
end;

function TForm1.buildSection(sectiontpl: String; sectionUrl: String;
  sectionTitle: String; items: String): String;
var r : String;
begin
 r:=sectionTpl;
 r:=StringReplace(r, '{sectionUrl}', sectionUrl, [rfReplaceAll]);
 r:=StringReplace(r, '{sectionTitle}', sectionTitle, [rfReplaceAll]);
 r:=StringReplace(r, '{items}', items, [rfReplaceAll]);
 r:=insSections(insLinks(r));
 Result:=R;
end;

function TForm1.buildPagination(url : String; currentPage: byte; pagesTotal: Integer): String;
var paginator : String; page : byte;

begin
       paginator:='<div class="paginator">';

                     for page:=1 to pagesTotal do
                      if currentPage<>page then
                      begin
                  if page=1 then
                    paginator:=paginator+'<a href="section_'+url+'.'+PrefferedExtension.text+'">1</a> '
                  else
                    paginator:=paginator+'<a href="section_'+url+'_'+IntToStr(page)+'.'+PrefferedExtension.text+'">'+IntToStr(page)+'</a> ';
                     end
                     else paginator:=paginator+' '+IntToStr(currentPage)+' ';
                     {/for}
                     paginator := paginator + '</div>'  ;
     Result:=paginator;
end;

procedure TForm1.AttendConnection(ASocket: TTCPBlockSocket);
var
  timeout: integer;
  s: string;
  method, uri, protocol: string;
  OutputDataString: string;
  ResultCode: integer;
  content_type : String;
begin
  timeout := 120000;
  Application.ProcessMessages;
//  WebServerLog.Lines.Add('Полученные заголовки, запрошенный браузером документ:');

  //read request line
  s := ASocket.RecvString(timeout);
 WebServerLog.Lines.Add(s);
  method := fetch(s, ' ');
  uri := fetch(s, ' ');
  protocol := fetch(s, ' ');

  //read request headers
  repeat

    s := ASocket.RecvString(Timeout);
    WebServerLog.Lines.Add(s);
    Application.ProcessMessages;
  until s = '';

  // Now write the document to the output stream

  content_type := 'Text/Html';
  if  (pos('.css', uri) > 0) then content_type := 'text/css';
  if  (pos('.jpg', uri) > 0) then content_type := 'image/jpeg';

  if ( (pos('.jpg', uri) > 0) or (pos('.css', uri) > 0) or (pos('.htm', uri) > 0) or (uri='/')) then
  begin
    // Write the output document to the stream
    OutputDataString := OutputHTMLFile(uri)  + CRLF;
    // Write the headers back to the client
    ASocket.SendString('HTTP/1.0 200' + CRLF);
    ASocket.SendString('Content-type: '+content_type + CRLF);
    ASocket.SendString('Content-length: ' + IntTostr(Length(OutputDataString)) + CRLF);
    ASocket.SendString('Connection: close' + CRLF);
    ASocket.SendString('Date: ' + Rfc822DateTime(now) + CRLF);
    ASocket.SendString('Server: HtmlBuilder' + CRLF);
    ASocket.SendString('' + CRLF);

  //  if ASocket.lasterror <> 0 then HandleError;

    // Write the document back to the browser
    ASocket.SendString(OutputDataString);
  end
  else
    ASocket.SendString('HTTP/1.0 404' + CRLF);
end;

procedure TForm1.StartOwnServer;
begin
  ListenerSocket := TTCPBlockSocket.Create;
  ConnectionSocket := TTCPBlockSocket.Create;

  ListenerSocket.CreateSocket;
  ListenerSocket.setLinger(true,10);
  ListenerSocket.bind('0.0.0.0','80');
  ListenerSocket.listen;

  repeat
    Application.ProcessMessages;
    if ListenerSocket.canread(512) then
    begin
      ConnectionSocket.Socket := ListenerSocket.accept;
      WebServerLog.Lines.Add('Выполняем подключение. Код ошибки (0=Успех): ' + IntToStr(ConnectionSocket.lasterror));
      AttendConnection(ConnectionSocket);
    end;
  until  ListenerSocket.StopFlag or ConnectionSocket.StopFlag;
  ListenerSocket.Free;
  ConnectionSocket.Free;
end;

procedure TForm1.StopOwnServer;
begin
 ListenerSocket.AbortSocket;
 ConnectionSocket.AbortSocket;

end;

function TForm1.OutputHTMLFile(uri: String): String;
var path : String; filename : String; Buf : TMemo;
  r : String;
begin
  if uri = '/' then uri:='/index.'+PrefferedExtension.text;
  path := dbf3.FieldByName('dirpath').AsString;
  Buf:=TMemo.Create(Self);
  Buf.Lines.LoadFromFile(path+uri);
  r:=Buf.Text;
  Buf.Free;
  result:=r;
end;

function TForm1.buildOwnFields(html: String): String;
var r : String; i : byte; t : String;
begin
   r:=html;
   for i:=1 to 7 do begin
      t:=IntToStr(i);
      r:=StringReplace(r, '{f'+t+'}', Dbf3.FieldByName('ufn'+t).AsString, [rfReplaceAll]);
      r:=StringReplace(r, '{v'+t+'}', Dbf1.FieldByName('uf'+t).AsString, [rfReplaceAll]);
   end;
   Result:=r;
end;

function TForm1.prefExtension(lin: String): String;
var r : String;
begin
  r:=lin;
  r:=StringReplace(r, '$$ext', PrefferedExtension.Text,[rfReplaceAll]);
  Result:=r;
end;

procedure TForm1.localeRUS;
begin
  {НАЧАЛО ЛОКАЛИЗАЦИИ}
  {НАЗВАНИЕ ОКНА ПРОГРАММЫ}
  form1.Caption:='Генератор статических HTML сайтов';
  {ЗАГОЛОВКИ ВКЛАДОК}
  tabPages.Caption:='Страницы';
  tabSections.Caption:='Разделы';
  tabGlobalBlocks.Caption:='Глобальные блоки';
  tabSpecial.Caption:='Специальное';
  tabUpdateByFTP.Caption:='Обновление по FTP';
  tabWebServer.Caption:='Веб-сервер';
  tabHelp.Caption:='О программе';
end;

procedure TForm1.localeENG;
begin
  {START ENG LOCALE}
  Form1.Caption:='Generator of static HTML websites';
  {TAB HEADERS}
  tabPages.Caption:='Pages';
  tabSections.Caption:='Sections';
  tabGlobalBlocks.Caption:='Global blocks';
  tabSpecial.Caption:='Special';
  tabUpdateByFTP.Caption:='Update By FTP';
  tabWebServer.Caption:='Web Server';
  tabHelp.Caption:='About app';
end;

end.

