report 50000 "ATT Upload Test Table"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem(Integer; Integer)
        {
            MaxIteration = 100000;
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                Windows.Open(ProgressLbl);
            end;


            trigger OnAfterGetRecord()
            var
                ATTTest: Record "ATT Test";
            begin
                ATTTest.Init();
                ATTTest.MyField := 0;
                ATTTest.Insert();
                Windows.Update(1, Integer.Number);
            end;

            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin
                Windows.Close();
            end;
        }
    }

    var
        Windows: Dialog;
        ProgressLbl: Label 'Registro    #1###############\';
}