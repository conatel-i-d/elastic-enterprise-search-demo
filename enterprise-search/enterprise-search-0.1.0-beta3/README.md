# Elastic Enterprise Search

Search anything, anywhere.

Thanks for downloading the Enterprise Search beta.

Please send us an email to provide feedback or report bugs: [enterprise-search-beta-feedback@elastic.co](mailto:enterprise-search-beta-feedback@elastic.co).

We hope you like it!

## Requirements

**Supported platforms**:

* Linux: x86_64 only
* MacOS X: High Sierra 10.13 - 10.1x (64 bit only)
* Windows: Not supported

**Minimum hardware**:

* ~4GB of free RAM or 6GB if Elasticsearch is running on the same machine.
  * 2GB for App Server.
  * 2GB for Worker.
  * 50Mb for [Filebeat](https://www.elastic.co/products/beats/filebeat) and other processes.
* 5GB of disk space available.

**Dependencies**:

* [Java 8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) or [Java 11](https://www.oracle.com/technetwork/java/javase/downloads/jdk11-downloads-5066655.html).
* Licensed [Elasticsearch](https://www.elastic.co/downloads/elasticsearch) 7.4.x.

**License**:

* Enterprise Search requires a Platinum Elasticsearch license.
  - A 30 day **Platinum** trial license can be activated during setup.

## Quick Start

First, you’ll need to get Elasticsearch up and running with security features:

1. Download [Elasticsearch 7.4.x](https://www.elastic.co/downloads/past-releases/elasticsearch-7-4-0) and enter the directory.

2. Edit `config/elasticsearch.yml` and add:

    `xpack.security.enabled: true`

3. Run the binary and start Elasticsearch:

    `$ bin/elasticsearch`

4. Generate a random password for the Elastic user:

    `$ bin/elasticsearch-setup-passwords auto`

The second part is done within Enterprise Search:

1. Download [Enterprise Search beta 3](https://www.elastic.co/downloads/enterprise-search) and enter the directory.

2. Edit `config/enterprise-search.yml` and add:

```yml
    ent_search.auth.source: standard
    elasticsearch.username: elastic
    elasticsearch.password: [ELASTIC_USER_PASSWORD]
    allow_es_settings_modification: true
```

3. Start Enterprise Search:

  `$ bin/enterprise-search`

Retrieve the default login credentials from the console’s output.

And that’s it!

Visit http://localhost:3002 and login to Enterprise Search with the default credentials.

**Reminder: beta software is not fit for production usage!**

Refer to the [documentation](https://swiftype.com/documentation/enterprise-search) for full assistance.
