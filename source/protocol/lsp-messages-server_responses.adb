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

package body LSP.Messages.Server_Responses is

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Initialize_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Initialize_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Completion_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Completion_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Hover_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Hover_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : SignatureHelp_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_SignatureHelp_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Highlight_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Highlight_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Symbol_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Symbol_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Rename_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Rename_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : CodeAction_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_CodeAction_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Location_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Location_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : ALS_Called_By_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_ALS_Called_By_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : ExecuteCommand_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_ExecuteCommand_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : Shutdown_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_Shutdown_Response (Self);
   end Visit;

   -----------
   -- Visit --
   -----------

   overriding procedure Visit
     (Self    : ALS_Debug_Response;
      Handler : access Server_Response_Sender'Class)
   is
   begin
      Handler.On_ALS_Debug_Response (Self);
   end Visit;

end LSP.Messages.Server_Responses;
