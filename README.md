I am attempting to build kiwix-tools from source in order to get a version of kiwix-serve that supports the `--urlRootLocation` option. I want this because I would like to serve an off-line Wikipedia through a reverse proxy on my home NGINX server.

I am using Docker to make the build process repeatable and to separate the dependency installations from my main system.

Here is a table of all the dependencies that are not retrieved by Docker.

| dependency  | source |
|-------------|--------|
| xapian      | https://oligarchy.co.uk/xapian/1.4.5/xapian-core-1.4.5.tar.xz |
| libzim      | https://github.com/openzim/libzim/tree/2d6522a06bd74efc090ac18699573f7822cffeef |
| pugixml     | https://github.com/zeux/pugixml/releases/download/v1.8/pugixml-1.8.tar.gz |
| kiwix-lib   | https://github.com/kiwix/kiwix-lib/tree/9fc840b3775dbb32eac2de7e1ff2a2c288168e2f |
| kiwix-tools | https://github.com/kiwix/kiwix-tools/tree/426796dc372be33ccf62638b7bbd8a1638601d89 |

Please send help.
