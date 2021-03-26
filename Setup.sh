# The following assumes you have launched an AWS EC2 instance as outlined in the README

# Ensure your instance is up-to-date with the following commands
sudo apt-get update -y && sudo apt-get upgrade -y

# Install postgres on your instance
sudo apt install postgresql -y

# Create user, roles, login permissions
# the names and passwords can be modified
sudo su postgres
psql -U postgres -c "CREATE ROLE yourName;"
psql -U postgres -c "ALTER ROLE  yourName  WITH LOGIN;"
psql -U postgres -c "ALTER USER  yourName  CREATEDB;"
psql -U postgres -c "ALTER USER  yourName  WITH PASSWORD 'password';"

# Exit back to the Ubuntu terminal
exit

# You can now confirm if your created user account works, by logging back into postgres
psql postgres -U yourName

# Exit back to the Ubuntu terminal
exit

# Alter the Postgresql Config file, which specifies the main server configuration,
# to listen on all ports. For more on the listen_addresses setting, see
# (https://www.postgresql.org/docs/13/runtime-config-connection.html)
# If the following command does not work, use the route to this file output by
# running sudo find / -name "postgresql.conf"
sudo vim /etc/postgresql/12/main/postgresql.conf

# Edit the listen_address setting (on mine, line 59) to read:
listen_addresses = '*'

# (Ensure you've deleted the # at the beginning of the line)
# If you're unsure of your setup, see the screengrab at
# (https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Listen.png)
# Exit config file after saving

# Open the hba_file, which specifies the configuration file for host-based
# authentication and can only be set at server start. To learn more about thid file,
# see (https://www.postgresql.org/docs/current/auth-pg-hba-conf.html)
# If the following command does not work, use the route to this file output by
# running: sudo find / -name "pg_hba.conf"
sudo vim /etc/postgresql/12/main/pg_hba.conf

# Near the bottom of the file, edit the address for your IPv4 and IPv6 local
# connections as follows, which opens up all IP addesses allowing remote connections.
# This can be configured to your specific server IP address for restricted access.
#IPv4 local connections
host      all      all        0.0.0.0/0       md5
#IPv6 local connections
host      all      all        ::/0            md5

# If you're unsure you've set it correctly, see the screengrab at
# (https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Connections.png)
# Exit config file after saving

# restart the server
sudo systemctl restart postgresql

# You should now be able to connect to your Postgresql db on EC2 via your API
# or with pgAdmin and create your tables

# Using an express server with the pg npm package and Pool connection and the
# postgresql user details from above the config would include the following:

const db = new Pool({
  host: 'the-Public-IPv4-DNS-address-for-your-instance', # it's prefixed 'ec2'
  user: 'yourName',
  password: 'password',
  database: 'postgres',
  port: 5432,
});
