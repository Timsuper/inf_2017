unit Common;

interface

uses
  Classes, SysUtils, FMX.Forms, IdURI, FMX.Objects, FMX.Dialogs, FMX.Platform,
  System.IOUtils, FMX.Controls, FMX.StdCtrls, androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers, Androidapi.JNI.Net, Androidapi.JNI.JavaTypes, Androidapi.JNI.Webkit, IdHTTP;

type
  TCommon = class
  private
    { Private declarations }
  public
    { Public declarations }
    procedure open_browser_url(url:string; const DisplayError: Boolean = False);
  end;

var
  CommonVar: TCommon;

implementation

procedure TCommon.open_browser_url(url:string; const DisplayError: Boolean = False);
var
  Intent: JIntent;
begin
  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW,
    TJnet_Uri.JavaClass.parse(StringToJString(TIdURI.URLEncode(URL))));
  try
    SharedActivity.startActivity(Intent);
    exit();
  except
    on e: Exception do
    begin
      if DisplayError then ShowMessage('Error: ' + e.Message);
      exit();
    end;
  end;
end;

end.
