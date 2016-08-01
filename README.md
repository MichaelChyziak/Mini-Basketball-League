

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

username: "user1", password: "useruser1"<br>
username: "user2", password: "useruser2"<br>
username: "user3", password: "useruser3"<br>
username: "user4", password: "useruser4"<br>
username: "user5", password: "useruser5"<br>
username: "user6", password: "useruser6"<br>
username: "user7", password: "useruser7"<br>
username: "user8", password: "useruser8"<br>
username: "user9", password: "useruser9"<br>

Admin:

username: "admin", password: "notadmin"

#Iteration 3

Requirement Document Overview (Iteration 3)

Document Header
Mini Basketball League
Requirements and Specification Document
06/20/2016, version 0.1
07/11/2016, version 0.2
07/11/2016, version 0.2.1 (Bug Fix)
08/01/2016, version 1.0

Project Abstract
The webapp that our team will be creating is called, “Mini Basketball League” (MBL) and it targets basketball players of all ages and skill levels. Each player will have their own profile page where they can display their basketball-related information. Players can decide to create or join a team by clicking the appropriate button on the homepage. After forming a team, the captain can choose which league their team should be in based on the players’ skill levels. The software also allows teams to send invitations to each other and organize a time and location for their game with the help of Google Calendar and Google Map APIs. After each game, the database will be updated and users can post their recorded game highlights in the form of a link from Youtube. Added features may also include MVP (most valuable player) or championship trophies if time allows. A twitter-like social media platform (or an embedded Twitter stream) will be implemented. This  will allow players to post and view updates regarding their team, other teams and games.

Customer
The type of customer which would be expected for MBL would be mostly basketball players of all skill levels who are looking to play competitive games with others who are also at their skill level. Another type of customer would be the site administrators (which can also be players) who are willing to help maintain responsibilities of the site. Other customers may wish to create a team and manage the team.

Competitive Analysis
This app is a combination of NBA fantasy league game and real-time event organizer, which gathers people within a community to play real sport. There are currently little to none competitors that is doing this so MBL is in a niche market. The closest alternative would be organized team leagues in which a fee is required to play. The key attraction for MBL is to provide users with the similar experience to what professional basketball players may have. The ability to showcase oneself and play for a team in a well-organized league is the dream of every competitive basketball fan.

User Stories  
The actors for this app are administrators and regular users. In order to increase the amount of code and because of our unfamiliarity with Ruby on Rails, we decided to not write tests before writing code (as is the case in extreme programming) and instead focused on manually testing (with other group members) for working code for the first iteration. The second iteration includes tests, although things that we had trouble testing we did manually again. However, all of the stories below have been tested through very detailed named tests or manual tests. The manual testing uses a similar principle to pair programming (but instead with 5 members) to ensure that code is error proof. Regular and administrative users have been created for the first iteration and users which are captains of teams have special privileges in some areas (which was added in the second iteration). The login information can be found in the README file. The first iteration was calculated as 14 points (all of the blue stories) over the span of 17 days which meant a velocity of approximately 5.76/week. For iteration 2 we had a span 21 days to cover all of the stories (in red) which was calculated as 18 which gives us a new velocity of approximately 6/week. While this only seems like a small improvement, what is not so clear is that a lot more time was spent on actually creating tests to cover both iteration 1 and 2 during these last 21 days. Therefore if the effort to write the tests was included as part of the velocity calculation it would be much higher. For iteration 3 the goal is to reach at least a velocity of 7/week. For iteration 3 we were able to do 18 points worth over the 21 day period, giving a velocity of 6/week, just exactly the same as in iteration 2. For both iterations we wrote tests but the only reason for the stagnant velocities over those two iterations is that for iteration 2 we could leave some stories as half complete and to be improved later on but for iteration 3 we needed all stories fully complete and tested. The app uses two API’s which are the Twitter and Google Maps API’s. The Twitter API is just for the home page to display any relevant tweets with the specific hashtag. The Google Maps API is used multiple times in order to show users what location their games will be played at.

Blue = Iteration 1
Red = Iteration 2
Purple = Iteration 3

A non-registered user can sign up directly from the web interface. They can click on the “Sign up” link on the login page to be redirected to the signup form. The form prompts the user to enter their username, email, password and a password confirmation. If the user signs up successfully, they will be signed in and redirected to their profile page where they will be greeted with a welcome message. If the user submits an invalid signup form, error messages will appear near the top of the page where the user can see them and attempt to sign up again. Users cannot create an account with a username or email that have already been used before. The password must also be a minimum of six characters long.

