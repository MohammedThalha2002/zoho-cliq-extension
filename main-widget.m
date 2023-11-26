
// Set the JIRA API URL
url = "https://mohammed-thalha.atlassian.net/rest/api/3";
params = Map();
connectionName = "jiratesting";
// GET ALL TASKS
tasks = invokeurl
[
	url :url + "/search"
	type :GET
	connection:"jiratesting"
];
// 
elements = list();
// 
tasks = tasks.get("issues");
// GET COLUMNS
columns = list();
for each  task in tasks
{
	col = task.get("fields").get("status").get("name");
	if(!columns.contains(col))
	{
		columns.add(col);
	}
}
// CURRENT COLUMN
columns = reverse(columns);
currentColumn = reverse(columns.get(0));
// // 
currentTaskPath = "";
// To get the current project record
currentprojectId = zoho.cliq.getRecords("currentproject").get("list").get(0).get("projectid");
if(currentprojectId != 0)
{
	// GET CURRENT PROJECT
	currentProject = invokeurl
	[
		url :url + "/project/" + currentprojectId
		type :GET
		connection:"jiratesting"
	];
	currentTaskPath = currentProject.get("name");
}
currentTaskPath = currentTaskPath + " > " + currentColumn;
// HEADER DISPLAY
header = {"title":currentTaskPath,"buttons":{{"label":"Change Project","type":"invoke.function","name":"showProjects","id":"section"}}};
// SHOW DIFFERENT COLUMN TASKS
buttons = list();
for each  val in columns
{
	buttons.add({"label":reverse(val),"type":"invoke.function","name":"buttonone"});
}
elements.add({"type":"buttons","buttons":buttons});
sections = list();
sections.add({"id":1,"elements":elements});
return {"type":"applet","header":header,"tabs":{{"label":"My Tasks","id":"homeTab"}},"active_tab":"homeTab","sections":sections};
