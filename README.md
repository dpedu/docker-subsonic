docker-subsonic
===============

[Subsonic](http://www.subsonic.org/pages/index.jsp) in a docker container.

*Usage*

* Build: `docker build -t subsonic .`
* Run: `docker run -d -v /hostpath/music:/var/music -p 4050:4050 -p 4051:4051 subsonic`

*Persistence*

To make the subsonic database persistent, two paths - a dir and a file - need to be persistent. Additionally, Subsonic generates an index of metadata that should be made persistent as well.

* -v /hostpath/subsonic/db:/var/subsonic/db
* -v /hostpath/subsonic/subsonic.properties:/var/subsonic/subsonic.properties
* -v /hostpath/subsonic/db:/var/subsonic/db
* -v /hostpath/subsonic/metadata:/var/subsonic/lucene2

All persistent locations must be read/writable by uid/gid 1000.

*TODO*

* Allow specifying UID for subsonic user on the fly
