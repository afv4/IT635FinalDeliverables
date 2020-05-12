# IT635 Final Project Deliverable
## Proposal: "Blockbuster Returns"
## Author: Ayrton Ventura
### Date: May 9th, 2020
##### By the way, I don't own Blockbuster at all. This is just an educational project.
-------------------------------------

###Details regarding the original submission (made before COVID-19 lockdown):

Long ago, in the distant age of the 90s and early 2000s, DVD/CD rentals were one of the top entertainment markets in the country. Blockbuster was a household name and returning movies on a due date was a thing on people's calendars because nobody wanted late fees. Back then, those companies required the use of custom database management systems in order to handle the millions of customers that would rent from the stores. Nowadays, the renting of physical mediums is long gone due to the digital age, but those that want to go "retro" still exist. There are many to this day who are willing to go buy the Special Deluxe Blue-Ray release of "Avengers: Endgame", grab the Collector's Edition of "Final Fantasy VII Remake" for the PlayStation 4, or ask a friend to borrow their copy of a game they got so they can try it out for themselves. If Blockbuster were to return and laws were to change to allow DVD/CD renting once again, they would still be able to prosper in the modern market since there are those that still support the physical media as "the better version".
My project proposal is designing a DVD/CD Rental Database that is fit for the modern times that encompasses various methods of payment (physical money, credit/debit, and special store account {optional}, etc), rental features (rates, late fees, interest, accumulation, sending warning emails, etc), different forms of media to rent (movies, games {varied formats}, music, etc), and implementing standard security features in order to protect the private information of the customers (password hashing, login pages for admins vs customer, etc). There will be a Front-End Webpage that will be used to modify the contents of the Database as needed, with automatic daily backups in order to keep records up to date and secure.

###Instructions of Use:

Simply running "docker-compose up" when the contents of this repo are input into a directory {and inside of said directory} will bring up the fake "blockbuster" database.

There is a Adminer page at "localhost:8080". Root access is granted with:
username: root
password: rootadmin

There is a user with limited database access that can be accessed through Adminer:
username: admin
password: 22222

Enjoy exploring the fake data!

###Final Result:

Unfortunately, I was unable to achieve a fully featured the promised customer front end; however, I was able to program most of the backend database within a docker container, complete with some false data.

Also, there is a nice little easter egg if you go to "localhost:8888" on an active internet browser with the container active. Just for fun!