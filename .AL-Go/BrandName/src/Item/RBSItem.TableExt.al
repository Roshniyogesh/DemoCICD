tableextension 50100 "RBS Item" extends Item
{
    fields
    {
        field(50100; "RBS Brand Name"; Text[50])
        {
            Caption = 'Brand Name';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the brand name of the item. It is copied to sales order lines when the item is selected.';
        }
    }
}
