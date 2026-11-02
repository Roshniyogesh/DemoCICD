codeunit 50101 "RBS Sales Event Subscribers"
{
    // Thin subscriber: delegates straight to the management codeunit.
    // OnAfterAssignItemValues fires when an item No. is validated on a sales line.
    // When the No. changes, the base app re-initialises the line, so the field is cleared automatically
    // for non-item lines.

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterAssignItemValues', '', false, false)]
    local procedure SalesLineOnAfterAssignItemValues(var SalesLine: Record "Sales Line"; Item: Record Item)
    var
        BrandNameMgt: Codeunit "RBS Brand Name Mgt.";
    begin
        BrandNameMgt.CopyBrandNameToSalesLine(SalesLine, Item);
    end;
}
