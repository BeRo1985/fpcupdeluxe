unit extrasettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, StdCtrls, Buttons, ExtCtrls, Dialogs,
  installerCore;

Const
  DELUXEKEY='fpcupdeluxeishereforyou';

type
  TCrossSetting = (fpcup,auto,custom);

  TCrossUtil = record
    CPU:string;
    OS:string;
    Setting:TCrossSetting;
    LibDir:string;
    BinDir:string;
    CrossBuildOptions:string;
    CrossSubArch:string;
    Compiler:string;
  end;

  TCrossUtils = array[TCPU,TOS] of TCrossUtil;

  TString = class(TObject)
  private
    fStr: String;
  public
    constructor Create(const AStr: String) ;
    property Str: String read FStr write FStr;
  end;

  { TForm2 }
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnSelectLibDir: TButton;
    btnSelectBinDir: TButton;
    btnAddFPCPatch: TButton;
    btnRemFPCPatch: TButton;
    btnAddLazPatch: TButton;
    btnRemLazPatch: TButton;
    btnSelectCompiler: TButton;
    btnListCustomOptions: TButton;
    CheckAutoSwitchURL: TCheckBox;
    CheckForceLocalRepoClient: TCheckBox;
    CheckSendInfo: TCheckBox;
    CheckIncludeHelp: TCheckBox;
    CheckSplitFPC: TCheckBox;
    CheckIncludeLCL: TCheckBox;
    CheckSplitLazarus: TCheckBox;
    CheckUseWget: TCheckBox;
    CheckUpdateOnly: TCheckBox;
    CheckRepo: TCheckBox;
    CheckPackageRepo: TCheckBox;
    CheckUseMakeJobs: TCheckBox;
    CheckExtraVerbose: TCheckBox;
    CheckFpcupBootstrappersOnly: TCheckBox;
    ComboBoxOS: TComboBox;
    ComboBoxCPU: TComboBox;
    EditCrossBuildOptions: TEdit;
    EditCrossSubArch: TEdit;
    EditFPCBranch: TEdit;
    EditFPCOptions: TEdit;
    EditFPCRevision: TEdit;
    EditLazarusBranch: TEdit;
    EditLazarusOptions: TEdit;
    EditLazarusRevision: TEdit;
    EditLibLocation: TEdit;
    EditBinLocation: TEdit;
    EditCompilerOverride: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    EditHTTPProxyHost: TEdit;
    EditHTTPProxyPort: TEdit;
    EditHTTPProxyUser: TEdit;
    EditHTTPProxyPassword: TEdit;
    GroupBoxCompileOptions: TGroupBox;
    GroupBoxFPCLazBranchRevision: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelCrossBuildOptions: TLabel;
    LabelCrossSubArch: TLabel;
    LabelCompilerOverride: TLabel;
    LabelFPCbranch: TLabel;
    LabelFPCOptions: TLabel;
    LabelFPCRevision: TLabel;
    LabelLazarusbranch: TLabel;
    LabelLazarusOptions: TLabel;
    LabelLazarusRevision: TLabel;
    ListBoxFPCPatch: TListBox;
    ListBoxLazPatch: TListBox;
    OpenDialog1: TOpenDialog;
    ButtonPanel: TPanel;
    RadioGroup3: TRadioGroup;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure btnAddPatchClick(Sender: TObject);
    procedure btnRemPatchClick(Sender: TObject);
    procedure btnSelectFile(Sender: TObject);
    procedure btnListCustomOptionsClick(Sender: TObject);
    procedure ComboBoxCPUOSChange(Sender: TObject);
    procedure EditDblClickDelete(Sender: TObject);
    procedure EditCrossBuildOptionsChange(Sender: TObject);
    procedure EditCrossSubArchChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnDirectorySelect(Sender: TObject);
    procedure RadioGroup3SelectionChanged(Sender: TObject);
  private
    FCrossUtils:TCrossUtils;
    FInstallPath:string;

    function  GetPatches(const Lazarus:boolean=false):string;
    procedure SetPatches(value:string;const Lazarus:boolean=false);

    function GetRepo:boolean;
    function GetPackageRepo:boolean;
    function GetUpdateOnly:boolean;
    function GetIncludeLCL:boolean;
    function GetIncludeHelp:boolean;

    function GetSplitFPC:boolean;
    procedure SetSplitFPC(value:boolean);
    function GetSplitLazarus:boolean;
    procedure SetSplitLazarus(value:boolean);

    function GetUseWget:boolean;
    procedure SetUseWget(value:boolean);

    function GetMakeJobs:boolean;
    procedure SetMakeJobs(value:boolean);

    function GetExtraVerbose:boolean;
    procedure SetExtraVerbose(value:boolean);

    function GetAutoSwitchURL:boolean;
    procedure SetAutoSwitchURL(value:boolean);

    function GetSendInfo:boolean;
    procedure SetSendInfo(value:boolean);

    function GetFpcupBootstrappersOnly:boolean;
    procedure SetFpcupBootstrappersOnly(value:boolean);

    function GetForceLocalRepoClient:boolean;
    procedure SetForceLocalRepoClient(value:boolean);

    function GetHTTPProxyHost:string;
    function GetHTTPProxyPort:integer;
    function GetHTTPProxyUser:string;
    function GetHTTPProxyPass:string;
    function GetFPCOptions:string;
    procedure SetFPCOptions(value:string);
    function GetLazarusOptions:string;
    procedure SetLazarusOptions(value:string);
    function GetFPCRevision:string;
    procedure SetFPCRevision(value:string);
    function GetLazarusRevision:string;
    procedure SetLazarusRevision(value:string);
    function GetFPCBranch:string;
    procedure SetFPCBranch(value:string);
    function GetLazarusBranch:string;
    procedure SetLazarusBranch(value:string);

    function GetFPCPatches:string;
    procedure SetFPCPatches(value:string);
    function GetLazPatches:string;
    procedure SetLazPatches(value:string);

    function GetCPUFromComboBox:TCPU;
    function GetOSFromComboBox:TOS;

    property CPUFromComboBox:TCPU read GetCPUFromComboBox;
    property OSFromComboBox:TOS read GetOSFromComboBox;
  public
    procedure SetInstallDir(const aInstallDir:string='');

    function GetLibraryDirectory(aCPU,aOS:string):string;
    function GetToolsDirectory(aCPU,aOS:string):string;
    function GetCrossBuildOptions(aCPU,aOS:string):string;
    function GetCrossSubArch(aCPU,aOS:string):string;
    function GetCompiler(aCPU, aOS: string): string;


    property Repo:boolean read GetRepo;
    property PackageRepo:boolean read GetPackageRepo;

    property UpdateOnly:boolean read GetUpdateOnly;

    property IncludeLCL:boolean read GetIncludeLCL;
    property IncludeHelp:boolean read GetIncludeHelp;

    property SplitFPC:boolean read GetSplitFPC write SetSplitFPC;
    property SplitLazarus:boolean read GetSplitLazarus write SetSplitLazarus;

    property UseWget:boolean read GetUseWget write SetUseWget;
    property MakeJobs:boolean read GetMakeJobs write SetMakeJobs;
    property ExtraVerbose:boolean read GetExtraVerbose write SetExtraVerbose;
    property AutoSwitchURL:boolean read GetAutoSwitchURL write SetAutoSwitchURL;
    property SendInfo:boolean read GetSendInfo write SetSendInfo;
    property FpcupBootstrappersOnly:boolean read GetFpcupBootstrappersOnly write SetFpcupBootstrappersOnly;
    property ForceLocalRepoClient:boolean read GetForceLocalRepoClient write SetForceLocalRepoClient;

    property HTTPProxyHost:string read GetHTTPProxyHost;
    property HTTPProxyPort:integer read GetHTTPProxyPort;
    property HTTPProxyUser:string read GetHTTPProxyUser;
    property HTTPProxyPass:string read GetHTTPProxyPass;

    property FPCOptions:string read GetFPCOptions write SetFPCOptions;
    property LazarusOptions:string read GetLazarusOptions write SetLazarusOptions;
    property FPCRevision:string read GetFPCRevision write SetFPCRevision;
    property LazarusRevision:string read GetLazarusRevision write SetLazarusRevision;
    property FPCBranch:string read GetFPCBranch write SetFPCBranch;
    property LazarusBranch:string read GetLazarusBranch write SetLazarusBranch;

    property FPCPatches:string read GetFPCPatches write SetFPCPatches;
    property LazPatches:string read GetLazPatches write SetLazPatches;
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

