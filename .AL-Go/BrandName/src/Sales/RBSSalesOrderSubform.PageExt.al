pageextension 50101 "RBS Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field("RBS Brand Name"; Rec."RBS Brand Name")
            {
                ApplicationArea = All;
            }
        }
    }
}
