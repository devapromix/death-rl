unit uDraw;

interface

procedure Draw();
procedure Refresh();

implementation

uses Types, uMenu, uGraph, uColor, uMain, uConst, uName, uClass, uRace,
  uHelp, uSplash, uGame, uInv, uChar, uMsg, uCellItems, uItem, uCraft,
  uTypes, uKills, uRecords, uBook, uEnd, uHelpAbout, uHelpKeys,
  uJournal, uConfig, uDialog;

procedure Draw();
begin
  // �������������� �����: �������� ������ ������...
  BG.Canvas.Brush.Color := cBlack;
  BG.Canvas.FillRect(Rect(0, 0, fMain.ClientRect.Right, fMain.ClientRect.Bottom));
  // ���������� �������� � ����������� �� �������� ������
  case GameFrame of
    // ��������
    gfSplash   : DrawSplash();
    // ����
    gfMenu     : DrawMenu();
    // ������ ���
    gfName     : DrawName();
    // ����. ����
    gfRace     : DrawRace();
    // ����. �����
    gfClass    : DrawClass();
    // �����������
    gfHelp     : DrawHelp();
    gfHelpAbout: DrawHelpAbout();
    gfHelpKeys : DrawHelpKeys();
    // �������
    gfItem     : DrawItem();
//    // �������
//    gfVillage  : DrawVillage();
    // ����
    gfGame     : DrawGame();
    // �����
    gfBook     : DrawBook();
    // ��������
    gfChar     : DrawChar();
    // ���������
    gfInv      : DrawInv();
    // ���������
    gfMsg      : DrawMsg(False, 0, ScreenHeight - 4);
    // ������� �� ����
    gfCellItems: DrawCellItems();
    // � ��������� ����� ���������
    gfDefeat   : DrawEnd();
    // ������
    gfVictory  : DrawEnd();
    // �������
    gfAlchemy  : DrawCraft();
    // �����
    gfCraft    : DrawCraft();
    // ������ ����������� ������
    gfKills    : DrawKills();
    // ������� ��������
    gfRecords  : DrawRecords();
    // ���������
    gfConfig   : DrawConfig();
    // ������
    gfDialog   : DrawDialog();
    // ������ �������
    gfJournal  : DrawJournal();
  end;
  // ���������� �����
  fMain.Canvas.Draw(HalfCharWidth, HalfCharHeight, BG);
end;

procedure Refresh();
begin
  fMain.Canvas.Draw(HalfCharWidth, HalfCharHeight, BG);
end;

end.