uses
  infounit,
  DCPDES,
  //DCPrc4,
  DCPsha256,
  fpcuputil,
  installerUniversal,
  IniFiles;

{ TForm2 }

constructor TString.Create(const AStr: String) ;
begin
  inherited Create;
  FStr := AStr;
end;

procedure TForm2.OnDirectorySelect(Sender: TObject);
var
  xCPUOS:TCPUOS;
begin
  if Sender=btnSelectLibDir then SelectDirectoryDialog1.InitialDir:=EditLibLocation.Text;
  if Sender=btnSelectBinDir then SelectDirectoryDialog1.InitialDir:=EditBinLocation.Text;
  if SelectDirectoryDialog1.Execute then
  begin
    if Sender=btnSelectLibDir then EditLibLocation.Text:=SelectDirectoryDialog1.FileName;
    if Sender=btnSelectBinDir then EditBinLocation.Text:=SelectDirectoryDialog1.FileName;
  end;
  if (ComboBoxOS.ItemIndex<>-1) AND (ComboBoxCPU.ItemIndex<>-1) then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    if Sender=btnSelectLibDir then
       FCrossUtils[xCPUOS.CPU,xCPUOS.OS].LibDir:=SelectDirectoryDialog1.FileName;
    if Sender=btnSelectBinDir then
       FCrossUtils[xCPUOS.CPU,xCPUOS.OS].BinDir:=SelectDirectoryDialog1.FileName;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  CPU:TCPU;
  OS:TOS;
  s:string;
  SortedList: TStringList;
  //Cipher: TDCP_rc4;
  Cipher: TDCP_DES;
