page 50000 "ATT Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "ATT Test";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(MyField; Rec.MyField)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}