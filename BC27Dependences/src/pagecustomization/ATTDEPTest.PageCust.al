pagecustomization "ATTDEP Test" customizes "ATT Test"
{
    layout
    {
        addafter(MyField)
        {
            // field(MyCustField2; Rec.MyField2)
            // {
            //     ApplicationArea = All;
            // }
            field(MyCustField3; Rec.MyField3)
            {
                ApplicationArea = All;
                //Editable = true;
            }
            field(MyField4; Rec.MyField4)
            {
                ApplicationArea = All;
            }
        }
    }
}