begin

  SortedList:=TStringList.Create;
  try
    // Fill ComboBoxOS
    SortedList.Clear;
    SortedList.Sorted:=False;
    for OS := Low(TOS) to High(TOS) do
      SortedList.Add(GetEnumNameSimple(TypeInfo(TOS),Ord(OS)));
    SortedList.Sort;
    for OS := Low(TOS) to High(TOS) do
    begin
      ComboBoxOS.Items.Add(SortedList[Ord(OS)]);
    end;

    // Fill ComboBoxCPU
    SortedList.Clear;
    SortedList.Sorted:=False;
    for CPU := Low(TCPU) to High(TCPU) do
      SortedList.Add(GetEnumNameSimple(TypeInfo(TCPU),Ord(CPU)));
    SortedList.Sort;
    for CPU := Low(TCPU) to High(TCPU) do
    begin
      ComboBoxCPU.Items.Add(SortedList[Ord(CPU)]);
    end;
  finally
    SortedList.Free;
  end;

  for OS := Low(TOS) to High(TOS) do
  begin
    for CPU := Low(TCPU) to High(TCPU) do
    begin
      FCrossUtils[CPU,OS].CPU:=GetEnumNameSimple(TypeInfo(TCPU),Ord(CPU));
      FCrossUtils[CPU,OS].OS:=GetEnumNameSimple(TypeInfo(TOS),Ord(OS));
      FCrossUtils[CPU,OS].Setting:=TCrossSetting.fpcup;
      FCrossUtils[CPU,OS].LibDir:='';
      FCrossUtils[CPU,OS].BinDir:='';
      FCrossUtils[CPU,OS].CrossBuildOptions:='';
      FCrossUtils[CPU,OS].CrossSubArch:='';
      FCrossUtils[CPU,OS].Compiler:='';
    end;
  end;

  with TIniFile.Create(SafeGetApplicationPath+installerUniversal.DELUXEFILENAME) do
  try
    CheckRepo.Checked:=ReadBool('General','GetRepo',True);
    CheckPackageRepo.Checked:=ReadBool('General','GetPackageRepo',False);
    CheckIncludeHelp.Checked:=ReadBool('General','IncludeHelp',False);

    CheckIncludeLCL.Checked:=ReadBool('Cross','IncludeLCL',False);

    {$ifdef RemoteLog}
    CheckSendInfo.Checked:=ReadBool('General','SendInfo',False);
    {$endif}

    EditHTTPProxyHost.Text:=ReadString('ProxySettings','HTTPProxyURL','');
    EditHTTPProxyPort.Text:=InttoStr(ReadInteger('ProxySettings','HTTPProxyPort',8080));
    EditHTTPProxyUser.Text:=ReadString('ProxySettings','HTTPProxyUser','');

    // add some security into the password storage ... ;-)
    s:=ReadString('ProxySettings','HTTPProxyPass','');
    if Length(s)>0 then
    begin
      //Cipher:= TDCP_rc4.Create(nil);
      Cipher := TDCP_DES.Create(nil);
      try
        Cipher.InitStr(DELUXEKEY,TDCP_sha256);
        s:=Cipher.DecryptString(s);
      finally
        Cipher.Burn;
        Cipher.Free;
      end;
    end;
    EditHTTPProxyPassword.Text:=s;

  finally
    Free;
  end;

  SetInstallDir;// for backwards compatibility

  //{$IF (defined(MSWINDOWS)) OR (defined(Darwin)) OR (defined(OpenBSD))}
  {$IF (defined(Darwin)) OR (defined(OpenBSD))}
  // there are default setings for the downloader, so disable user access
  CheckUseWget.Enabled:=False;
  {$endif}

  {$ifdef CPUAARCH64}
  // disable some features
  GroupBox4.Enabled:=False;
  {$endif CPUAARCH64}
  {$ifdef CPUARM}
  // disable some features
  GroupBox4.Enabled:=False;
  {$endif CPUARM}

  {$ifndef RemoteLog}
  CheckSendInfo.Checked:=False;
  CheckSendInfo.Enabled:=False;
  {$endif}

  {$ifndef Windows}
  CheckForceLocalRepoClient.Checked:=False;
  CheckForceLocalRepoClient.Enabled:=False;
  {$endif}
