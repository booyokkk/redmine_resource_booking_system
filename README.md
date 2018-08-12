# redmine_resource_booking_system
Provides a resource booking system with javascript fullcalendar

  
# Requirements  
------------  
  
* Redmine 3.2.2 (another version will be tested soon)

# Install  
-------  
  
Clone the plugin source code into your Redmines plugin directory:  
  
    git clone https://github.com/aki360P/redmine_resource_booking_system.git  
  
**!NOTICE!** Make sure the plugin directory is named `redmine_resource_booking_system`.  
  
Run the following command from a command line:  
  
    rake redmine:plugins:migrate  
  
# Setup  
-----  
  
Login with your administrator account and go to the admin menu.  
  
## 1. Project Module  
This plugin can be enabled to each project. 
  
## 2. Create Tracker  
Create a new tracker, name it something like 'Booking' and make sure that the standard fields 'Assignee', 'Start date' and 'Due date' are selected and copy the workflow from a already existing tracker (e.g. 'Bug')  
**Name:** Something like 'Booking' (the name does not matter).  
**Default status:** Does not matter, will be overwritten.  
**Issues displayed in roadmap:** No  
**Standard fields:** Assignee, Start date, Due date  
**Copy workflow:** Bug
**Projects:** The projects you want to use for booking
![ScreenShot](https://raw.github.com/aki360P/redmine_resource_booking_system/master/screenshots/01_new_tracker.png)  
  
## 3. Create CustomFields  
Create 3 new custom fields for *Issues*: Resource, Start time, End time.  
  
**!NOTICE!** It is important to use the ISO format for the start and end time custom fields (so 13:00 instead of 1:00pm, And 08:00 instead of 8:00)! 
  
### Resource
**Format:** ~~list~~  Key value list 
**Name:** Something like 'Room' (the name does not matter).  
**Description:** Does not matter.  
**Multiple values:** No  
**Possible values:** A list of rooms you want to be able to book meetings for. This must include *all* possible rooms!  
**Default value:** none  
**Link values to URL:** none  
**Display:** drop-down list  
**Required:** Yes  
**For all projects:** No
**Used as a filter:** Yes  
**Searchable:** Yes  
**Visible:** to any users  
**Trackers:** 'Booking' or whatever you called the tracker you created.  
**Projects:** The projects you want to use for booking.  
![ScreenShot](https://raw.github.com/aki360P/redmine_resource_booking_system/master/screenshots/02_new_customfield1.png)  
  
### Start time  
**Format:** List  
**Name:** Something like 'Start time' (the name does not matter).  
**Description:** Does not matter.  
**Multiple values:** No  
**Possible values:**    
06:00  
06:15  
06:30  
06:45  
07:00  
07:15  
07:30  
07:45  
08:00  
08:15  
08:30  
08:45  
09:00  
09:15  
09:30  
09:45  
10:00  
10:15  
10:30  
10:45  
11:00  
11:15  
11:30  
11:45  
12:00  
12:15  
12:30  
12:45  
13:00  
13:15  
13:30  
13:45  
14:00  
14:15  
14:30  
14:45  
15:00  
15:15  
15:30  
15:45  
16:00  
16:15  
16:30  
16:45  
17:00  
17:15  
17:30  
17:45  
18:00  
18:15  
18:30  
18:45  
19:00  
19:15  
19:30  
19:45  
20:00  
20:15  
20:30  
20:45  
21:00  
**Default value:** none  
**Link values to URL:** none  
**Display:** drop-down list  
**Required:** Yes  
**For all projects:** No  
**Used as a filter:** Yes  
**Searchable:** Yes  
**Visible:** to any users  
**Trackers:** 'Booking' or whatever you called the tracker you created.  
**Projects:** The projects you want to use for booking.  
![ScreenShot](https://raw.github.com/aki360P/redmine_resource_booking_system/master/screenshots/03_new_customfield2.png)  
  
### End time  
refer to Start time
  
  
## 4. Configure Plugin  
Go to the project settings of the projects you created.  
Enable project module "redmine_resource_booking_system" and configure setting as follows.
**Trackers:** 'Booking' (or whatever you called the tracker you created).  
**Resource:** 'Room'    (or whatever you called the custom fields you created).  
**Start time:** 'Start time' (or whatever you called the custom fields you created).  
**End time:** 'End time' (or whatever you called the custom fields you created).
**status booking:** 'new' (or whatever you called the tracker status you created).
**status progress:** 'Assigned' (or whatever you called the tracker status you created).  The issues in this status will be displayed on sidebar. 
**status complete:** 'close' (or whatever you called the tracker status you created).
![ScreenShot](https://raw.github.com/aki360P/redmine_resource_booking_system/master/screenshots/04_project_settings.png)  



## 5. Configure Redmine  
Go to the authentication settings in Admin -> Settings -> Authentication  
* Authentication required
* Enable REST web service

This plugin uses 'issue', 'tracker', 'status' and workflow function, so customization can be done in the redmine original function.



# How it Works  
  
* The plug-in uses a Fullcalendar jQuery plug-in which uses ajax calls to fetch the events.  
* The calendar has a toggleable Month view, ~~ Week view and ~~ Day view on the top right corner; of which the Nonthe view is the default.  
* ~~ Events could be booked also on a recurring basis. The available options are daily, weekly and bi-weekly, in which case the meeting room goes occupied for the specified time range. ~~
* ~~ On the event of an overlap about to occur the calendar itself alerts the scheduler about the issue and in no case will it be possible to book an event ignoring the alert. ~~ 
* The resources are booked with the currently logged in users authorship but can be assigned to another user.
* This plug-in uses Rest-api to view issues with specific tracker in current project.
* This plug-in uses cookie to remember current calendar date, only when 'prev' clicked rest-api function is called.

  
## Calendar  
![ScreenShot](https://raw.github.com/aki360P/redmine_resource_booking_system/master/screenshots/10_calendar_sample.png)  
  
