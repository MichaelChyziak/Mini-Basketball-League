

## Running Locally

To create a database:
Follow the steps provided in Bobby's "Local setup - databases" (option 2) pdf on his site [link](http://www.cs.sfu.ca/CourseCentral/276/bobbyc/n/tutorials/database-for-local-development.pdf)

To migrate databases:
```
$ rake db:migrate
```

Now running "heroku local web" should work properly

## Users for Login

Regular users:

email: "user1@example.com", password: "useruser1"<br>
email: "user2@example.com", password: "useruser2"<br>
email: "user3@example.com", password: "useruser3"<br>
email: "user4@example.com", password: "useruser4"<br>
email: "user5@example.com", password: "useruser5"<br>
email: "user6@example.com", password: "useruser6"<br>
email: "user7@example.com", password: "useruser7"<br>
email: "user8@example.com", password: "useruser8"<br>
email: "user9@example.com", password: "useruser9"<br>

Admin:

email: "admin@xyz.com", password: "notadmin"


#Iteration 1

Requirement Document Overview (Iteration 1)

Document Header
Mini Basketball League
Requirements and Specification Document 
06/20/2016, version 0.1

Project Abstract 
The webapp that our team will be creating is called, “Mini Basketball League” (MBL) and it targets basketball players of all ages and skill levels. Each player will have their own profile page where they can display their basketball-related information. Players can decide to create or join a team by clicking the appropriate button on the homepage. After forming a team, the captain can choose which league their team should be in based on the players’ skill levels. The software also allows teams to send invitations to each other and organize a time and location for their game with the help of Google Calendar and Google Map APIs. After each game, the database will be updated and users can post their recorded game highlights in the form of a link from Youtube. Added features may also include MVP (most valuable player) or championship trophies if time allows. A twitter-like social media platform (or an embedded Twitter stream) will be implemented. This  will allow players to post and view updates regarding their team, other teams and games.

Customer 
The type of customer which would be expected for MBL would be mostly basketball players of all skill levels who are looking to play competitive games with others who are also at their skill level. Another type of customer would be the site administrators (which can also be players) who are willing to help maintain responsibilities of the site. Other customers may wish to create a team and manage the team.

Competitive Analysis 
This app is a combination of NBA fantasy league game and real-time event organizer, which gathers people within a community to play real sport. There are currently little to none competitors that is doing this so MBL is in a niche market. The closest alternative would be organized team leagues in which a fee is required to play. The key attraction for MBL is to provide users with the similar experience to what professional basketball players may have. The ability to showcase oneself and play for a team in a well-organized league is the dream of every competitive basketball fan.

User Stories  
The actors for this app are administrators and regular users. In order to increase the amount of code and because of our unfamiliarity with Ruby on Rails, we decided to not write tests before writing code (as is the case in extreme programming) and instead focused on manually testing (with other group members) for working code. This uses a similar principle to pair programming (but instead with 5 members) to ensure that code is error proof. Therefore for this iteration while there are basic tests that were created and passed which were hard to test, the rest were tested manually as a group. Regular and administrative users have been created for this iteration and they can be used for the login. The login information can be found in the README file.

<p style="color:blue">Blue = Iteration 1</p>
<p style="color:red">Red = Iteration 2</p>
<p style="color:purple">Purple = Iteration 3</p>

<p style="color:blue">
Any user that is not logged in will always be redirected to the login page with the exception of going to the “About” page which is on the menu bar.  If a user tries to manually input a URL that only logged in users can see they will be also redirected to the login page.

A registered user will be able to log in from the login page as either an admin or normal user. An unsuccessful login will redirect to the login page and issue an error. Upon successful login the user will be redirected to the home page. The home page for normal users will show the menu bar with “Login” now replaced with a dropdown of “My Account” which features their profile, their team (if they have one), and an option to logout. Apart from the change in the menu bar, the home page will have two buttons in the middle, a “Create Team” button and a “Join Team” button. An Admin will have the same view as a regular user with the exception of an extra “Manage Teams” button.

When a user views their profile from the dropdown in the menu bar they will be brought to a page showing their username and their email.

When a user has joined a team and selects “My Team” in the menu bar under “My Account” they will be taken to their team page. If the users team were to be deleted then the “My Team” option would not appear on the dropdown list. 

All users can view any team’s page which will show the name of the team, the league of the team, the number of users, and the users’ names. Under that is a link labeled “Back” that will return the user to the previous page that they were on. However, if the user that is viewing the page is part of the team another link will be available labeled “Leave Team” which will allow the user to leave the team. Doing so will redirect the user to the same page but with a few changes. The “My Team” in the “My Account” dropdown will be gone for the user as well as a warning message will show that the user has left the team. Also the number of users on a team will decrease as well as the name of the user who left will be removed from the users list. If there are no users part of the team, the “User” label will not be displayed.

