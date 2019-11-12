------------------------------------------------------------------------------
--                         Language Server Protocol                         --
--                                                                          --
--                     Copyright (C) 2018-2019, AdaCore                     --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
------------------------------------------------------------------------------

with GNATCOLL.JSON;

with LSP.JSON_Streams;

package body LSP.Generic_Sets is

   --------------
   -- Read_Set --
   --------------

   procedure Read_Set
     (S : access Ada.Streams.Root_Stream_Type'Class;
      V : out Set)
   is
      JS : LSP.JSON_Streams.JSON_Stream'Class renames
        LSP.JSON_Streams.JSON_Stream'Class (S.all);
   begin
      V := (others => False);
      JS.Start_Array;
      while not JS.End_Of_Array loop
         declare
            Key : Element;
         begin
            Element'Read (S, Key);
            V (Key) := True;
         end;
      end loop;
      JS.End_Array;
   end Read_Set;

   ---------------
   -- Write_Set --
   ---------------

   procedure Write_Set
     (S : access Ada.Streams.Root_Stream_Type'Class;
      V : Set)
   is
      JS : LSP.JSON_Streams.JSON_Stream'Class renames
        LSP.JSON_Streams.JSON_Stream'Class (S.all);
   begin
      JS.Start_Array;

      for K in V'Range loop
         if V (K) then
            Element'Write (S, K);
         end if;
      end loop;

      JS.End_Array;
   end Write_Set;

end LSP.Generic_Sets;
