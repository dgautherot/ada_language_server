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
--
--  This package provides some Libadalang related utility subprograms.

with Ada.Containers.Ordered_Maps;
with Ada.Containers.Doubly_Linked_Lists;

with GNATCOLL.VFS;
with GNATCOLL.Traces;

with LSP.Ada_Contexts;

with Libadalang.Analysis; use Libadalang.Analysis;

package LSP.Lal_Utils is

   function Get_Node_As_Name (Node : Ada_Node) return Name;

   function Get_Name_As_Defining (Name_Node : Name) return Defining_Name;

   function Resolve_Name
     (Name_Node : Name;
      Trace     : GNATCOLL.Traces.Trace_Handle;
      Imprecise : out Boolean) return Defining_Name;
   --  Return the definition node (canonical part) of the given name.
   --  Imprecise is set to True if LAL's imprecise fallback mechanism has been
   --  used to compute the cross reference.

   function Find_Next_Part
     (Definition : Defining_Name;
      Trace      : GNATCOLL.Traces.Trace_Handle) return Defining_Name;
   --  Wrapper around P_Next_Part which returns No_Defining_Name if this
   --  called returns Definition, and catches and traces Property_Error.

   function Find_Canonical_Part
     (Definition : Defining_Name;
      Trace      : GNATCOLL.Traces.Trace_Handle) return Defining_Name;
   --  Wrapper around P_Next_Part which catches the case when it returns self,
   --  and catches and traces Property_Error.

   function Find_Other_Part_Fallback
     (Definition : Defining_Name;
      Trace      : GNATCOLL.Traces.Trace_Handle) return Defining_Name;
   --  Attempt to find the other part of a definition manually, with
   --  simple heuristics that look at the available entities with matching
   --- names and profiles.
   --  This should be called only if straightforward Libadalang calls
   --  have failed.

   ---------------
   -- Called_By --
   ---------------

   package References_List is new Ada.Containers.Doubly_Linked_Lists
     (Base_Id);

   function "<" (Left, Right : Defining_Name) return Boolean is
      (Left.Text < Right.Text);

   package References_By_Subprogram is new Ada.Containers.Ordered_Maps
     (Key_Type     => Defining_Name,
      Element_Type => References_List.List,
      "<"          => "<",
      "="          => References_List."=");

   function Find_All_Calls
     (Context           : LSP.Ada_Contexts.Context;
      Definition        : Defining_Name;
      Imprecise_Results : out Boolean)
      return References_By_Subprogram.Map
     with Pre => Definition.P_Basic_Decl.P_Is_Subprogram;
   --  Return the list of all the calls made to the subprogram pointed at by
   --  the node given by Definition, organized by the subprograms in which
   --  these calls are listed, ordered by the name of these subprograms.
   --  Imprecise_Results is set to True if we don't know whether the results
   --  are precise.

end LSP.Lal_Utils;