end;

procedure TForm2.SetInstallDir(const aInstallDir:string='');
var
  CPU:TCPU;
  OS:TOS;
  s:string;
begin
  if (Length(aInstallDir)>0)
     then FInstallPath:=IncludeTrailingPathDelimiter(aInstallDir)
     else FInstallPath:=SafeGetApplicationPath;

  with TIniFile.Create(FInstallPath+installerUniversal.DELUXEFILENAME) do
  try
    for OS := Low(TOS) to High(TOS) do
    begin
      for CPU := Low(TCPU) to High(TCPU) do
      begin
        s:=FCrossUtils[CPU,OS].CPU+'-'+FCrossUtils[CPU,OS].OS;
        FCrossUtils[CPU,OS].Setting:=TCrossSetting(ReadInteger(s,'Setting',Ord(fpcup)));
        FCrossUtils[CPU,OS].LibDir:=ReadString(s,'LibPath','');
        FCrossUtils[CPU,OS].BinDir:=ReadString(s,'BinPath','');
        FCrossUtils[CPU,OS].CrossBuildOptions:=ReadString(s,'CrossBuildOptions','');
        FCrossUtils[CPU,OS].CrossSubArch:=ReadString(s,'CrossSubArch','');
        FCrossUtils[CPU,OS].Compiler:=ReadString(s,'Compiler','');
      end;
    end;
  finally
    Free;
  end;
end;

procedure TForm2.ComboBoxCPUOSChange(Sender: TObject);
var
  e:boolean;
  xCPUOS:TCPUOS;
begin
  e:=((ComboBoxOS.ItemIndex<>-1) AND (ComboBoxCPU.ItemIndex<>-1));
  RadioGroup3.Enabled:=e;
  EditCrossBuildOptions.Enabled:=e;
  EditCompilerOverride.Enabled:=e;
  btnSelectCompiler.Enabled:=e;
  if e then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    if (xCPUOS.OS=TOS.embedded) then EditCrossSubArch.Enabled:=e;
    EditLibLocation.Text:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].LibDir;
    EditBinLocation.Text:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].BinDir;
    EditCrossBuildOptions.Text:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossBuildOptions;
    EditCrossSubArch.Text:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossSubArch;
    RadioGroup3.ItemIndex:=Ord(FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Setting);
    EditCompilerOverride.Text:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Compiler;
  end;
end;

procedure TForm2.EditDblClickDelete(Sender: TObject);
var
  xCPUOS:TCPUOS;
begin
  TEdit(Sender).Text:='';
  if ( (ComboBoxCPU.ItemIndex<>-1) AND (ComboBoxOS.ItemIndex<>-1) )  then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    if Sender=EditCompilerOverride then FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Compiler:='';
    if Sender=EditLibLocation then FCrossUtils[xCPUOS.CPU,xCPUOS.OS].LibDir:='';
    if Sender=EditBinLocation then FCrossUtils[xCPUOS.CPU,xCPUOS.OS].BinDir:='';
    if Sender=EditCrossBuildOptions then FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossBuildOptions:='';
    if Sender=EditCrossSubArch then FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossSubArch:='';
  end;
end;

procedure TForm2.EditCrossBuildOptionsChange(Sender: TObject);
var
  xCPUOS:TCPUOS;
begin
  if ( (ComboBoxCPU.ItemIndex<>-1) AND (ComboBoxOS.ItemIndex<>-1) )  then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossBuildOptions:=TEdit(Sender).Text;
  end;
end;

procedure TForm2.EditCrossSubArchChange(Sender: TObject);
var
  xCPUOS:TCPUOS;
begin
  if ( (ComboBoxCPU.ItemIndex<>-1) AND (ComboBoxOS.ItemIndex<>-1) )  then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossSubArch:=TEdit(Sender).Text;
  end;
end;

procedure TForm2.btnAddPatchClick(Sender: TObject);
var
  PatchName: string;
  FullPatchPath: string;
  aListBox:TListBox;
