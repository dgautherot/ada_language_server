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

--  This package provides generic set to implement Language Server Protocol.

with Ada.Streams;

generic
   type Element is (<>);

package LSP.Generic_Sets is

   type Set is array (Element) of Boolean;

   procedure Read_Set
     (S : access Ada.Streams.Root_Stream_Type'Class;
      V : out Set);

   procedure Write_Set
     (S : access Ada.Streams.Root_Stream_Type'Class;
      V : Set);

   for Set'Read use Read_Set;
   for Set'Write use Write_Set;

end LSP.Generic_Sets;
