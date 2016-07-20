Hari Sekhon Docker [![DockerHub](https://img.shields.io/badge/docker-available-blue.svg)](https://hub.docker.com/u/harisekhon/)
=========================

Docker Images containing hundreds of my published tools and the supporting technologies to run full functional test suites.

##### Contains 37 repos with around 120 tags (not including 'latest'), many different versions of [official software](https://github.com/HariSekhon/Dockerfiles#official-technologies):

* [My GitHub repos](https://github.com/HariSekhon) with all dependencies pre-built
* Hadoop, NoSQL & OS images used for development and functional test suites

These images are all available pre-built on [My DockerHub](https://hub.docker.com/u/harisekhon/).

### Ready to run Docker images

```
docker search harisekhon
docker run harisekhon/nagios-plugins
```

To see more than the 25 DockerHub repos limited by ```docker search``` ([docker issue 23055](https://github.com/docker/docker/issues/23055)) I wrote ```dockerhub_search.py``` using the DockerHub API, available in my [PyTools github repo](https://github.com/harisekhon/pytools) and as a pre-built docker image:

```
docker run harisekhon/pytools dockerhub_search.py harisekhon
```

There are lots of tagged versions of official software in my repos to allow development testing across multiple versions, usually more versions than available from the official repos (and new version updates available on request, just [raise a GitHub issue](https://github.com/harisekhon/Dockerfiles/issues)).

DockerHub tags are not shown by ```docker search``` ([docker issue 17238](https://github.com/docker/docker/issues/17238)) so I wrote ```dockerhub_show_tags.py``` available in my [PyTools github repo](https://github.com/harisekhon/pytools) and as a pre-built docker image - eg. to see an organized list of all tags for the official CentOS & Ubuntu repos dynamically using the DockerHub API:

```
docker run harisekhon/pytools dockerhub_show_tags.py centos ubuntu
```

### Full Inventory:

##### Official Technologies:

- Alluxio
- Apache Drill (opens Drill shell)
- Cassandra (opens CQL shell, bundled with [nagios-plugins](https://github.com/harisekhon/nagios-plugins))
- Consul
- H2O by 0xdata
- Hadoop (HDFS + Yarn)
- HBase (opens HBase shell)
- Kafka
- Mesos
- Nifi
- Riak
- Riak (bundled with [nagios-plugins](https://github.com/harisekhon/nagios-plugins))
- Serf
- Solr
- SolrCloud
- Spark (opens Spark shell)
- Tachyon
- ZooKeeper (opens ZK shell)

Repos suffixed with ```-dev``` are the official technologies + development & debugging tools + my github repos with all dependencies pre-built.

##### My GitHub Repos (with all libs + deps pre-built):

- [Advanced Nagios Plugins Collection](https://github.com/harisekhon/nagios-plugins) - 250+ nagios plugins for every Hadoop distribution and every major NoSQL technology - Hadoop, Redis, Elasticsearch, Solr, HBase, Cassandra & DataStax OpsCenter, MongoDB, MySQL, Kafka, Riak, Memcached, Couchbase, Mesos, Spark, Neo4j, Datameer, H2O, WanDisco, Yarn, HDFS, Impala, Apache Drill, ZooKeeper, Cloudera, Hortonworks, MapR, IBM BigInsights, Infrastructure - Linux, DNS, Whois, SSL Certs, NoSQL APIs etc
- [Perl Tools](https://github.com/harisekhon/tools) - 25+ Hadoop, Hive, Solr, Linux, SQL, Ambari, Datameer, Web and various Linux CLI Tools
- [Python Tools](https://github.com/harisekhon/pytools) - 25+ Hadoop, Spark, Pig, Ambari Blueprints, AWS CloudFormation, Linux, Data Converters & Validators (Avro/Parquet/JSON/CSV/XML/YAML), Elasticsearch, Solr, IPython - CLI tools
- [Spotify Tools](https://github.com/harisekhon/spotify-tools) - Backup & Play Automation: Spotify Lookup - converts Spotify URIs to 'Artist - Track' form by querying the Spotify Metadata API. Spotify Cmd - command line control of Spotify on Mac via AppleScript for automation, auto timed track flick through etc.

- CentOS + all Github repos pre-built
- Debian + all Github repos pre-built
- Ubuntu + all Github repos pre-built

##### Base Images:

- CentOS latest (Dev) with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect, EPEL etc.
- Debian latest (Dev) with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect etc.
- Ubuntu latest (Dev) with Java JDK, Perl, Python, Jython, Ruby, Scala, Groovy, GCC, Maven, SBT, Gradle, Make, Expect etc.

###### Base Images + Java / Scala:

All builds use OpenJDK with ```jre``` and ```jdk``` numbered tags. See this article below for why it might be illegal to bundle Oracle Java (and why no Linux distributions do this either):

https://www.javacodegeeks.com/2016/03/running-java-docker-youre-breaking-law.html

- CentOS latest combinations of Java 7/8 and Scala 2.10/2.11
- Debian latest with Java 7
- Ubuntu 14.04 with Java 7
- Ubuntu latest with Java 8, 9

### To Build from Dockerfile + source yourself

```
git clone https://github/harisekhon/Dockerfiles

cd Dockerfiles
```

To build all Docker images:

```
make
```

To build a specific Docker image, enter it's directory and run make:

```
cd nagios-plugins

make
```

### Support

Please raise tickets for issues and improvements at https://github.com/harisekhon/dockerfiles/issues
