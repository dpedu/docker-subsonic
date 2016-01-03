docker-subsonic
===============

[Subsonic](http://www.subsonic.org/pages/index.jsp) in a docker container.

*Usage*

* Build: `docker build -t subsonic .`
* Run: `docker run -d -v /hostpath/music:/var/music -p 4050:4050 -p 4051:4051 subsonic`

*Persistence*

To make the subsonic database persistent, a file and a dir must be mounted to the host:

* -v /hostpath/subsonic/db:/var/subsonic/db
* -v /hostpath/subsonic/subsonic.properties:/var/subsonic/subsonic.properties

Both locations must be read/writable by uid 1000.

*TODO*

* Allow specifying UID for subsonic user on the fly