Any user that is not logged in will always be redirected to the login page with the exception of going to the “About” page which is on the menu bar.  If a user tries to manually input a URL that only logged in users can see they will be also redirected to the login page.

A registered user will be able to log in from the login page as either an admin or normal user. An unsuccessful login will redirect to the login page and issue an error. Upon successful login the user will be redirected to the home page. The home page for normal users will show the menu bar with “Login” now replaced with a dropdown of “My Account” which features their profile, their team (if they have one), and an option to logout. Apart from the change in the menu bar, the home page will have two buttons in the middle, a “Create Team” button and a “Join Team” button. An Admin will have the same view as a regular user with the exception of an extra “Manage Teams” button.

When a user views their profile from the dropdown in the menu bar they will be brought to a page showing their username, email, about, height, weight, and a clickable logo that would open the user’s twitter in a new tab. If a user did not fill the twitter username handle, the clickable twitter logo would not appear.  A registered user would be able to edit their profile by clicking the clickable edit link to change any of their information. In addition to the basic profile user filled during sign up, they would also be able to edit the following element under their profile: About, Height, Weight, and Twitter. There is also an “Edit Courts” button that takes the user to a map view of all of the courts. A user can select any marker on the map and the currently selected court is updated. Once a user is satisfied with a court’s location, they can save it as their primary or secondary court preference. These court preferences impact later on what court is chosen when two teams play against each other.

When a user has joined a team and selects “My Team” in the menu bar under “My Account” they will be taken to their team page. If the users team were to be deleted then the “My Team” option would not appear on the dropdown list.

All users can view any team’s page which will show the name of the team, the league of the team, the number of users, and the users’ names. Under that is a link labeled “Back” that will return the user to the previous page that they were on. However, if the user that is viewing the page is part of the team another link will be available labeled “Leave Team” which will allow the user to leave the team. Doing so will redirect the user to the same page but with a few changes. The “My Team” in the “My Account” dropdown will be gone for the user as well as a warning message will show that the user has left the team. Also the number of users on a team will decrease as well as the name of the user who left will be removed from the users list. If there are no users part of the team, the “User” label will not be displayed. The captain of the team will not have the option to “Leave Team” but instead has “Delete Team” which deletes the entire team. Additionally the captain is able to see two additional links of “Edit Team” and “Manage Team”. Teams cannot be deleted if they are approved. Teams can now be deleted even if they are approved. The schedule page will be updated accordingly with leaving a blank in that team’s position.

A user can create a team by pressing the “Create Team” button on the home page and be redirected to a page asking for the team name and the team league the user wants to be in. The team name must be equal to or less than 30 characters and the team league can be selected from the dropdown menu. The user can press the “Create Team” button to create the team or “Back” to return to the home page. If the user is part of a team they will redirected to the home page after pressing “Create Team” and will be given message as to why. Otherwise the user will go to their new team’s page but instead of a “Back” and “Leave Team” link there will only be a “Continue” link which will bring the user back to the home page. The user that created the team is assigned to be the team’s captain.

The team captain can press “Manage Team” on their teams page this will see two tables with Applied Users and Current Users. Applied users are users who want to join the team. The team captain has the option to either approve or decline their application. The captain can also remove players already on the team, however, captains cannot remove themselves. A captain can appoint another user to be the team captain. Doing so will remove all of the previous captain privileges and will make the captain just a regular user on the team.

If a user presses the “Join Team” button on the home page they will be brought to a table of Approved/Pending/Declined Teams which they can either press “Join” to join the team and be added to the team or to press “Details”. Both options will redirect the user to the team’s page.

If an admin presses the “Manage Teams” button on the home page (which is only visible to the admin) then they are brought to a similar table as the one seen when “Join Team” is pressed. However this time instead the links available are “Details” (which does the same thing that it does in the join team page), “Edit”, “Delete” and also “Approve” and “Decline” if the team is in the pending teams table. Pressing edit will bring the admin to a page allowing them to edit the team’s name or league and to update it or to view the team again or return back to the previous page. If the admin updates the team then they will be redirected to the new team’s page after doing so. If the admin presses “Delete” then simply the team will be deleted and all users who were part of the team will no longer be part of it and can freely join or create another team. If the admin selects “Approve” then the team will move to the approved teams table and the same happens if the admin selects “Decline”. Once a team is approved or declined it cannot be switched back. If a team is already approved for a specific league, then admin will not be able to edit this team’s league level anymore.

