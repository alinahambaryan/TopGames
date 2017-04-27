# TopGames
Sample that downloads and visualizes data from twitch 

Feedback on task

It is a well structured task and I appreciate the well structured API I got to work with. Concerning the instructions it is specified that API will by default return 25 games, however actually the default for the API is to return top 10 games. With this minor detail corrected I think the test is a good quick evaluation of iOS skills.

My assumptions

1. Use MVC pattern
2. Prepare quick sample to show list from Twitch API
3. Since API for fetching streams has no limiting option, the top 10 streams for a game are sliced on mobile site.

Alternative approach

Scalable apps, that need to keep modularity and testability would benefit using MVVM design pattern which is not implemented in the sample since it requires more time to prepare additional layers of classes. Data providers would then be presented through interfaces, keeping single responsibility per unit approach.
