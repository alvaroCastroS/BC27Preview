table 50000 "ATT Test"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; MyField2; Integer)
        {
            DataClassification = ToBeClassified;
            AllowInCustomizations = Never;
        }
        field(3; MyField3; Integer)
        {
            DataClassification = ToBeClassified;
            AllowInCustomizations = AsReadOnly;
        }
        field(4; MyField4; Integer)
        {
            DataClassification = ToBeClassified;
            AllowInCustomizations = AsReadWrite;
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
    }
}