The “Manage Users” button (which is only visible to the admin) on the Homepage allows the admin to view each user’s profile page and the date these users are created. More importantly, the admin can either change a regular user to an admin or delete this user if needed. Also an admin can be un-admined. There is one super admin which cannot be deleted or un-admined. Upon deletion a user’s account will not be valid anymore (for example an error will be shown if they try to login).

The “Manage Scores” button on the home page that is visible only to the admin will collect all of the submitted scores from two team captains of the competing teams after each game which are submitted in the schedule section. An admin will review the two submitted scores, and decide the validity of the scores. Upon acceptance of either one of the two scores, the “Scores” column in the schedule page will be updated as well as the standings. Instead of accepting either one of the two scores, admin will review the scores, and enter again by his/her judgement. This gives admin more flexibility in adjusting the scores when both teams give false results.

The game schedules are implemented under the “Schedules” tab. Users can pull the drop-down menu and access game schedules for three different leagues. If the number of approved teams does not reach eight, a message will show up in the schedule page to inform users that they need eight teams to start the league. Once eight teams are approved for a specific league, if admin attempts to add more teams, an error message will pop up and this action will be rejected. When there are exactly eight teams, only admin will now see a “start league” button in the schedule page. Once admin clicks “start league”, the game schedule and standings will be generated and viewable for all users. However, both admin and team captains will not have access to delete teams anymore. After the league is started, the schedule page will also display the games’ information including Date, Time, Scores as well as a Detail button that links to Google Map’s API, which will be implemented in iteration 3. There is also be a “Submit Score” button that’s only visible for team captains. This is where captains enter the score information and send to admin. Once a score is approved by an admin, the captains will not be able to re-submit any more scores. The admin will receive the scores in “Manage Score” as mentioned earlier in the previous story. Once the score is accepted by admin, the updated score will show up in the schedule page under the “Score“ column. The names of the league are changed from Gold/Silver/Bronze to Vancouver/Surrey/Richmond. The date of each game becomes dynamic now meaning that the first game will be five days after the day admin clicks “Start League”. When an approved team in a started league is deleted or if the team captain decides to quit, then the schedule page will update that missing team as “--” for all their games. When clicking into the “See On Map” button, users can view their game location in the Google Maps API. Only the court with the highest points contributed by users in the two competing teams will show when users click “See On Map”. After a league starts, there will also be a “Reset League” button only viewable to admin that is used when a league finishes. Upon clicking “Reset League”, all teams currently in the league will go back to Pending Teams in the “Manage Team” page and have to be approved again if they decide to continue.

When an admin starts a league the best suited court is chosen for each game individually. This is done by taking each user’s primary and secondary court preferences from the two teams and counting them as 2 and 1 points respectively. If a user has no court preferences they do not contribute to the games court calculation. If a user has court selections that are not in the same location as their league, then the court will be ignored. The court with the most points between the two teams is chosen as the court of choice for that particular match. This is done for all of the games in a league. Courts are only calculated once and will not change dynamically during the league’s duration, even if users switch their preferred court.

As a result of updated scores, the standings will also be updated to reflect it. The standings page shows the number of “Games Played”, “Wins”, “Losses” and “Ties” of each team in their league. Each win/tie/loss will gain the team 2/1/0 points that will be updated under the “Points” column.
Teams are sorted from most to least number of points.

Maps page will allow registered user to see league’s location on a map that are generated using Google Maps API (wrapped in gmaps4rails). The user would be able to navigate through different tabs of league (Vancouver, Surrey, Richmond) which would update the links under the map with the location respect to the leagues. At the same time,  markers on the map would get updated depending on the selected tab. User would be able to click on the markers on the map, then the map would pan to that marker, and infobox with the location name would appear on the map itself. The same thing would occur when they clicked on the links under the maps. An admin user would be able to add more locations to the league.

Future Iteration Stories
Below are some point form stories which might possibly be developed.
Admins will be able to write a message to all users on the home page
After teams are matched up, team manager will be able to select where the matchup will take place from the available basketball courts
Admin can add another team to replace any teams that leave in the middle of a league.
Teams can replace another team if they get removed/dropped out of a league
Have the league reset after they finish
Users (including admin) will be able to edit/update their profile information with more detail
After a user signs up, a confirmation message will be sent to their email
Users can reset their password if they forget it
A user can save their address. Doing so the courts could also be calculated by taking the nearest court as the primary court for each user and the 2nd nearest as the secondary court for each user and then those can be used to calculate the location of the court for each game.



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
