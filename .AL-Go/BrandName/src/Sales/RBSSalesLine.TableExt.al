tableextension 50101 "RBS Sales Line" extends "Sales Line"
{
    fields
    {
        field(50100; "RBS Brand Name"; Text[50])
        {
            Caption = 'Brand Name';
            DataClassification = CustomerContent;
            Editable = false;
            ToolTip = 'Specifies the brand name of the item on the line, copied from the item card.';
        }
    }
}
