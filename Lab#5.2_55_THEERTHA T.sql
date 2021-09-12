create trigger updateAvailableQuantity
after insert on Saleitem
for each row 
update Product set Qtyinstock=Qtyinstock-new.Qty where PdtId=new.PdtId;

show triggers;

