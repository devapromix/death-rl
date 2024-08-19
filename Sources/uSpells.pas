unit uSpells;

interface

function GetSpellID(MagicSchoolID, Level: Byte): Byte;
procedure TeachSpell(MagicSchoolID: Byte = 0);
function TeachSpellManaCost(SpellID: Byte): Integer;

function SpellManaCost(SpellID: Byte): Word;
function SpellDamage(SpellID: Byte): Word;
function SpellColor(SpellID: Byte): Integer;
function SpellType(SpellID: Byte): Byte;
function SpellTypeIP(SpellID: Byte): Byte;

function ActSpellManaCost: Word;
function ActSpellDamage: Word;
function ActSpellColor: Integer;
function ActSpellType: Byte;

function IsSpell(const SpellID: Byte): Boolean;

implementation

uses SysUtils, uPC, uColor, uUtils, uMsg, uConst, uBox, uLang;

function GetSpellID(MagicSchoolID, Level: Byte): Byte;
begin
  Result := (MagicSchoolID * 6) - (6 - Level);
end;

function TeachSpellManaCost(SpellID: Byte): Integer;
var
  V: Byte;
begin
  if (SpellType(SpellID) = PC.MagicType) then V := 25 else V := 40;
  Result := SpellManaCost(SpellID) * V - PC.Int;
  if (Result < 5) then Result := 5;
end;

procedure TeachSpell(MagicSchoolID: Byte = 0);
var
  A, I: Byte;
begin
  // ������� ����� ���������� � �������� � �����.
  with PC do
  begin
    if not IsBook then
    begin
      AddMsg(Lang.Lang(250));
      Exit;
    end;
    if (Life = 0) or (Items[ItemSelInvID] <= 0) then Exit;
    A := ItemSelInvID - 160;
    for I := 1 to 24 do
    begin
      if (PC.Spells[I] > 0) and (PC.Spells[I] = A) then
      begin
        AddMsg(Lang.Lang(148));
        Exit;
      end;
      if (TeachSpellManaCost(A) > Mana) then
      begin
        AddMsg(Lang.Lang(149));
        Exit;
      end;
      if (PC.Spells[I] = 0) then
      begin
        PC.Spells[I] := A;
        Dec(PC.Items[ItemSelInvID]);
        Dec(PC.Mana, TeachSpellManaCost(A));
        AddMsg(Format(Lang.Lang(145 + Rand(0, 2)), [Lang.Lang(A + 3000)]));
        Exit;
      end;
    end;  
  end;
end;

function SpellManaCost(SpellID: Byte): Word;
begin
  // ������ ���� �� ����������
  case SpellID of
     // ����
     1 : Result :=  2;  // �������� ������
     2 : Result :=  5;  // �������� ���
     3 : Result :=  8;  // ����� ����
     4 : Result := 11;
     5 : Result := 14;
     6 : Result := 17;  // �����

     // ������
     7 : Result :=  3;  // ������
     8 : Result :=  5;
     9 : Result :=  7;
    10 : Result :=  9;
    11 : Result := 12;
    12 : Result := 15;

     // �����
    13 : Result :=  4;  // ����� �����
    14 : Result :=  8;
    15 : Result := 12;
    16 : Result := 16;
    17 : Result := 20;
    18 : Result := 24;

     // �����
    19 : Result :=  3;  // �������� ���
    20 : Result :=  6;
    21 : Result :=  9;
    22 : Result := 12;
    23 : Result := 15;
    24 : Result := 18;

    else Result := 0;
  end;
  if (SpellType(SpellID) <> PC.MagicType) then Result := Result + (Result div 5);
end;

function SpellDamage(SpellID: Byte): Word;
begin
  // ���� ����������
  case SpellID of
     // ����
     1 : Result :=  4;  // �������� ������
     2 : Result :=  2;  // �������� ���
     3 : Result :=  2;  // ����� ����
     4 : Result :=  2;
     5 : Result :=  2;
     6 : Result :=  2;  // �����

     // ������
     7 : Result :=  6;  // ������
     8 : Result :=  2;
     9 : Result :=  2;
    10 : Result :=  2;
    11 : Result :=  2;
    12 : Result :=  2;

     // �����
    13 : Result := 10;  // ����� �����
    14 : Result :=  2;
    15 : Result :=  2;
    16 : Result :=  2;
    17 : Result :=  2;
    18 : Result :=  2;

     // �����
    19 : Result :=  5;  // �������� ���
    20 : Result :=  2;
    21 : Result :=  2;
    22 : Result :=  2;
    23 : Result :=  2;
    24 : Result :=  2;

    else Result := 0;
  end;
end;

function SpellColor(SpellID: Byte): Integer;
begin
  case SpellType(SpellID) of
     1 : Result := cLtBlue;
     2 : Result := cLtPurple;
     3 : Result := cLtBrown;
     4 : Result := cLtRed;
    else Result := cLtGray;
  end;
end;

function SpellType(SpellID: Byte): Byte;
begin
  // ��� ����������
  case SpellID of
    1 .. 6 : Result := 1; // ����
    7 ..12 : Result := 2; // ������
    13..18 : Result := 3; // �����
    19..24 : Result := 4; // �����
        else Result := 0;
  end;
end;

function SpellTypeIP(SpellID: Byte): Byte;
begin
  // �������� ����������
  case SpellID of
    13 : Result := 1; // �������
    else Result := 0; // ������� ����������� ������
  end;
end;

function ActSpellManaCost: Word;
begin
  Result := SpellManaCost(PC.ActSpell);
end;

function ActSpellDamage: Word;
begin
  Result := SpellDamage(PC.ActSpell);
end;

function ActSpellColor: Integer;
begin
  Result := SpellColor(PC.ActSpell);
end;

function ActSpellType: Byte;
begin
  Result := SpellType(PC.ActSpell);
end;

function IsSpell(const SpellID: Byte): Boolean;
var
  I: Byte;
begin
  Result := False;
  for I := 1 to High(PC.Spells) do
    if (PC.Spells[I] = SpellID) then
    begin
      Result := True;
      Exit;
    end;
end;

end.
