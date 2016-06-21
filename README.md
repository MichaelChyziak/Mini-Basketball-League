# Project proposal

##Introduction

The web application that our team will be creating is called, “Mini Basketball League” (MBL) and it targets basketball players of all ages and skill levels. The closest alternatives to this app are recreational leagues which require a payment and event-matching apps which take people of similar interests and matches them together to do activities. Sometimes, when players want to go out and play, their friends may not be available. Our app will allow players to get in touch with others around the area to host or join a basketball game, join a team etc. By gamifying the process of finding people and places to play basketball, players have fun not just while playing basketball, but also before and after.

##Scope, Stories, and Features

MBL provides a community for amateur basketball players and gets them involved in a mini-league simulating the NBA. A twitter-like social media platform will be implemented allowing for updates on games and leagues to be known. When a user first opens the web application, they have the option to login or create a new account. Every player will have their own profile to showcase their basketball related information, the ability to choose their desired team to join, or the option to form their own team by posting a status to recruit other players. Existing users who are not yet a member of a team can send a request to the captain of the team that they would like to join. Alternatively, these users may also choose to create a new team and be the captain of that team. Users can be a member of only one team at a time. An existing user who is a member of a team can choose to quit their team and join another only if their team is not in a league. An existing user who is the captain of their team can accept requests submitted by other users who would like to join their team. The administrator has the ability to delete any user that violates the rules and can also view and edit the database containing all users’ information. Furthermore, the administrator can accept scores and updates submitted by users.

When a team is formed, three types of basketball leagues will be available to choose from, these are beginners, intermediate, and competitors. The captain will represent the team and pick a league based on their team’s level. Once a league has enough teams, each team’s representative will send invitations to each other and set up the time and location of their game with the help of Google Calendar and Google Maps APIs. Pick-up games can also be done for players who are just looking for a quick game with others who are in a close enough proximity to them. There will also be a database available for each league to record overall standings and scores. After each game, the database will be updated and users can post their recorded game highlights in the form of a link from Youtube. Added features may also include MVP (most valuable player) or championship trophies if time allows.

## First Iteration

One of the requirements going forward for the first iteration is to implement a login or sign up screen when the user goes onto our web application. Another requirement is that after the login, there will be the main page that allows the user to edit his/her profile. The last requirement is to implement a feature to allow a user to create a team or to join an existing team.



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

email: "user1@example.com", password: "useruser1"
email: "user2@example.com", password: "useruser2"
email: "user3@example.com", password: "useruser3"
email: "user4@example.com", password: "useruser4"
email: "user5@example.com", password: "useruser5"
email: "user6@example.com", password: "useruser6"
email: "user7@example.com", password: "useruser7"
email: "user8@example.com", password: "useruser8"
email: "user9@example.com", password: "useruser9"

Admin:

email: "admin@xyz.com", password: "notadmin"
