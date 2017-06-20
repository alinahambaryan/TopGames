
#iOS Test

Thank you for taking this test. Read the following instructions carefully and follow them as closely as possible. Feel free to ask question or make your own assumptions. If you do, document them!

We recommend that you take notes about the steps you take and the time you spent on this test right from the start. We also appreciate any feedback you have about the test itself.

The solution you create for this test should be your own, not someone else's.

#The Task

The purpose of the test is to let you solve a similar task and thus give us an idea for how you would go about to solve such an assignment.

Your task therefore is to develop an iOS app using Swift that can download and visualize data from twitch (a streaming service for gaming content). The data can be fetched from the twitch.tv API. Using this API you should visualize what games are popular at the moment and what streams are popular for every individual game.

#The Specifics

In order to access the twitch API you are required to provide a header called Client-ID. For this test feel free to use the Client-ID: “lb715ejwkdwk9b9ljrtowl1nj595kf8”.

An example curl request could be:

curl -i -H 'Client-ID: lb715ejwkdwk9b9ljrtowl1nj595kf8'\ 'https://api.twitch.tv/kraken/channels/twitch'

The main endpoint you should use is https://api.twitch.tv/kraken/games/top. There you will receive a JSON response of the 25 most popular games as a default response. What we are interested in are the top 5 most popular games.

The games should then be placed in a list, ordered from most popular to least popular. Each list item should at least contain the image of the game, the name of the game and the viewer count.

By clicking on one of the list items it should be possible to be taken to another list of the 10 top most viewed streams of that game. The endpoint for getting this information is https://api.twitch.tv/kraken/streams?game=[game].

The list of streams should again be ordered from most popular to least popular and each item should show at least the image of the stream, name of the stream and viewer count of the stream.

page1image20720  page1image20880  page1image21040  page1image21200 page1image21360
What tools can I use?

There are no limitations to what libraries you can use and you are free to use whatever tools you want to complete the task.
The only limitation is that the code is written in Swift by you. This means that you can not write the code in Xamarin/React Native/Phone Gap etc.

#Delivery

The test should preferably be delivered using a git service, for instance github or bitbucket. Alternatively you can send us a link to an archive of your project (zip file or similar).

This delivery should as a minimum of documentation contain a README file describing the project and how you went about on implementing the project.

The README should also contain a reflective section where you write about what you could have done better or what is missing. That section could even contain ideas about new features or improvements for how you would expand the app if it was a real app that was going out on the market.


# TopGames- Response
Sample that downloads and visualizes data from twitch 

Feedback on task

It is an interesting task and I appreciate the well structured API. Concerning the instructions it is specified that API will by default return 25 games, however actually the default for the API is to return top 10 games. With this minor detail corrected I think the test is a good quick evaluation of iOS skills.

My assumptions

1. Use MVC pattern
2. Prepare quick sample to show list from Twitch API

Alternative approach

Scalable apps, that need to keep modularity and testability would benefit using MVVM design pattern which is not implemented in the sample since it requires more time to prepare additional layers of classes. Data providers would then be presented through interfaces, keeping single responsibility per unit approach.
