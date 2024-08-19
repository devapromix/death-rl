unit uConst;

interface

uses uTypes;

const
  // ������
  DeathVersion = '0.2.0';
  // ������ �������
  CursorChar = '_';
  // ���. ����� �����
  ExpMod = 45;
  // ���. ���������
  ItemsCount = 255;
  //
  DungeonHeight = 39;
  DungeonWidth = 69;
  DungeonMin = -1;
  DungeonsCount = 25;
  DungeonGold = 10;
  DungeonCreatures = 10;
  //
  RacesCount = 12;
  ClassesCount = 12;

var
  // ���. �����
  DebugMode: Boolean = False;
  // �����
  GameFrameTemp: TGameFrame = gfNone;
  GameFrameScreen: TGameFrame = gfNone;
  GameFrame: TGameFrame = gfSplash;
  // ���� ������ ����
  IsGame: Boolean = False;
  // ���. ����. ����
  MenuPos: Byte = 0;
  LLPos: Byte = 0;
  // ������
  CharWidth: Integer = 0;
  CharHeight: Integer = 0;
  HalfCharWidth: Integer = 0;
  HalfCharHeight: Integer = 0;

const
  // �����
  ScreenWidth = 110;
  ScreenHeight = 40;
  // ���. �������
  ColWidth = ScreenWidth div 4;

var
  //
  Cursor: TPoint;
  // ���
  PCName: string = '';
  LastEnemyName: string = '';
  // ���. �������
  ShowCursor: Boolean = False;
  // ����. ������� � ���.
  ItemSelInvID: Integer = 0;
  ItemSelInvCount: Integer = 0;
  // Look, shoot, spell, talk
  LMode: Boolean = False;
  SMode: Boolean = False;
  TMode: Boolean = False;
  // Animations
  AnimPC: Boolean = False;
  AnimEnemyChar: Char;
  AnimEnemy: Boolean = False;
  AnimEnemyPoint: TPoint;
  IsVictory: Boolean = False;
  NoSpell: Boolean = False;
  ShowCharAllSkills: Byte = 1;
  PCPanelWidth: Integer = 40;
  TrapPit: Boolean = False;
  AutoPickUpGold: Boolean = False;

const
  Zip2ArchivePassword = 'supernatural';

implementation

end.
