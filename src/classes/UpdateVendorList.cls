public class UpdateVendorList {
    
    public UpdateVendorList(ApexPages.StandardSetController controller) {

    }
   
    /**********   Vendor's list will update according to seller's list products  ***************/
    public static void vendorUpdate(){ 
        
        List<VendorProductList__c> VendorList = [SELECT id,Name,Product_ID__c,Availability__c,Product_Category__c,
                                                 Product_Description__c from VendorProductList__c];
        List<SellerProductList__c> SellerList = [SELECT id,Name,Product_ID__c,Availability__c,Product_Category__c,
                                                 Product_Description__c from SellerProductList__c];
        List<VendorProductList__c> NewVendorList = new List<VendorProductList__c>();
        VendorProductList__c tmp = new VendorProductList__c();
        system.debug(VendorList + 'Vendooooooooooooooooooor');
        system.debug(SellerList + 'Selleeeeeeeeeeeeeeeeeeer');
        
           for(SellerProductList__c sp : SellerList){
             boolean recordfound = False;
              for(VendorProductList__c vp : VendorList){
                if(vp.Name == sp.Name && vp.Product_ID__c == sp.Product_ID__c){
                   recordFound=True;                 
            }    
            }
            if(recordFound==false){
                 VendorProductList__c vendorObject = new VendorProductList__c();
         //           vendorObject.Id                  = sp.Id; 
                    vendorObject.Name                = sp.Name ;   
                    vendorObject.Availability__c     = sp.Availability__c;
                    vendorObject.Product_ID__c       = sp.Product_ID__c ; 
                    vendorObject.Product_Category__c = sp.Product_Category__c;
                    vendorObject.Product_Description__c = sp.Product_Description__c;
                    NewVendorList.add(vendorObject);    
            }
             else{
                    system.debug('No new record to insert');
                }
        }
        insert NewVendorList;
    } 
    
    
    /************ Seller list will update according to vendor list products  **************/
     public static void sellerUpdate(){ 

        List<VendorProductList__c> VendorList = [SELECT id,Name,Product_ID__c,Availability__c,Product_Category__c,
                                                 Product_Description__c from VendorProductList__c];
        List<SellerProductList__c> SellerList = [SELECT id,Name,Product_ID__c,Availability__c,Product_Category__c,
                                                 Product_Description__c from SellerProductList__c];
        List<SellerProductList__c> NewSellerList = new List<SellerProductList__c>();
        VendorProductList__c tmp = new VendorProductList__c();
        system.debug(VendorList + 'Vendooooooooooooooooooor');
        system.debug(SellerList + 'Selleeeeeeeeeeeeeeeeeeer');
        
        for(VendorProductList__c vp : VendorList){
         boolean recordFound = False;
          for(SellerProductList__c sp : SellerList){
             if(sp.Product_ID__c == vp.Product_ID__c && sp.Name == vp.Name){
                recordFound=True;  
               }
              }

              if(recordfound == False){
                    SellerProductList__c sellerObject = new SellerProductList__c();
            //      sellerObject.Id                  = vp.Id; 
                    sellerObject.Name                = vp.Name ;   
                    sellerObject.Availability__c     = vp.Availability__c;
                    sellerObject.Product_ID__c       = vp.Product_ID__c ; 
                    sellerObject.Product_Category__c = vp.Product_Category__c;
                    sellerObject.Product_Description__c = vp.Product_Description__c;
                    NewSellerList.add(sellerObject);                     
            }
                else{
                    system.debug('No new record to insert');
                }
            
        }
        insert NewSellerList;
    }  
}