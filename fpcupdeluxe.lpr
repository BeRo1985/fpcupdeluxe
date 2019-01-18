program fpcupdeluxe;

{$mode objfpc}{$H+}
{$ifdef Windows}
{$APPTYPE GUI}
{$endif}

(*
  The Initial Developer of the FPCUPdeluxe code is:
  Alfred Glänzer (donalfredo, aog)

  The Initial Developers of the Original FPCUP code are:
  Ludo Brands
  Reinier Olieslagers (bigchimp), may he rest in peace.

  Icon by Taazz

  Contributor(s):
    Denis Grinyuk (arvur)
    Maciej Izak (hnb)
    Michalis Kamburelis
    Marius Maximus
    Josh (alternateui)
    Ondrej Kelle
    Marco van de Voort (marcov)

*)
(*
//static QT5 on Linux
{$ifdef Linux}
  {$ifdef LCLQT5}
    //{$linklib libc_nonshared.a}
    {$L libgcc_s.so.1}
    {$L libstdc++.so.6}
    {$L libQt5PrintSupport.so.5}
    {$L libQt5Widgets.so.5}
    {$L libQt5Gui.so.5}
    {$L libQt5Network.so.5}
    {$L libQt5Core.so.5}
    {$L libQt5X11Extras.so.5}
    {$linklib libQt5Pas.a}
  {$endif}
{$endif}
*)

uses
  {$IFDEF UNIX}
  //for threaded auto-updater-notifier
  //cthreads,
  //cmem,  // the c memory manager is on some systems much faster for multi-threading
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Classes, sysutils,
  fpcupdeluxemainform, extrasettings, modulesettings,
  unzipprogress, infounit,
  fpcuputil, commandline, installerUniversal, installerManager,
  m_crossinstaller,
  m_any_to_androidarm,
  m_any_to_androidmipsel,
  m_any_to_androidjvm,
  m_any_to_androidaarch64,
  m_any_to_androidx64,
  m_any_to_android386,
  m_any_to_linuxarm,
  m_any_to_linuxarmel,
  m_any_to_linuxarmeb,
  m_any_to_linuxarmhf,
  m_any_to_linuxmips,
  m_any_to_linuxmipsel,
  m_any_to_linuxpowerpc64,
  m_any_to_linuxaarch64,
  m_any_to_haiku386,
  //m_any_to_haikux64,
  m_any_to_embeddedarm,
  m_any_to_embeddedavr,
  m_any_to_embeddedmipsel,
  m_any_to_javajvm,
  m_any_to_aixpowerpc,
  m_any_to_aixpowerpc64,
  m_any_to_msdosi8086,
  {$ifdef LINUX}
  //{$ifdef CPUX86}
  m_linux386_to_mips,
  m_linux386_to_wincearm,
  //{$endif}
  {$endif}
  {$ifdef Darwin}
  m_crossdarwin64,
  m_crossdarwin32,
  m_crossdarwinpowerpc,
  m_crossdarwinarm,
  m_crossdarwinaarch64,
  m_crossdarwinx64iphonesim,
  m_crossdarwin386iphonesim,
  {$else}
  m_any_to_darwin386,
  m_any_to_darwinx64,
  m_any_to_darwinpowerpc,
  m_any_to_darwinpowerpc64,
  m_any_to_darwinarm,
  m_any_to_darwinaarch64,
  {$endif}
  {$IF defined(FREEBSD) or defined(NETBSD) or defined(OPENBSD)}
  m_freebsd_to_linux386,
  {$ifdef CPU64}
  m_freebsd64_to_freebsd32,
  {$endif CPU64}
  m_freebsd_to_linux64,
  {$else}
  m_any_to_linux386,
  m_any_to_linuxx64,
  m_any_to_freebsdx64,
  m_any_to_freebsd386,
  m_any_to_openbsd386,
  {$endif}
  {$ifdef MSWINDOWS}
  m_win32_to_linuxmips, m_win32_to_go32v2i386, m_win32_to_wincearm,
  {$ifdef win64}
  m_crosswin32,
  {$endif win64}
  {$ifdef win32}
  m_crosswin64,
  {$endif win32}
  {$endif MSWINDOWS}
  m_anyinternallinker_to_win386,
  m_anyinternallinker_to_win64;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

