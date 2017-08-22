public class prodSearchController {
        
  String pub = null;
  String renderSelectPub = 'true' ;
  String renderSelectCard = 'false' ;
        
  public PageReference selectPub() {
       
        renderSelectPub = 'false' ;
        renderSelectCard = 'true' ;
        return null;
  }
           
public List<SelectOption> getDistinctPubs() {
    Set<String> pubSet = new Set<String>();

    for (Product2 p: [select Family,ProductCode from Product2]) {
        pubSet.add(p.ProductCode + ' - ' + p.Family) ;
        }

    List<SelectOption> options = new List<SelectOption>();

    for (String pub1 : pubSet) {
        options.add(new SelectOption(pub1,pub1));
    }
    return options ;
}

                  
  public String getPub() {
              return pub;
          }
         
          public String getRenderSelectPub() {
          return renderSelectPub ;
          }
         
          public String getRenderSelectCard() {
          return renderSelectCard ;
          }
         
                  
  public void setPub(String pub) { this.pub = pub; }
 }