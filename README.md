# Elastic Enterprise Search DEMO

Elatic Enterprise Search software is currently in its third Beta iteration.
It's a great product, that is not 100% integrated with the rest of Elastic's
tools. So, we created this project to start playing with the tool.

It sets up a project with a single instance of Elasticsearch and Kibana plus
the Enterprise Search software. Elasticsearch must be configured with XPack
Security and have a valid Platinum license running. This project enables the
platinum 30 day trial to be able to run the software.

Ansible and Docker is used behing the scenes to make everything work. A simple
bash script was included to simplify the interaction with the project Ansible
playbooks.

## Docker Images

For Elasticsearch and Kibana, we are using the official Docker images.
Unfortunately, there are no official images for the Enterprise Search tool. So,
we must create our own image.

First, dowload the latest version of the software from the downloads site:

[Enterprise Search
download](https://www.elastic.co/downloads/enterprise-search)

Unzip the contents into a new folder, and create a `Dockerfile` based on the
following template:

```Dockerfile
FROM openjdk:11.0.5-stretch	
COPY ./enterprise-search-0.1.0-beta3 /usr/src/enterprise-search	
WORKDIR /usr/src/enterprise-search	
ENTRYPOINT ["bin/enterprise-search"]
```

Then, working inside the Enterprise Search folder  build the image with the following command:

```bash
docker build -t elastic/enterprise-search .
```

## Running the project

Everything included in the project can be handled from the `run.sh` script. You
must give it `execute` permissions for it to work:

```bash
chmod +x ./run.sh
```

After you run it, you'll be presented with the following menu:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 Elastic Enterprise Search DEMO: What do you want to do?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🌵 Select one of the following options:

[1] Run DEMO
[2] Stop DEMO
[3] Edit the passwords.yml file

[R] Restart DEMO
[Z] Exit

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
▶️  Type Number | Press [ENTER]:
```

### Run the DEMO

Select `[1]` from the options. A new menu will be shown:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🏓 Run DEMO: Variables Check
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
state: present
project_path: ../lib
cluster_name: elastic-enterprise-search
network_host: 0.0.0.0
elasticsearch_port: 9200
kibana_port: 5601
enterprise_search_port: 3002
xpack_security_enabled: true
xpack_security_audit_enabled: true
elastic_username: elastic
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[1] Edit variables
[2] Reset variables

[A] Continue
[Z] Exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
▶️  Type Number | Press [ENTER]:
```

Default configurations were created for you inside a variable file called
`vars.yml`. You can edit this information with any text editor, or by using the
form.

The most important variable you must configure, is the `project_path`. This
folder will be used to host all the configuration for the cluster. Including
the `docker-compose.yml` file, and the Elasticsearch, Kibana, and Enterprise
Search configuration. The password information on this files will no be
encrypted, so make sure you store them in a secured location.

When you feel confortable with your configuration `Continue`.

The script will boot all the containers for the first time without
configurations. It will then prompt you to continue configuring the passwords.
Just press `[ENTER]` to let the process continue.

Random passwords will be generated for every key user of the ELK stack. All the
information will be stored inside a file called `passwords.yml` protected using
Ansible Vault.

After the passwords are configured, the script will finish the configuration of
every component, and then it'll restart all the services. It can take almost
5 minutes for the Elastic Enterprise Search service to start for the first
time. The first time credentials of the tool will be returned through the
service logs. To simplify this process, the script waits for the service to be
up, and then crawls the logs to find the credentials. It'll store them with the
other credentials inside the `passwords.yml` file.

After everything is done you can access the tool at `http://localhost:3002`.

### Stopping the project

Run the script, and select the option to stop the DEMO. All the containers,
volumes, and files involved will be deleted.

### Reading protected files

By default, the project uses Ansible Vault to protect any sensible data. This
might be overkill for a DEMO project but its important. Ansible vault requires
a password or key to decrypt the information. You can create this key manually
by adding a file inside the project's root folder called `password`. If you
don't supply it, a random private key will be generated for you.

You must use this key as the vault-id to read or edit any file protected by the
project through Ansible Vault.

For example, after the cluster is up, a file called `passwords.yml` we'll be
created at the root of the project. Here is how you can open that file for
edition:

```bash
ansible-vault edit password.yml
```

**The previous line will only work if you are using the `ansible.cfg` file
stored with the project. You can configure Ansible to use it by setting the
`ANSIBLE_CONFIG` environment variable.**









