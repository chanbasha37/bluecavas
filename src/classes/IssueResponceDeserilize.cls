/* 
* An Apex Class used as Wrapper class for deseralizing responce from  JiraSfCaseGet class
*/

public class IssueResponceDeserilize{
    public String expand;   //schema,names
    public Integer startAt; //0
    public Integer maxResults;  //50
    public Integer total;   //10
    public cls_issues[] issues;
    class cls_issues {
        public String expand;   //operations,versionedRepresentations,editmeta,changelog,renderedFields
        public String id;   //10102
        public String self; //https://mysfjira.atlassian.net/rest/api/2/issue/10102
        public String key;  //SFCAS-10
        public cls_fields fields;
 
    }
		
	public class cls_fields {
		public cls_issuetype issuetype;
		public cls_timespent timespent;
		public cls_project project;
		public cls_customfield_10110 customfield_10110;
		public cls_fixVersions[] fixVersions;
		public cls_customfield_10111 customfield_10111;
		public cls_aggregatetimespent aggregatetimespent;
		public cls_resolution resolution;
		public cls_customfield_10112 customfield_10112;
		public cls_customfield_10113 customfield_10113;
		public String customfield_10114;	//Not started
		public cls_customfield_10104 customfield_10104;
		public cls_customfield_10105 customfield_10105;
		public cls_customfield_10106 customfield_10106;
		public cls_customfield_10107 customfield_10107;
		public cls_customfield_10108 customfield_10108;
		public cls_customfield_10109 customfield_10109;
		public cls_resolutiondate resolutiondate;
		public Integer workratio;	//-1
		public String lastViewed;	//2017-03-30T22:15:05.888+0530
		public cls_watches watches;
		public String created;	//2017-03-29T17:01:25.572+0530
		public cls_priority priority;
		public cls_customfield_10100 customfield_10100;
		public cls_customfield_10101 customfield_10101;
		public cls_customfield_10102 customfield_10102;
		public cls_customfield_10103 customfield_10103;
		public cls_labels[] labels;
		public cls_timeestimate timeestimate;
		public cls_aggregatetimeoriginalestimate aggregatetimeoriginalestimate;
		public cls_versions[] versions;
		public cls_issuelinks[] issuelinks;
		public cls_assignee assignee;
		public String updated;	//2017-03-30T11:15:48.500+0530
		public cls_status status;
		public cls_components[] components;
		public cls_timeoriginalestimate timeoriginalestimate;
		public String description;	 
		//public cls_description descpription;   
		public cls_timetracking timetracking;
		public cls_customfield_10005 customfield_10005;
		public cls_attachment[] attachment;
		public cls_aggregatetimeestimate aggregatetimeestimate;
		public String summary;	//Testcase1 xxxxx put testing
		public cls_creator creator;
		public cls_subtasks[] subtasks;
		public cls_reporter reporter;
		public String customfield_10000;	//{}
		public cls_aggregateprogress aggregateprogress;
		public cls_customfield_10001 customfield_10001;
		public cls_customfield_10115 customfield_10115;
		public String customfield_10116;	//0|hzzzzz:
		public cls_environment environment;
		public cls_duedate duedate;
		public cls_progress progress;
		public cls_comment comment;
		public cls_votes votes;
		public cls_worklog worklog;
	}
	public class cls_issuetype {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/issuetype/10106
		public String id;	//10106
		public String description;	//Salesforce related cases keeping into Issues
		public String iconUrl;	//https://mysfjira.atlassian.net/secure/viewavatar?size=xsmall&avatarId=10300&avatarType=issuetype
		public String name;	//J SFType
		public boolean subtask;
		public Integer avatarId;	//10300
	}
	class cls_timespent {
	}
	class cls_project {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/project/10000
		public String id;	//10000
		public String key;	//SFCAS
		public String name;	//SfCases
		//public cls_avatarUrls avatarUrls;
	}
 /*	class cls_avatarUrls {
		public String 48x48;	//https://mysfjira.atlassian.net/secure/useravatar?avatarId=10341
		public String 24x24;	//https://mysfjira.atlassian.net/secure/useravatar?size=small&avatarId=10341
		public String 16x16;	//https://mysfjira.atlassian.net/secure/useravatar?size=xsmall&avatarId=10341
		public String 32x32;	//https://mysfjira.atlassian.net/secure/useravatar?size=medium&avatarId=10341
	}   */
	class cls_customfield_10110 {
	}
	class cls_fixVersions {
	}
	class cls_customfield_10111 {
	}
	class cls_aggregatetimespent {
	}
	class cls_resolution {
	}
	class cls_customfield_10112 {
	}
	class cls_customfield_10113 {
	}
	class cls_customfield_10104 {
	}
	class cls_customfield_10105 {
	}
	class cls_customfield_10106 {
	}
	class cls_customfield_10107 {
	}
	class cls_customfield_10108 {
	}
	class cls_customfield_10109 {
	}
	class cls_resolutiondate {
	}
	class cls_watches {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/issue/SFCAS-1/watchers
		public Integer watchCount;	//1
		public boolean isWatching;
	}
	public class cls_priority {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/priority/2
		public String iconUrl;	//https://mysfjira.atlassian.net/images/icons/priorities/high.svg
		public String name;	//High
		public String id;	//2
	}
	class cls_customfield_10100 {
	}
	class cls_customfield_10101 {
	}
	class cls_customfield_10102 {
	}
	class cls_customfield_10103 {
	}
	class cls_labels {
	}
	class cls_timeestimate {
	}
	class cls_aggregatetimeoriginalestimate {
	}
	class cls_versions {
	}
	class cls_issuelinks {
	}
	class cls_assignee {
	}
	public class cls_status {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/status/10000
		public String description;	//
		public String iconUrl;	//https://mysfjira.atlassian.net/
		public String name;	//To Do
		public String id;	//10000
		public cls_statusCategory statusCategory;
	}
	public class cls_statusCategory {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/statuscategory/2
		public Integer id;	//2
		public String key;	//new
		public String colorName;	//blue-gray
		public String name;	//To Do
	}
	class cls_components {
	}
	class cls_timeoriginalestimate {
	}
	class cls_description {
	}
	class cls_timetracking {
	}
	class cls_customfield_10005 {
	}
	class cls_attachment {
	}
	class cls_aggregatetimeestimate {
	}
	class cls_creator {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/user?username=admin
		public String name;	//admin
		public String key;	//admin
		public String emailAddress;	//ng.mounica@gmail.com
		//public cls_avatarUrls avatarUrls;
		public String displayName;	//mounika nunnagopula  [Administrator]
		public boolean active;
		public String timeZone;	//Asia/Kolkata
	}
	class cls_subtasks {
	}
	class cls_reporter {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/user?username=admin
		public String name;	//admin
		public String key;	//admin
		public String emailAddress;	//ng.mounica@gmail.com
	//	public cls_avatarUrls avatarUrls;
		public String displayName;	//mounika nunnagopula  [Administrator]
		public boolean active;
		public String timeZone;	//Asia/Kolkata
	}
	class cls_aggregateprogress {
		public Integer progress;	//0
		public Integer total;	//0
	}
	class cls_customfield_10001 {
	}
	class cls_customfield_10115 {
	}
	class cls_environment {
	}
	class cls_duedate {
	}
	class cls_progress {
		public Integer progress;	//0
		public Integer total;	//0
	}
	class cls_comment {
		public cls_comments[] comments;
		public Integer maxResults;	//0
		public Integer total;	//0
		public Integer startAt;	//0
	}
	class cls_comments {
	}
	class cls_votes {
		public String self;	//https://mysfjira.atlassian.net/rest/api/2/issue/SFCAS-1/votes
		public Integer votes;	//0
		public boolean hasVoted;
	}
	class cls_worklog {
		public Integer startAt;	//0
		public Integer maxResults;	//20
		public Integer total;	//0
		public cls_worklogs[] worklogs;
	}
	class cls_worklogs {
	}
	
	
	 
    
 /*	public static IssueResponceDeserilize parse(String json){
			
	return (IssueResponceDeserilize) System.JSON.deserialize(json, IssueResponceDeserilize.class);
	}   */
	
	

/*	static testMethod void testParse() {
		String json='{"expand":"renderedFields,names,schema,operations,editmeta,changelog,versionedRepresentations","id":"10000","self":"https://mysfjira.atlassian.net/rest/api/2/issue/10000","key":"SFCAS-1","fields":{"issuetype":{"self":"https://mysfjira.atlassian.net/rest/api/2/issuetype/10106","id":"10106","description":"Salesforce related cases keeping into Issues","iconUrl":"https://mysfjira.atlassian.net/secure/viewavatar?size=xsmall&avatarId=10300&avatarType=issuetype","name":"J SFType","subtask":false,"avatarId":10300},"timespent":null,"project":{"self":"https://mysfjira.atlassian.net/rest/api/2/project/10000","id":"10000","key":"SFCAS","name":"SfCases","avatarUrls":{"48x48":"https://mysfjira.atlassian.net/secure/projectavatar?avatarId=10324","24x24":"https://mysfjira.atlassian.net/secure/projectavatar?size=small&avatarId=10324","16x16":"https://mysfjira.atlassian.net/secure/projectavatar?size=xsmall&avatarId=10324","32x32":"https://mysfjira.atlassian.net/secure/projectavatar?size=medium&avatarId=10324"}},"customfield_10110":null,"fixVersions":[],"customfield_10111":null,"aggregatetimespent":null,"resolution":null,"customfield_10112":null,"customfield_10113":null,"customfield_10114":"Not started","customfield_10104":null,"customfield_10105":null,"customfield_10106":null,"customfield_10107":null,"customfield_10108":null,"customfield_10109":null,"resolutiondate":null,"workratio":-1,"lastViewed":"2017-03-30T22:15:05.888+0530","watches":{"self":"https://mysfjira.atlassian.net/rest/api/2/issue/SFCAS-1/watchers","watchCount":1,"isWatching":true},"created":"2017-03-29T17:01:25.572+0530","priority":{"self":"https://mysfjira.atlassian.net/rest/api/2/priority/2","iconUrl":"https://mysfjira.atlassian.net/images/icons/priorities/high.svg","name":"High","id":"2"},"customfield_10100":null,"customfield_10101":null,"customfield_10102":null,"customfield_10103":null,"labels":[],"timeestimate":null,"aggregatetimeoriginalestimate":null,"versions":[],"issuelinks":[],"assignee":null,"updated":"2017-03-30T11:15:48.500+0530","status":{"self":"https://mysfjira.atlassian.net/rest/api/2/status/10000","description":"","iconUrl":"https://mysfjira.atlassian.net/","name":"To Do","id":"10000","statusCategory":{"self":"https://mysfjira.atlassian.net/rest/api/2/statuscategory/2","id":2,"key":"new","colorName":"blue-gray","name":"To Do"}},"components":[],"timeoriginalestimate":null,"description":null,"timetracking":{},"customfield_10005":null,"attachment":[],"aggregatetimeestimate":null,"summary":"Testcase1 xxxxx put testing","creator":{"self":"https://mysfjira.atlassian.net/rest/api/2/user?username=admin","name":"admin","key":"admin","emailAddress":"ng.mounica@gmail.com","avatarUrls":{"48x48":"https://mysfjira.atlassian.net/secure/useravatar?avatarId=10341","24x24":"https://mysfjira.atlassian.net/secure/useravatar?size=small&avatarId=10341","16x16":"https://mysfjira.atlassian.net/secure/useravatar?size=xsmall&avatarId=10341","32x32":"https://mysfjira.atlassian.net/secure/useravatar?size=medium&avatarId=10341"},"displayName":"mounika nunnagopula  [Administrator]","active":true,"timeZone":"Asia/Kolkata"},"subtasks":[],"reporter":{"self":"https://mysfjira.atlassian.net/rest/api/2/user?username=admin","name":"admin","key":"admin","emailAddress":"ng.mounica@gmail.com","avatarUrls":{"48x48":"https://mysfjira.atlassian.net/secure/useravatar?avatarId=10341","24x24":"https://mysfjira.atlassian.net/secure/useravatar?size=small&avatarId=10341","16x16":"https://mysfjira.atlassian.net/secure/useravatar?size=xsmall&avatarId=10341","32x32":"https://mysfjira.atlassian.net/secure/useravatar?size=medium&avatarId=10341"},"displayName":"mounika nunnagopula  [Administrator]","active":true,"timeZone":"Asia/Kolkata"},"customfield_10000":"{}","aggregateprogress":{"progress":0,"total":0},"customfield_10001":null,"customfield_10115":null,"customfield_10116":"0|hzzzzz:","environment":null,"duedate":null,"progress":{"progress":0,"total":0},"comment":{"comments":[],"maxResults":0,"total":0,"startAt":0},"votes":{"self":"https://mysfjira.atlassian.net/rest/api/2/issue/SFCAS-1/votes","votes":0,"hasVoted":false},"worklog":{"startAt":0,"maxResults":20,"total":0,"worklogs":[]}}}';
		IssueResponceDeserilize obj = parse(json);
		System.assert(obj != null);
	}   */
}