with
  Ada.Characters.Latin_1;

package body Black.Text_IO is
   function Get_Line
     (Stream : not null access Ada.Streams.Root_Stream_Type'Class)
     return String is
   begin
      return Ada.Strings.Unbounded.To_String (Get_Line (Stream));
   end Get_Line;

   function Get_Line
     (Stream : not null access Ada.Streams.Root_Stream_Type'Class)
     return Ada.Strings.Unbounded.Unbounded_String is
      use Ada.Characters.Latin_1, Ada.Strings.Unbounded;
      Buffer : Unbounded_String := Null_Unbounded_String;
      Next   : Character;
   begin
      loop
         Character'Read (Stream, Next);

         if Next = CR then
            Character'Read (Stream, Next);
            if Next = LF then
               return Buffer;
            else
               Append (Buffer, CR & Next);
            end if;
         else
            Append (Buffer, Next);
         end if;
      end loop;
   end Get_Line;

   procedure New_Line (File : in     POSIX.IO.File_Descriptor) is
   begin
      Put (File => File,
           Item => Ada.Characters.Latin_1.CR & Ada.Characters.Latin_1.LF);
   end New_Line;

   procedure Put (File : in     POSIX.IO.File_Descriptor;
                  Item : in     String) is
      use type Ada.Streams.Stream_Element_Offset;
      Buffer : Ada.Streams.Stream_Element_Array (1 .. Item'Length);
      for Buffer'Address use Item'Address;
      pragma Assert (Buffer'Size = Item'Size);
      Last : Ada.Streams.Stream_Element_Offset := Buffer'First;
   begin
      while Last in Buffer'Range loop
         POSIX.IO.Write (File   => File,
                         Buffer => Buffer (Last .. Buffer'Last),
                         Last   => Last);
         Last := Last + 1;
      end loop;
   end Put;

   procedure Put_Line (File : in     POSIX.IO.File_Descriptor;
                       Item : in     String) is
   begin
      Put (File => File,
           Item => Item &
                   Ada.Characters.Latin_1.CR & Ada.Characters.Latin_1.LF);
   end Put_Line;
end Black.Text_IO;
