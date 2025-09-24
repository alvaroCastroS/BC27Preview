report 50001 "ATT Template For Reports"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Process Report Template', Comment = 'ESP="Plantilla reports procesos"';
    ProcessingOnly = true;

    dataset
    {

    }

    trigger OnPreReport()
    var
        ATTTest: Record "ATT Test";
        Duration: Duration;
        TimeBefore, TimeAfter : Time;
    begin
        TimeBefore := Time();
        ATTTest.Reset();
        ATTTest.SetFilter(MyField, '>%1', 150000);
        ATTTest.Truncate();
        TimeAfter := Time();

        Duration := TimeAfter - TimeBefore;
        Message(Duration.ToText());
    end;

    var
        Window: Dialog;
        Linea: Integer;
        Registros: Integer;
        Inicio: DateTime;
        Text000Lbl: Label 'Procesando...\';
        ProgressLbl: Label 'Registro    #1###############\';
        BarLbl: Label 'Progreso    #2###############';
        TimeLbl: Label 'Finaliza a las #3################';

    /// <summary>
    /// Rellena la barra de progreso según la cantidad de registros que queden por procesar
    /// Fills in the progress bar according to the number of records left to process
    /// </summary>
    /// <param name="Contador">Cantidad de registros que quedan por procesar : Integer</param>
    /// <returns>Barra de progreso actualizada : Text</returns>
    local procedure ProgressBar(Contador: Integer): Text
    var
        Factor: Decimal;
        TextBar: Text;
        I: Integer;
    begin
        Factor := Round(Contador / 1, 1, '<');
        TextBar := '';
        for I := 1 to 20 do
            if I <= Factor then
                TextBar += '█'
            else
                TextBar += '░';
        exit(TextBar);
    end;

    /// <summary>
    /// Calcula a la hora que acabará nuestro proceso
    /// Calculate the time our process will finish.
    /// </summary>
    /// <param name="FechaHoraBase">Hora a la que inició el proceso : DateTime</param>
    /// <param name="LineaProcesada">Cantidad de registros que llevamos procesados : Integer</param>
    /// <param name="Registro">Total de registros a procesar : Integer</param>
    /// <returns>Nueva hora de fin estimada : Text</returns>
    local procedure EstimationEnd2(FechaHoraBase: DateTime; LineaProcesada: Integer; Registro: Integer): Text
    var
        MLTrascurridos: BigInteger;
        MLEstimados: BigInteger;
        NuevaFechaHora: DateTime;
    begin
        MLTrascurridos := CurrentDateTime - FechaHoraBase;
        MLEstimados := Round(MLTrascurridos * (1 / (LineaProcesada / Registro)), 1);

        NuevaFechaHora := FechaHoraBase + MLEstimados;

        exit(Format(DT2Time(NuevaFechaHora)));
    end;
}