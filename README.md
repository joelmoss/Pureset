# PURESET

> A personal, project and organizational task manager

Pureset is built upon the idea that no matter what kind of task management you use, each task is
essentially the same thing; simply a unit of work - be that a project, a bug or a ToDo.

A ticket is a bug, a bug is a task, a task is a ToDo...

So if the above is true, and everything in Pureset is a task, then we can begin to create
experiences for any type of task.


## Project Types

A task could be a software bug, or it could be a marketing task. Because of this, a Project must be
defined as a particular type. For example, a software development project, or a marketing project.

Once this is known about the project, each of it's tasks can then be customised accordingly.

For example, a task in a Software Development Project could require additional approval before it
can be closed and marked as done, such as QA or a code review.

 - Project (default)
 - Software Development Project



## Task Contexts

Every task is based upon the context they were created within. For example, if an task is created
while looking at a project, then that task will be automatically associated with that project, and
will have a context of "project".

The following contexts exist:

 - User
 - Project
 - Organization

### User Context

Tasks created with a User context have a type of "ToDo", and consist of a "Summary" as a minimum.
They are intended as a personal ToDo list.

### Project Context

A Project context based task requires a summary, and can be one of the following types:

 - Task (default)
 - Bug
 - User Story ?


## Task States - Open or Closed?

Every task is either Open or Closed, and every task has one State. The available states will vary
depending on whether the Task is open or closed.

 - Open
   - ToDo (default)
   - Doing
 - Closed
   - Done (default)
   - Duplicate - requires another task ID as a reference
   - Won't do - requires a reason (as a comment?)