begin
  OpenDialog1.FilterIndex:=1;
  if OpenDialog1.Execute then
  begin
    FullPatchPath := OpenDialog1.FileName;
    PatchName := ExtractFileName(FullPatchPath);

    if Sender=btnAddFPCPatch then aListBox:=ListBoxFPCPatch;
    if Sender=btnAddLazPatch then aListBox:=ListBoxLazPatch;

    if aListBox.Items.IndexOf(PatchName)=-1 then
    begin
      aListBox.Items.AddObject(PatchName, TString.Create(FullPatchPath));
    end;
  end;
end;

procedure TForm2.btnRemPatchClick(Sender: TObject);
var
  i:integer;
  aListBox:TListBox;
begin

  if Sender=btnRemFPCPatch then aListBox:=ListBoxFPCPatch;
  if Sender=btnRemLazPatch then aListBox:=ListBoxLazPatch;

  if aListBox.SelCount>0 then
  begin
    for i:=aListBox.Count-1 downto 0 do
    begin
      if aListBox.Selected[i] then
      begin
        TString(aListBox.Items.Objects[i]).Free;
        aListBox.Items.Objects[i]:=nil;
        aListBox.Items.Delete(i);
      end;
    end;
  end;
end;

procedure TForm2.btnSelectFile(Sender: TObject);
var
  xCPUOS:TCPUOS;
begin
  if Sender=btnSelectCompiler then
  begin
    OpenDialog1.InitialDir:=EditCompilerOverride.Text;
    OpenDialog1.FilterIndex:=3;
  end;

  if OpenDialog1.Execute then
  begin
    if Sender=btnSelectCompiler then EditCompilerOverride.Text:=OpenDialog1.FileName;
  end;

  if (ComboBoxOS.ItemIndex<>-1) AND (ComboBoxCPU.ItemIndex<>-1) then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    if Sender=btnSelectCompiler then
       FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Compiler:=OpenDialog1.FileName;
  end;
end;

procedure TForm2.btnListCustomOptionsClick(Sender: TObject);
var
  CPU:TCPU;
  OS:TOS;
  s:string;
  x:integer;
begin
  InfoForm:= TInfoForm.Create(Self);
  try
    for OS := Low(TOS) to High(TOS) do
    begin
      for CPU := Low(TCPU) to High(TCPU) do
      begin
        x:=InfoForm.Memo1.Lines.Count;
        s:=FCrossUtils[CPU,OS].CPU+'-'+FCrossUtils[CPU,OS].OS;
        if FCrossUtils[CPU,OS].Setting=auto then
        begin
          InfoForm.Memo1.Lines.Append(s+': full auto search tools and libraries.');
        end
        else
        if FCrossUtils[CPU,OS].Setting=custom then
        begin
          InfoForm.Memo1.Lines.Append(s+' (manual settings):');
          InfoForm.Memo1.Lines.Append('  libs     : '+FCrossUtils[CPU,OS].LibDir);
          InfoForm.Memo1.Lines.Append('  bins      : '+FCrossUtils[CPU,OS].BinDir);
        end;

        if Length(FCrossUtils[CPU,OS].CrossBuildOptions)>0 then
        begin
          if x=InfoForm.Memo1.Lines.Count then InfoForm.Memo1.Lines.Append(s);
          InfoForm.Memo1.Lines.Append('  options : '+FCrossUtils[CPU,OS].CrossBuildOptions);
        end;

        if Length(FCrossUtils[CPU,OS].CrossSubArch)>0 then
        begin
          if x=InfoForm.Memo1.Lines.Count then InfoForm.Memo1.Lines.Append(s);
          InfoForm.Memo1.Lines.Append('  subarch : '+FCrossUtils[CPU,OS].CrossSubArch);
        end;

        if Length(FCrossUtils[CPU,OS].Compiler)>0 then
        begin
          if x=InfoForm.Memo1.Lines.Count then InfoForm.Memo1.Lines.Append(s);
          InfoForm.Memo1.Lines.Append('  compiler : '+FCrossUtils[CPU,OS].Compiler);
        end;

        if x<>InfoForm.Memo1.Lines.Count then InfoForm.Memo1.Lines.Append('');

      end;
    end;
    InfoForm.ShowModal;
  finally
    InfoForm.Free;
  end;
end;

procedure TForm2.FormDestroy(Sender: TObject);
var
  CPU:TCPU;
  OS:TOS;
  s:string;
  i:integer;
  //Cipher: TDCP_rc4;
  Cipher: TDCP_DES;
