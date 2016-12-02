# Pureset

> A task manager for *
>   Personal ToDo
>   Project Manager
>   Bug Tracker
>   Task Manager

Pureset is built upon the idea that no matter what kind of task management you use, each task is
essentially the same thing; simply a unit of work - be that a project, a bug or simply a ToDo.

A ticket is a bug, a bug is a task, a task is a ToDo...

So if the above is true, and everything in Pureset is a task, then we can begin to create
experiences for any type of task.



# Modes
Pureset has several modes that can be used at any time, and by anyone. Each issue belongs to a mode,
and is tailored to that mode. For example, the Software Development Mode may feature bugs, tasks,
versions and QA.

The default mode is a regular task manager or ToDo list.

The following Modes are available:
 - Personal ToDo list (default)
 - Software Development
 - Project Management
 - Marketing


## For Developers

- As close to your code as possible
- Single project, multiple source control repos
- Tight integration with Github
  - PR's
  - Releases

## For Product Managers

- ?

## For QA engineers

- What issues need QA?
- Separate QA feedback loop
-

## For everyone

- Issues can be public to all, or private to those you mention
- Sub-tasks
- Convert issue into a milestone
- User assignments
- Labels (Github-style)
- powerful searching and filtering, with ability to remember searches
- Github style mentions
- bots?
- plugins: enable certain features with plugins (eg. QA workflow)
- User dashboard
  - What am I working on right now?
  - What's next?

## For indivuduals

states:
  todo
  doing
  done

### State exclusive labels
Labels that can only be used on a task with a specific state.

### Generic Labels




## URL Schema

/username
/username/project


## Schema

### Account

An Account must be one of a User or Organisation, and has the following fields:
  - username [string]
  - name [string]

#### User

In addition to the above (Account) fields, a User has the following fields:
  - password [string]
  - email [string]

You must be a registered user to have any kind of write access.

#### Organisation

In addition to the above (Account) fields, an Organisation has the following fields:
  - email [string] optional
  - description [string]

##### Teams

An Organisation is associated with one or more teams. The Owner team is required and cannot be
removed. Users who are not members of a team, cannot create or edit tasks. A Team is assigned
to one or more projects within the Organisation, or can be assigned to all projects.

All team members have read access to all their assigned projects.

A Team has the following fields:
  - name [string]
  - description [string] optional
  - permission [bitmask:read|write|admin] default:read

Permissions are described as follows:
  - create issues
  - edit issues
  - comment

Team Roles:
  - User: [default] read-only. Only applicable to private projects, as all users have read access
    to public projects.
  - Member: As above, plus create and edit permissions.
  - Project Admin: As above, plus create and edit permissions. Also has permission to modify
    configuration of assigned projects.

The Owner Team cannot be removed. Owners can create and edit. Also has permission to modify
configuration of the Organisation and all projects within it.


### Projects

Everything starts with a Project. A Project has the following fields:
  - name [string]
  - description [string]
  - owner [ref:account]

#### Visibility

A project is either public or private.

A private project is not visible to users who are not a project collaborator in the case of a User
Project, or a member of at least one Team in the case of an Organisation Project.

A public project is visible to all, including anonymous users (ie. not registered).


### Issues

A Project can have many Issues. An Issue must be either Open or Closed.

#### Pull Requests

- Every PR must "fix" one or more issues.
- An issue cannot be completed ("done") until all fixing PR's are merged and deployed.

#### Statuses

An Issue has a single status which is mutable. Possible statuses are:
  - In Development
  - In QA
  - Done
  - None

Furthermore, an Issue has a checklist of items that must be checked before it can be completed.
  - Dev Complete
  - Dev Approved
  - QA Approved
  - Deployed
  - Production Verified

#### Priorities

An Issue can be given one priority:
  - Showstopper
  - Urgent
  - High

#### Assignment

An Issue is either assigned or unassigned. If assigned, it is associated with a single user. That
user must be a Team Member or Project Collaborator.

#### Visibility

Issues are either public or private. But if an Issue is part of a Private Project, it cannot be
public.

Public Issues are visible to all, and registered users can create Issues and leave Comments.

Private Issues are only visible to users who are a Project Collaborator in the case of a User
Project, or a team member in the case of an Organisation Project.

#### Labels

An Issue can have Github-like Labels.

#### Comments

A comment is exactly as it sounds. Any comment that is not a reply to an existing comment will start
a new discussion or thread.

#### Tasks

Tasks are smaller items that require further action, and have a completed state. They form part of
an Issue. An Issue cannot be closed until all its Tasks are completed.

##### Assignment

Like an Issue, a Task is either assigned or unassigned. If unassigned, it is assumed to be assigned
to the Issue assignee, but it can be assigned to any other user. That user must be a Team Member or
Project Collaborator.

# Questions/Responses

A task may need have a question, and therefore will need a response from one or more people. And
this is often needed before any further progress can be made, this blocking the task. A task can
be marked as needing a response, placing it on hold (blocked), and assigning to one or more users
who need to respond or take action