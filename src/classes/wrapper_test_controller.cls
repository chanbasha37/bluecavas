public with sharing class wrapper_test_controller {
public list<wrapperclass> wrapperelement_for_account{get;set;}
public list<wrapperclass> wrapperelement_for_contact{get;set;}
list<account> object1 = [select id,name from account limit 10];
list<contact> object2 = [select id,name from contact limit 10];

public list<wrapperclass> getaccountwrapperret(){
wrapperelement_for_account = new list<wrapperclass>();
for(account obj1: object1){
wrapperelement_for_account.add(new wrapperclass(obj1));
}
return wrapperelement_for_account;
}
public list<wrapperclass> getcontactwrapperret(){
wrapperelement_for_contact = new list<wrapperclass>();
for(contact obj2: object2){
wrapperelement_for_contact.add(new wrapperclass(obj2));
}
return wrapperelement_for_contact;
}
public class wrapperclass{
public account object_account_1{get;set;}
public contact object_contact_2{get;set;}

public wrapperclass(account obj1){
this.object_account_1 = (obj1);
}
public wrapperclass(contact obj2){
this.object_contact_2 = (obj2);}
}
}