begin
  with TIniFile.Create(SafeGetApplicationPath+installerUniversal.DELUXEFILENAME) do
  try
    WriteBool('General','GetRepo',Repo);
    WriteBool('General','GetPackageRepo',PackageRepo);
    WriteBool('General','IncludeHelp',IncludeHelp);

    WriteBool('Cross','IncludeLCL',IncludeLCL);

    {$ifdef RemoteLog}
    WriteBool('General','SendInfo',SendInfo);
    {$endif}

    WriteString('ProxySettings','HTTPProxyURL',EditHTTPProxyHost.Text);
    if TryStrToInt(EditHTTPProxyPort.Text,i) then WriteInteger('ProxySettings','HTTPProxyPort',i);
    WriteString('ProxySettings','HTTPProxyUser',EditHTTPProxyUser.Text);

    // add some security into the password storage ... ;-)
    s:=EditHTTPProxyPassword.Text;
    if Length(s)>0 then
    begin
      //Cipher:= TDCP_rc4.Create(nil);
      Cipher := TDCP_DES.Create(nil);
      try
        Cipher.InitStr(DELUXEKEY,TDCP_sha256);
        s:=Cipher.EncryptString(s);
      finally
        Cipher.Burn;
        Cipher.Free;
      end;
    end;
    WriteString('ProxySettings','HTTPProxyPass',s);

  finally
    Free;
  end;

  with TIniFile.Create(FInstallPath+installerUniversal.DELUXEFILENAME) do
  try
    for OS := Low(TOS) to High(TOS) do
    begin
      for CPU := Low(TCPU) to High(TCPU) do
      begin
        // skip non-combi's to reduce size of ini-file
        if ((OS=java) AND (CPU<>jvm)) OR ((CPU=jvm) AND (OS<>java) AND (OS<>android)) then continue;
        if (OS=android) AND ((CPU<>arm) AND (CPU<>armel) AND (CPU<>armeb) AND (CPU<>armhf) AND (CPU<>aarch64) AND (CPU<>jvm) AND (CPU<>mipsel)) then continue;
        if (OS=iphonesim) AND ((CPU<>i386) AND (CPU<>x86_64)) then continue;
        if (OS=wince) AND not (CPU in [arm,armel,armeb,armhf]) then continue;
        if (OS=windows) AND ((CPU in [arm,armel,armeb,armhf]) OR (CPU=aarch64)) then continue;
        if (CPU=powerpc) AND ((OS<>aix) AND (OS<>linux) AND (OS<>darwin)) then continue;
        if (CPU=powerpc64) AND ((OS<>aix) AND (OS<>linux) AND (OS<>darwin)) then continue;
        if (CPU=aarch64) AND ((OS<>linux) AND (OS<>darwin) AND (OS<>android)) then continue;
        if (CPU=mips) AND (OS<>linux) then continue;
        if (CPU=mipsel) AND ((OS<>linux) AND (OS<>android) AND (OS<>embedded)) then continue;
        if (CPU=avr) AND (OS<>embedded) then continue;
        if (OS=haiku) AND ((CPU<>i386) AND (CPU<>x86_64)) then continue;

        s:=FCrossUtils[CPU,OS].CPU+'-'+FCrossUtils[CPU,OS].OS;
        WriteInteger(s,'Setting',Ord(FCrossUtils[CPU,OS].Setting));
        WriteString(s,'LibPath',FCrossUtils[CPU,OS].LibDir);
        WriteString(s,'BinPath',FCrossUtils[CPU,OS].BinDir);
        WriteString(s,'CrossBuildOptions',FCrossUtils[CPU,OS].CrossBuildOptions);
        WriteString(s,'CrossSubArch',FCrossUtils[CPU,OS].CrossSubArch);
        WriteString(s,'Compiler',FCrossUtils[CPU,OS].Compiler);
      end;
    end;
  finally
    Free;
  end;

  for i := 0 to ListBoxFPCPatch.Items.Count - 1 do
  begin
     TString(ListBoxFPCPatch.Items.Objects[i]).Free;
     ListBoxFPCPatch.Items.Objects[i] := nil;
  end;
  for i := 0 to ListBoxLazPatch.Items.Count - 1 do
  begin
     TString(ListBoxLazPatch.Items.Objects[i]).Free;
     ListBoxLazPatch.Items.Objects[i] := nil;
  end;
end;

procedure TForm2.RadioGroup3SelectionChanged(Sender: TObject);
var
  e:boolean;
  i:integer;
  xCPUOS:TCPUOS;
begin
  i:=(Sender AS TRadioGroup).ItemIndex;
  if (ComboBoxOS.ItemIndex<>-1) AND (ComboBoxCPU.ItemIndex<>-1) then
  begin
    xCPUOS:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],ComboBoxOS.Items[ComboBoxOS.ItemIndex]);
    FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Setting:=TCrossSetting(i);
  end;
  e:=(i=2);
  EditLibLocation.Enabled:=e;
  EditBinLocation.Enabled:=e;
  btnSelectLibDir.Enabled:=e;
  btnSelectBinDir.Enabled:=e;
