codeunit 50100 "RBS Brand Name Mgt."
{
    // Copies the item's Brand Name to the sales line.
    // Called from the event subscriber; publishes OnBefore/OnAfter events for other extensions.

    procedure CopyBrandNameToSalesLine(var SalesLine: Record "Sales Line"; Item: Record Item)
    var
        IsHandled: Boolean;
    begin
        OnBeforeCopyBrandNameToSalesLine(SalesLine, Item, IsHandled);
        if IsHandled then
            exit;

        SalesLine."RBS Brand Name" := Item."RBS Brand Name";

        OnAfterCopyBrandNameToSalesLine(SalesLine, Item);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCopyBrandNameToSalesLine(var SalesLine: Record "Sales Line"; Item: Record Item; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyBrandNameToSalesLine(var SalesLine: Record "Sales Line"; Item: Record Item)
    begin
    end;
}
