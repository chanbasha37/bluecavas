public class TestController {

        public list<selectoption> allValues{get;set;}
        public list<String> selectedValues{get;set;}

        public TestController(){
            allValues = new List<selectoption>();
            selectedValues = new List<String>();
            allValues.add(new selectoption('One','One'));
            
        }


        public void add(){

        }
    }