end;

function TForm2.GetCPUFromComboBox:TCPU;
begin
  if (ComboBoxCPU.ItemIndex<>-1) then
  begin
    result:=GetCPUOSCombo(ComboBoxCPU.Items[ComboBoxCPU.ItemIndex],'').CPU;
  end;
end;

function TForm2.GetOSFromComboBox:TOS;
begin
  if (ComboBoxOS.ItemIndex<>-1) then
  begin
    result:=GetCPUOSCombo('',ComboBoxOS.Items[ComboBoxOS.ItemIndex]).OS;
  end;
end;

function TForm2.GetLibraryDirectory(aCPU,aOS:string):string;
var
  xCPUOS:TCPUOS;
begin
  try
    xCPUOS:=GetCPUOSCombo(aCPU,aOS);
    case FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Setting of
      fpcup: result:='';
      auto: result:='FPCUP_AUTO';
      custom: result:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].LibDir;
    else result:='';
    end;
  except
    result:='';
  end;
end;

function TForm2.GetToolsDirectory(aCPU,aOS:string):string;
var
  xCPUOS:TCPUOS;
begin
  try
    xCPUOS:=GetCPUOSCombo(aCPU,aOS);
    case FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Setting of
      fpcup: result:='';
      auto: result:='FPCUP_AUTO';
      custom: result:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].BinDir;
    else result:='';
    end;
  except
    result:='';
  end;
end;

function TForm2.GetCrossBuildOptions(aCPU,aOS:string):string;
var
  xCPUOS:TCPUOS;
begin
  xCPUOS:=GetCPUOSCombo(aCPU,aOS);
  result:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossBuildOptions;
end;

function TForm2.GetCrossSubArch(aCPU, aOS: string): string;
var
  xCPUOS:TCPUOS;
begin
  xCPUOS:=GetCPUOSCombo(aCPU,aOS);
  result:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].CrossSubArch;
end;

function TForm2.GetCompiler(aCPU, aOS: string): string;
var
  xCPUOS:TCPUOS;
begin
  xCPUOS:=GetCPUOSCombo(aCPU,aOS);
  result:=FCrossUtils[xCPUOS.CPU,xCPUOS.OS].Compiler;
end;


function TForm2.GetRepo:boolean;
begin
  result:=CheckRepo.Checked;
end;

function TForm2.GetPackageRepo:boolean;
begin
  result:=CheckPackageRepo.Checked;
end;

function TForm2.GetUpdateOnly:boolean;
begin
  result:=CheckUpdateOnly.Checked;
end;

function TForm2.GetIncludeLCL:boolean;
begin
  result:=CheckIncludeLCL.Checked;
end;

function TForm2.GetIncludeHelp:boolean;
begin
  result:=CheckIncludeHelp.Checked;
end;

function TForm2.GetSplitFPC:boolean;
begin
  result:=CheckSplitFPC.Checked;
end;
procedure TForm2.SetSplitFPC(value:boolean);
begin
  CheckSplitFPC.Checked:=value;
end;

function TForm2.GetSplitLazarus:boolean;
begin
  result:=CheckSplitLazarus.Checked;
end;
procedure TForm2.SetSplitLazarus(value:boolean);
begin
  CheckSplitLazarus.Checked:=value;
end;

function TForm2.GetUseWget:boolean;
begin
  result:=CheckUseWget.Checked;
end;
procedure TForm2.SetUseWget(value:boolean);
begin
  CheckUseWget.Checked:=value;
end;

function TForm2.GetMakeJobs:boolean;
begin
  result:=CheckUseMakeJobs.Checked;
end;
procedure TForm2.SetMakeJobs(value:boolean);
begin
  CheckUseMakeJobs.Checked:=value;
end;


function TForm2.GetExtraVerbose:boolean;
begin
  result:=CheckExtraVerbose.Checked;
end;
procedure TForm2.SetExtraVerbose(value:boolean);
begin
  CheckExtraVerbose.Checked:=value;
end;

function TForm2.GetAutoSwitchURL:boolean;
begin
  result:=CheckAutoSwitchURL.Checked;
end;
procedure TForm2.SetAutoSwitchURL(value:boolean);
begin
  CheckAutoSwitchURL.Checked:=value;
end;

function TForm2.GetSendInfo:boolean;
begin
  result:=CheckSendInfo.Checked;
end;
procedure TForm2.SetSendInfo(value:boolean);
begin
  CheckSendInfo.Checked:=value;
