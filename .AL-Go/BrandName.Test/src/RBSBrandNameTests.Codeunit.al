codeunit 50150 "RBS Brand Name Tests"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit "Library Assert";
        LibraryInventory: Codeunit "Library - Inventory";
        LibrarySales: Codeunit "Library - Sales";
        BrandNameTok: Label 'CONTOSO', Locked = true;

    [Test]
    procedure BrandNameFlowsFromItemToSalesOrderLine()
    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        // [GIVEN] An item with a Brand Name
        LibraryInventory.CreateItem(Item);
        Item."RBS Brand Name" := BrandNameTok;
        Item.Modify();

        // [WHEN] The item is entered on a sales order line
        LibrarySales.CreateSalesHeader(SalesHeader, SalesHeader."Document Type"::Order, LibrarySales.CreateCustomerNo());
        LibrarySales.CreateSalesLine(SalesLine, SalesHeader, SalesLine.Type::Item, Item."No.", 1);

        // [THEN] The line carries the item's Brand Name
        Assert.AreEqual(BrandNameTok, SalesLine."RBS Brand Name", 'Brand Name was not copied to the sales line.');
    end;

    [Test]
    procedure BrandNameIsEmptyForItemWithoutBrand()
    var
        Item: Record Item;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        // [GIVEN] An item without a Brand Name
        LibraryInventory.CreateItem(Item);

        // [WHEN] The item is entered on a sales order line
        LibrarySales.CreateSalesHeader(SalesHeader, SalesHeader."Document Type"::Order, LibrarySales.CreateCustomerNo());
        LibrarySales.CreateSalesLine(SalesLine, SalesHeader, SalesLine.Type::Item, Item."No.", 1);

        // [THEN] The line's Brand Name is empty
        Assert.AreEqual('', SalesLine."RBS Brand Name", 'Brand Name should be empty.');
    end;
}