A user can create a team by pressing the “Create Team” button on the home page and be redirected to a page asking for the team name and the team league the user wants to be in. The team name must be equal to or less than 30 characters and the team league can be selected from the dropdown menu. The user can press the “Create Team” button to create the team or “Back” to return to the home page. If the user is part of a team they will redirected to the home page after pressing “Create Team” and will be given message as to why. Otherwise the user will go to their new team’s page but instead of a “Back” and “Leave Team” link there will only be a “Continue” link which will bring the user back to the home page.

If a user presses the “Join Team” button on the home page they will be brought to a table of Approved/Pending/Declined Teams which they can either press “Join” to join the team and be added to the team or to press “Details”. Both options will redirect the user to the team’s page. 

If an admin presses the “Manage Teams” button on the home page (which is only visible to the admin) then they are brought to a similar table as the one seen when “Join Team” is pressed. However this time instead the links available are “Details” (which does the same thing that it does in the join team page), “Edit”, “Delete” and also “Approve” and “Decline” if the team is in the pending teams table. Pressing edit will bring the admin to a page allowing them to edit the team’s name or league and to update it or to view the team again or return back to the previous page. If the admin updates the team then they will be redirected to the new team’s page after doing so. If the admin presses “Delete” then simply the team will be deleted and all users who were part of the team will no longer be part of it and can freely join or create another team. If the admin selects “Approve” then the team will move to the approved teams table and the same happens if the admin selects “Decline”. Once a team is approved or declined it cannot be switched back.
</p>
Future Iteration Stories
Below are some point form stories which might possibly be developed.
A non-registered user would be able to sign up directly from the web interface, and confirm their email right away 
A registered user would be able to edit their profile
An admin user would be able to delete, and edit registered users’ profile
The user who creates the team is designated as team manager and can edit the team’s attributes
The team manager can accept or decline users wanting to join their team
Once 8 teams of a certain league are approved, they will be matched against each other in the Schedule Page
Scores of the games and teams’ overall performance will be available in the Scores page
Admins will be able to write a message to all users on the home page
After teams are matched up, team manager will be able to select where the matchup will take place from the available basketball courts



# Project proposal

##Introduction

The web application that our team will be creating is called, “Mini Basketball League” (MBL) and it targets basketball players of all ages and skill levels. The closest alternatives to this app are recreational leagues which require a payment and event-matching apps which take people of similar interests and matches them together to do activities. Sometimes, when players want to go out and play, their friends may not be available. Our app will allow players to get in touch with others around the area to host or join a basketball game, join a team etc. By gamifying the process of finding people and places to play basketball, players have fun not just while playing basketball, but also before and after.

##Scope, Stories, and Features

MBL provides a community for amateur basketball players and gets them involved in a mini-league simulating the NBA. A twitter-like social media platform will be implemented allowing for updates on games and leagues to be known. When a user first opens the web application, they have the option to login or create a new account. Every player will have their own profile to showcase their basketball related information, the ability to choose their desired team to join, or the option to form their own team by posting a status to recruit other players. Existing users who are not yet a member of a team can send a request to the captain of the team that they would like to join. Alternatively, these users may also choose to create a new team and be the captain of that team. Users can be a member of only one team at a time. An existing user who is a member of a team can choose to quit their team and join another only if their team is not in a league. An existing user who is the captain of their team can accept requests submitted by other users who would like to join their team. The administrator has the ability to delete any user that violates the rules and can also view and edit the database containing all users’ information. Furthermore, the administrator can accept scores and updates submitted by users.

When a team is formed, three types of basketball leagues will be available to choose from, these are beginners, intermediate, and competitors. The captain will represent the team and pick a league based on their team’s level. Once a league has enough teams, each team’s representative will send invitations to each other and set up the time and location of their game with the help of Google Calendar and Google Maps APIs. Pick-up games can also be done for players who are just looking for a quick game with others who are in a close enough proximity to them. There will also be a database available for each league to record overall standings and scores. After each game, the database will be updated and users can post their recorded game highlights in the form of a link from Youtube. Added features may also include MVP (most valuable player) or championship trophies if time allows.

## First Iteration

One of the requirements going forward for the first iteration is to implement a login or sign up screen when the user goes onto our web application. Another requirement is that after the login, there will be the main page that allows the user to edit his/her profile. The last requirement is to implement a feature to allow a user to create a team or to join an existing team.

