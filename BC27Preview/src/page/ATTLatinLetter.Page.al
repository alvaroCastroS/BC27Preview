page 50001 "ATT Latin Letter"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Symbol; Symbol)
                {
                    trigger OnValidate()
                    begin
                        IsLatinLetter := TypeHelper.IsLatinLetter(Symbol)
                    end;
                }
                field(IsLatinLetter; IsLatinLetter)
                {
                    Editable = false;
                }
            }
        }
    }


    var
        TypeHelper: Codeunit "Type Helper";
        Symbol: Char;
        IsLatinLetter: Boolean;
}