unit uKeys;

interface

uses Classes;

procedure Keys(var Key: Word); overload;
procedure Keys(var Key: Char); overload;
procedure Keys(var Key: Word; Shift: TShiftState); overload;

implementation

uses uConst, uMenu, uName, uRace, uClass, uHelp, uSplash, uGame, uInv,
  uChar, uMsg, uCellItems, uItem, uTypes, uKills, uRecords, uBook, uEnd,
  uHelpAbout, uHelpKeys, uCraft, uJournal, uConfig, uDialog;

procedure Keys(var Key: Word);
begin
  // ������ ���������� � �����. �� �������� ������
  case GameFrame of
    // ��������
    gfSplash   : KeysSplash(Key);
    // ����
    gfMenu     : KeysMenu(Key);
    // ���� �����
    gfName     : KeysName(Key);
    // ����. ����.
    gfRace     : KeysRace(Key);
    // ����. �����
    gfClass    : KeysClass(Key);
    // �����������
    gfHelp     : KeysHelp(Key);
    gfHelpAbout: KeysHelpAbout(Key);
    gfHelpKeys : KeysHelpKeys(Key);
    // �������
    gfItem     : KeysItem(Key);
//    // �������
//    gfVillage  : KeysVillage(Key);
    // ����
    gfGame     : KeysGame(Key);
    // �����
    gfBook     : KeysBook(Key);
    // ��������
    gfChar     : KeysChar(Key);
    // ���������
    gfInv      : KeysInv(Key);
    // ���������
    gfMsg      : KeysMsg(Key);
    // ������� �� ����
    gfCellItems: KeysCellItems(Key);
    // ���������
    gfDefeat   : KeysEnd(Key);
    // ������
    gfVictory  : KeysEnd(Key);
    // �������
    gfAlchemy  : KeysCraft(Key);
    // �����
    gfCraft    : KeysCraft(Key);
    // ������ �������
    gfKills    : KeysKills(Key);
    // ������� ��������
    gfRecords  : KeysRecords(Key);
    // ���������
    gfConfig   : KeysConfig(Key);
    // ������ � NPC
    gfDialog   : KeysDialog(Key);
    // ������ �������
    gfJournal  : KeysJournal(Key);
  end;
end;

procedure Keys(var Key: Char);
begin
  // ������ ���������� � �����. �� �������� ������
  case GameFrame of
    // ���� �����
    gfName     : KeysName(Key);
    // ����
    gfGame     : KeysGame(Key);
    // ����
    gfMenu     : KeysMenu(Key);
  end;
end;

procedure Keys(var Key: Word; Shift: TShiftState);
begin
  // ������ ���������� � �����. �� �������� ������
  case GameFrame of
    // ���������
    gfInv      : KeysInv(Key, Shift);
  end;
end;

end.
