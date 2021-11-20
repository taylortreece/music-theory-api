<h1>♩ ♪ ♬ Music Theory API ♬ ♪ ♩</h1>

![](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)

This Music Theory API is what has produced the data to build the Music Theory Coordinator <a href="https://music-theory-coordinator.netlify.app/">Song Workshop</a> sandbox.

This API has been build for the specific intent of giving feeding chords and scales into hand crafted algorithm to return JSON files representing the data found in a <a href="https://en.wikipedia.org/wiki/Key_(music)">key</a>.

This database could be hosted live if you wish, but I find it the most useful when it returns JSON data I can then store in a frontend application. This keeps the music theory queries efficient and cheap. 

There are two Models in which chord and scale formulas can be inserted: scale.rb and chord.rb. In these, you can add methods filled with data such as the name and intervals of the object you would like to create.

If you have any questions, please feel free to reach out. Happy coding :)
