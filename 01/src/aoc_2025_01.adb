with Ada.Text_IO; use Ada.Text_IO;

procedure Aoc_2025_01 is
   function ParseNextLine (F : in out File_Type) return Integer is
      Line     :  constant String := Get_Line (F);
      Change   :  Integer;
   begin
      Change := Integer'Value (Line (2 .. Line'Length));
      if Line (1) = 'L' then
         Change := -Change;
      end if;

      return Change;
   end ParseNextLine;

   type CodeValue is mod 100;

   Position :  CodeValue := 50;
   Change   :  Integer;
   Result   :  Natural  := 0;
   F        :  File_Type;
begin
   Open (F, In_File, "in.txt");

   while not End_Of_File (F) loop
      Change := ParseNextLine (F);
      Position := Position + CodeValue'Mod (Change);

      if Position = 0 then
         Result := Result + 1;
      end if;
   end loop;

   Put_Line (Result'Image);

   Close (F);
exception
   when Name_Error =>
      Put_Line (Standard_Error, "ERROR: File in.txt not found");
end Aoc_2025_01;
