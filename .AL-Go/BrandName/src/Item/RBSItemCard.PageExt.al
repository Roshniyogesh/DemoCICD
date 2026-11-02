pageextension 50100 "RBS Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("RBS Brand Name"; Rec."RBS Brand Name")
            {
                ApplicationArea = All;
            }
        }
    }
}
