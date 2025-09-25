pageextension 50000 "ATT Customer Card" extends "Customer Card"
{
    layout
    {
        modify(DefaultSummaryPart)
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    var
        MyRecordRef: RecordRef;
        MyFieldRef: FieldRef;
        Text000_Msg: Label 'The table contains %1 field, field id is %2.', Comment = 'ESP="La tabala tiene %1 el campo es %2"';
    begin
        MyRecordRef.Open(Database::Customer);
        if MyRecordRef.FieldExist('Name') then begin
            MyFieldRef := MyRecordRef.Field('Name');
            Message(Text000_Msg, MyFieldRef.Name, MyFieldRef.Number);
        end;

    end;
}