end;

function TForm2.GetFpcupBootstrappersOnly:boolean;
begin
  result:=CheckFpcupBootstrappersOnly.Checked;
end;
procedure TForm2.SetFpcupBootstrappersOnly(value:boolean);
begin
  CheckFpcupBootstrappersOnly.Checked:=value;
end;

function TForm2.GetForceLocalRepoClient:boolean;
begin
  result:=CheckForceLocalRepoClient.Checked;
end;
procedure TForm2.SetForceLocalRepoClient(value:boolean);
begin
  CheckForceLocalRepoClient.Checked:=value;
end;

function TForm2.GetFPCOptions:string;
begin
  result:=EditFPCOptions.Text;
end;
procedure TForm2.SetFPCOptions(value:string);
begin
  EditFPCOptions.Text:=value;
end;

function TForm2.GetLazarusOptions:string;
begin
  result:=EditLazarusOptions.Text;
end;
procedure TForm2.SetLazarusOptions(value:string);
begin
  EditLazarusOptions.Text:=value;
end;

function TForm2.GetFPCRevision:string;
begin
  result:=EditFPCRevision.Text;
end;
procedure TForm2.SetFPCRevision(value:string);
begin
  EditFPCRevision.Text:=value;
end;

function TForm2.GetLazarusRevision:string;
begin
  result:=EditLazarusRevision.Text;
end;
procedure TForm2.SetLazarusRevision(value:string);
begin
  EditLazarusRevision.Text:=value;
end;

function TForm2.GetFPCBranch:string;
begin
  result:=EditFPCBranch.Text;
end;
procedure TForm2.SetFPCBranch(value:string);
begin
  EditFPCBranch.Text:=value;
end;

function TForm2.GetLazarusBranch:string;
begin
  result:=EditLazarusBranch.Text;
end;
procedure TForm2.SetLazarusBranch(value:string);
begin
  EditLazarusBranch.Text:=value;
end;

function TForm2.GetHTTPProxyHost:string;
begin
  result:=EditHTTPProxyHost.Text;
end;

function TForm2.GetHTTPProxyPort:integer;
var
  i:integer;
begin
  if TryStrToInt(EditHTTPProxyPort.Text,i) then result:=i;
end;

function TForm2.GetHTTPProxyUser:string;
begin
  result:=EditHTTPProxyUser.Text;
end;

function TForm2.GetHTTPProxyPass:string;
begin
  result:=EditHTTPProxyPassword.Text;
end;

function TForm2.GetPatches(const Lazarus:boolean=false):string;
var
  i:integer;
  FullPatchPath:string;
  aListBox:TListBox;
begin
  if Lazarus
    then aListBox:=ListBoxLazPatch
    else aListBox:=ListBoxFPCPatch;

  result:='';
  if aListBox.Count=0 then exit;
  for i:=0 to aListBox.Count-1 do
  begin
    FullPatchPath := TString(aListBox.Items.Objects[i]).Str;
    result:=result+FullPatchPath+',';
  end;
  // delete last comma
  if Length(result)>0 then
  begin
    Delete(result,Length(result),1);
  end;
end;

procedure TForm2.SetPatches(value:string;const Lazarus:boolean=false);
var
  PatchName: string;
  FullPatchPath: string;
  PatchList:TStringList;
  i:integer;
  aListBox:TListBox;
begin

  if Lazarus
    then aListBox:=ListBoxLazPatch
    else aListBox:=ListBoxFPCPatch;

  // cleanup
  for i := aListBox.Items.Count - 1 downto 0 do
  begin
     TString(aListBox.Items.Objects[i]).Free;
     aListBox.Items.Objects[i] := nil;
     aListBox.Items.Delete(i);
  end;

  PatchList:=TStringList.Create;
  try
    PatchList.CommaText:=value;
    if PatchList.Count=0 then exit;
    for i:=0 to PatchList.Count-1 do
    begin
      FullPatchPath := Trim(PatchList.Strings[i]);
      if Length(FullPatchPath)>0 then
      begin
        PatchName := ExtractFileName(FullPatchPath);
        aListBox.Items.AddObject(PatchName, TString.Create(FullPatchPath));
      end;
    end;
  finally
    PatchList.Free;
  end;
end;


function TForm2.GetFPCPatches:string;
begin
  result:=GetPatches(false);
end;

procedure TForm2.SetFPCPatches(value:string);
begin
  SetPatches(value,false);
end;

function TForm2.GetLazPatches:string;
begin
  result:=GetPatches(true);
end;

procedure TForm2.SetLazPatches(value:string);
begin
  SetPatches(value,true);
end;

end.

