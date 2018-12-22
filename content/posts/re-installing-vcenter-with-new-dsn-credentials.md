---
author: Roman Tarnavski
categories:
  - technology
date: 2010-01-13 12:57:56
dsq_thread_id:
  - '75453266'
excerpt: How to clear MSDB Database jobs so that vCenter can re-use the an ODBC connection after a previous owner.
guid: http://www.romant.net/?p=285
id: 285
permalink: /technology/re-installing-vcenter-with-new-dsn-credentials/
tags:
  - job_name
  - msdb
  - odbc
  - sp_delete_job
  - vcenter
  - vmware
title: Re-Installing vCenter with new DSN credentials
url: /2010/01/13/re-installing-vcenter-with-new-dsn-credentials/
---

If you're ever in a situation where you've moved the vCenter database, and have actually changed the login details for the database that the DSN points to, and you're using SQL Server. Then upon re-installing vCenter, you will be greeted with:

> "Database job \[Past day stats rollupvcenter] was created by another user. Please use the same user to setup your DSN or remove the job. ODBC Error: [Microsoft\]\[SQL Native Client\][SQL Server]The specified @job_name ('Past Day stats rollupvcenter') does not exist.

<figure>
  <img src="/images/2010/01/vCenter_Install.png">
  <figcaption>Source: IDC 2010 SMO Analysis | repurposed</figcaption>
</figure>

When vCenter is first installed, it schedules jobs with the help of the system DB - MSDB. What's left to do, is just remove the jobs created by the previous dbo of your vCenter data. You achieve this by first listing what jobs are created on the SQL Server.

```sql
SELECT [job_id],
[originating_server_id],
[name],
[enabled],
[description],
[start_step_id],
[category_id],
[owner_sid],
[notify_level_eventlog],
[notify_level_email],
[notify_level_netsend],
[notify_level_page],
[notify_email_operator_id],
[notify_netsend_operator_id],
[notify_page_operator_id],
[delete_level],
[date_created],
[date_modified],
[version_number]
FROM [msdb].[dbo].[sysjobs]
```

![](/images/2010/01/sql_server.png)

As you can see, four scheduled operations exist. Thankfully you don't have to worry about just clearing this table, as there's a stored procedure that comes within MSDB → `sp_delete_job`

Run it for each of the jobs, and you'll be ready to continue installing vCenter.