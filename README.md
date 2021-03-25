# PostgresOnEC2

The purpose of this repo is to offer a solution for running Postgres on a free AWS EC2 instance rather than with RDS. This is not intended for production level implementations, but rather personal development where you need a working but free cloud database.

## Initial Setup

### Launch an AWS EC2 Instance
For this I will be using the Ubuntu 20.04 server available with the free tier
<img src="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Ubuntu.png" alt="Ubuntu 20"/>

### EC2 Config
1. The t2.micro is available for free
2. Instance details can remain the same
3. Choose storage capacity relevent to your project (free tier allows 30gb)
4. Tags are not necessary, but feel free to add some
5. Security Groups
Inbound Rules should reflect a Postgres db as follows (the SSH is necessary for connecting to the instance).
These can also be configured to only apply to your IP address by choosing "MyIP" in the dropdown
<img src="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Inbound.png" alt="Inbound Rules"/>

6. Review and Launch
You can now also confirm that your outbound rules are as follows
<img src="https://github.com/JacobWPeterson/PostgresOnEC2/blob/main/Screengrabs/Outbound.png" alt="Outbound Rules"/>

### Connect to Instance
1. From your new instance's main page, click connect in the upper right
2. Copy the chmod command and run in your terminal to hide your PEM
3. Copy the 'ssh' prefixed command and run it in your terminal to connect to the instance

### Now follow the steps in Setup.sh
