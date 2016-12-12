# Covalent

* Heroku link: http://covalent-beta1.herokuapp.com


Covalent is an application designed for HR professionals and/or Industrial Psychologists.
It was created with Ruby on Rails as a platform for creating dynamic, relational surveys
(think performance reviews). A researcher signs up, creates a study and then
generates two sign up links: one for managers and one for employees.

When the manager clicks the sign up link they are auto-associated with the study
via URL parsing. When an employee clicks the sign up link they are also automatically
associated with the study, and then choose their manager from the list of signed-up
managers.

The researcher can then create surveys for both groups of people: Employees and
Managers. The researcher can then choose which survey to activate for each group.
When Managers sign in, and there is an active survey, they then proceed to fill
it out for each employee via intuitive tabs for each employee. The employee
fills out one copy of the active employee survey for their one manager.

The researcher can switch the active at any time. When the researcher
is ready they can first view every entry a manager has made for all of his
employees as a barchart by clicking on his name in the Study Dashboard. The
researcher can tab through every Survey the manager responded to and then click
through all of that manager's employees to see how they responded over time.
Each employee's response can also be viewed.

The researcher then has the option to download individual employee data, individual
manager data, all employee data, all manager data, or all employee/manager data
to an excel spreadsheet. Each worksheet on the spreadsheet corresponds to a
different survey.

Covalent utilizes extensive jQuery and data structure
manipulation to allow for data visualization and the ability to create, visualize,
and download survey data to excel spreadsheets.
